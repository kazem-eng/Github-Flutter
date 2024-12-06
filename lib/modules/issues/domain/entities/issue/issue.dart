import 'package:flutter/foundation.dart';

import 'package:flutter_issues_viewer/modules/issues/data/models/issue/issue_data_model.dart';
import 'package:flutter_issues_viewer/modules/issues/domain/entities/issue/label.dart';
import 'package:flutter_issues_viewer/modules/issues/domain/entities/issue/user.dart';

class Issue {
  const Issue({
    this.id = -1,
    this.number = -1,
    this.title = '',
    this.labels = const [],
    this.state = '',
    this.body = '',
    this.user = const SimpleUser(),
    this.isViewed = false,
  });

  factory Issue.fromData(IssueDataModel issue) {
    const base = Issue();
    final fromData = Issue(
      id: issue.id ?? base.id,
      number: issue.number ?? base.number,
      state: issue.state ?? base.state,
      title: issue.title ?? base.title,
      body: issue.body ?? base.body,
      user: issue.user == null ? base.user : SimpleUser.fromData(issue.user!),
      labels: issue.labels == null
          ? base.labels
          : issue.labels!.map((e) => Label.fromData(e)).toList(),
    );
    return fromData;
  }

  final int id;
  final int number;
  final String state;
  final String title;
  final String body;
  final SimpleUser user;
  final List<Label> labels;

  // internal
  final bool isViewed;

  @override
  bool operator ==(covariant Issue other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.number == number &&
        other.state == state &&
        other.title == title &&
        other.body == body &&
        other.user == user &&
        listEquals(other.labels, labels) &&
        other.isViewed == isViewed;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        number.hashCode ^
        state.hashCode ^
        title.hashCode ^
        body.hashCode ^
        user.hashCode ^
        labels.hashCode ^
        isViewed.hashCode;
  }

  Issue copyWith({
    int? id,
    int? number,
    String? state,
    String? title,
    String? body,
    SimpleUser? user,
    List<Label>? labels,
    bool? isViewed,
  }) {
    return Issue(
      id: id ?? this.id,
      number: number ?? this.number,
      state: state ?? this.state,
      title: title ?? this.title,
      body: body ?? this.body,
      user: user ?? this.user,
      labels: labels ?? this.labels,
      isViewed: isViewed ?? this.isViewed,
    );
  }
}

import 'package:flutter/foundation.dart';

import 'package:flutter_issues_viewer/modules/data/models/issue/issue_data_model.dart';
import 'package:flutter_issues_viewer/modules/domain/entities/issue/label.dart';
import 'package:flutter_issues_viewer/modules/domain/entities/issue/user.dart';

class Issue {
  const Issue({
    this.id = -1,
    this.number = -1,
    this.title = '',
    this.labels = const [],
    this.createdAt,
    this.updatedAt,
    this.state = '',
    this.body = '',
    this.user = const SimpleUser(),
    this.closedAt,
    this.closedBy = const SimpleUser(),
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
      closedAt: issue.closedAt != null
          ? DateTime.tryParse(issue.closedAt!)
          : base.closedAt,
      createdAt: issue.createdAt != null
          ? DateTime.parse(issue.createdAt!)
          : base.createdAt,
      updatedAt: issue.updatedAt != null
          ? DateTime.tryParse(issue.updatedAt!)
          : base.updatedAt,
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
  final DateTime? closedAt;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final SimpleUser closedBy;

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
        other.closedAt == closedAt &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt &&
        other.closedBy == closedBy &&
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
        closedAt.hashCode ^
        createdAt.hashCode ^
        updatedAt.hashCode ^
        closedBy.hashCode ^
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
    DateTime? closedAt,
    DateTime? createdAt,
    DateTime? updatedAt,
    SimpleUser? closedBy,
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
      closedAt: closedAt ?? this.closedAt,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      closedBy: closedBy ?? this.closedBy,
      isViewed: isViewed ?? this.isViewed,
    );
  }
}

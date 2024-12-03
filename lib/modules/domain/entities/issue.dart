import 'dart:ui';

import 'package:flutter/foundation.dart';

import 'package:flutter_issues_viewer/modules/data/models/issue_data_model.dart';

class Issue {
  const Issue({
    this.id = -1,
    this.number = -1,
    this.title = '',
    this.labels = const [],
    this.locked = false,
    this.comments = -1,
    this.createdAt,
    this.updatedAt,
    this.draft = false,
    this.nodeId = '',
    this.url = '',
    this.repositoryUrl = '',
    this.labelsUrl = '',
    this.commentsUrl = '',
    this.eventsUrl = '',
    this.htmlUrl = '',
    this.state = '',
    this.authorAssociation = '',
    this.stateReason = '',
    this.body = '',
    this.user = const SimpleUser(),
    this.assignee = const SimpleUser(),
    this.assignees = const [],
    this.activeLockReason = '',
    this.closedAt,
    this.closedBy = const SimpleUser(),
    this.isViewed = false,
  });

  factory Issue.fromData(IssueDataModel issue) {
    const base = Issue();
    final fromData = Issue(
      id: issue.id ?? base.id,
      nodeId: issue.nodeId ?? base.nodeId,
      url: issue.url ?? base.url,
      repositoryUrl: issue.repositoryUrl ?? base.repositoryUrl,
      labelsUrl: issue.labelsUrl ?? base.labelsUrl,
      commentsUrl: issue.commentsUrl ?? base.commentsUrl,
      eventsUrl: issue.eventsUrl ?? base.eventsUrl,
      htmlUrl: issue.htmlUrl ?? base.htmlUrl,
      number: issue.number ?? base.number,
      state: issue.state ?? base.state,
      stateReason: issue.stateReason ?? base.stateReason,
      title: issue.title ?? base.title,
      body: issue.body ?? base.body,
      user: issue.user == null ? base.user : SimpleUser.fromData(issue.user!),
      labels: issue.labels == null
          ? base.labels
          : issue.labels!.map((e) => Label.fromData(e)).toList(),
      assignee: issue.assignee == null
          ? base.assignee
          : SimpleUser.fromData(issue.assignee!),
      assignees: issue.assignees == null
          ? base.assignees
          : issue.assignees!.map((e) => SimpleUser.fromData(e)).toList(),
      locked: issue.locked ?? base.locked,
      activeLockReason: issue.activeLockReason ?? base.activeLockReason,
      comments: issue.comments ?? base.comments,
      closedAt: issue.closedAt != null
          ? DateTime.tryParse(issue.closedAt!)
          : base.closedAt,
      createdAt: issue.createdAt != null
          ? DateTime.parse(issue.createdAt!)
          : base.createdAt,
      updatedAt: issue.updatedAt != null
          ? DateTime.tryParse(issue.updatedAt!)
          : base.updatedAt,
      draft: issue.draft ?? base.draft,
      closedBy: issue.closedBy == null
          ? base.closedBy
          : SimpleUser.fromData(issue.closedBy!),
      authorAssociation: issue.authorAssociation ?? base.authorAssociation,
    );
    return fromData;
  }

  final int id;
  final String nodeId;
  final String url;
  final String repositoryUrl;
  final String labelsUrl;
  final String commentsUrl;
  final String eventsUrl;
  final String htmlUrl;
  final int number;
  final String state;
  final String stateReason;
  final String title;
  final String body;
  final SimpleUser user;
  final List<Label> labels;
  final SimpleUser assignee;
  final List<SimpleUser> assignees;
  final bool locked;
  final String activeLockReason;
  final int comments;
  final DateTime? closedAt;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final bool draft;
  final SimpleUser closedBy;
  final String authorAssociation;

  // internal
  final bool isViewed;
  @override
  bool operator ==(covariant Issue other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.nodeId == nodeId &&
        other.url == url &&
        other.repositoryUrl == repositoryUrl &&
        other.labelsUrl == labelsUrl &&
        other.commentsUrl == commentsUrl &&
        other.eventsUrl == eventsUrl &&
        other.htmlUrl == htmlUrl &&
        other.number == number &&
        other.state == state &&
        other.stateReason == stateReason &&
        other.title == title &&
        other.body == body &&
        other.user == user &&
        listEquals(other.labels, labels) &&
        other.assignee == assignee &&
        listEquals(other.assignees, assignees) &&
        other.locked == locked &&
        other.activeLockReason == activeLockReason &&
        other.comments == comments &&
        other.closedAt == closedAt &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt &&
        other.draft == draft &&
        other.closedBy == closedBy &&
        other.authorAssociation == authorAssociation &&
        other.isViewed == isViewed;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        nodeId.hashCode ^
        url.hashCode ^
        repositoryUrl.hashCode ^
        labelsUrl.hashCode ^
        commentsUrl.hashCode ^
        eventsUrl.hashCode ^
        htmlUrl.hashCode ^
        number.hashCode ^
        state.hashCode ^
        stateReason.hashCode ^
        title.hashCode ^
        body.hashCode ^
        user.hashCode ^
        labels.hashCode ^
        assignee.hashCode ^
        assignees.hashCode ^
        locked.hashCode ^
        activeLockReason.hashCode ^
        comments.hashCode ^
        closedAt.hashCode ^
        createdAt.hashCode ^
        updatedAt.hashCode ^
        draft.hashCode ^
        closedBy.hashCode ^
        authorAssociation.hashCode ^
        isViewed.hashCode;
  }

  Issue copyWith({
    int? id,
    String? nodeId,
    String? url,
    String? repositoryUrl,
    String? labelsUrl,
    String? commentsUrl,
    String? eventsUrl,
    String? htmlUrl,
    int? number,
    String? state,
    String? stateReason,
    String? title,
    String? body,
    SimpleUser? user,
    List<Label>? labels,
    SimpleUser? assignee,
    List<SimpleUser>? assignees,
    bool? locked,
    String? activeLockReason,
    int? comments,
    DateTime? closedAt,
    DateTime? createdAt,
    DateTime? updatedAt,
    bool? draft,
    SimpleUser? closedBy,
    String? authorAssociation,
    bool? isViewed,
  }) {
    return Issue(
      id: id ?? this.id,
      nodeId: nodeId ?? this.nodeId,
      url: url ?? this.url,
      repositoryUrl: repositoryUrl ?? this.repositoryUrl,
      labelsUrl: labelsUrl ?? this.labelsUrl,
      commentsUrl: commentsUrl ?? this.commentsUrl,
      eventsUrl: eventsUrl ?? this.eventsUrl,
      htmlUrl: htmlUrl ?? this.htmlUrl,
      number: number ?? this.number,
      state: state ?? this.state,
      stateReason: stateReason ?? this.stateReason,
      title: title ?? this.title,
      body: body ?? this.body,
      user: user ?? this.user,
      labels: labels ?? this.labels,
      assignee: assignee ?? this.assignee,
      assignees: assignees ?? this.assignees,
      locked: locked ?? this.locked,
      activeLockReason: activeLockReason ?? this.activeLockReason,
      comments: comments ?? this.comments,
      closedAt: closedAt ?? this.closedAt,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      draft: draft ?? this.draft,
      closedBy: closedBy ?? this.closedBy,
      authorAssociation: authorAssociation ?? this.authorAssociation,
      isViewed: isViewed ?? this.isViewed,
    );
  }

  @override
  String toString() {
    return 'Issue(id: $id, nodeId: $nodeId, url: $url, repositoryUrl: $repositoryUrl, labelsUrl: $labelsUrl, commentsUrl: $commentsUrl, eventsUrl: $eventsUrl, htmlUrl: $htmlUrl, number: $number, state: $state, stateReason: $stateReason, title: $title, body: $body, user: $user, labels: $labels, assignee: $assignee, assignees: $assignees, locked: $locked, activeLockReason: $activeLockReason, comments: $comments, closedAt: $closedAt, createdAt: $createdAt, updatedAt: $updatedAt, draft: $draft, closedBy: $closedBy, authorAssociation: $authorAssociation, isViewed: $isViewed)';
  }
}

class SimpleUser {
  const SimpleUser({
    this.id = -1,
    this.siteAdmin = false,
    this.login = '',
    this.nodeId = '',
    this.avatarUrl = '',
    this.url = '',
    this.htmlUrl = '',
    this.followersUrl = '',
    this.followingUrl = '',
    this.gistsUrl = '',
    this.starredUrl = '',
    this.subscriptionsUrl = '',
    this.organizationsUrl = '',
    this.reposUrl = '',
    this.eventsUrl = '',
    this.receivedEventsUrl = '',
    this.type = '',
  });

  factory SimpleUser.fromData(SimpleUserDataModel user) {
    const base = SimpleUser();
    return SimpleUser(
      id: user.id ?? base.id,
      siteAdmin: user.siteAdmin ?? base.siteAdmin,
      login: user.login ?? base.login,
      nodeId: user.nodeId ?? base.nodeId,
      avatarUrl: user.avatarUrl ?? base.avatarUrl,
      url: user.url ?? base.url,
      htmlUrl: user.htmlUrl ?? base.htmlUrl,
      followersUrl: user.followersUrl ?? base.followersUrl,
      followingUrl: user.followingUrl ?? base.followingUrl,
      gistsUrl: user.gistsUrl ?? base.gistsUrl,
      starredUrl: user.starredUrl ?? base.starredUrl,
      subscriptionsUrl: user.subscriptionsUrl ?? base.subscriptionsUrl,
      organizationsUrl: user.organizationsUrl ?? base.organizationsUrl,
      reposUrl: user.reposUrl ?? base.reposUrl,
      eventsUrl: user.eventsUrl ?? base.eventsUrl,
      receivedEventsUrl: user.receivedEventsUrl ?? base.receivedEventsUrl,
      type: user.type ?? base.type,
    );
  }

  final String login;
  final int id;
  final String nodeId;
  final String avatarUrl;
  final String url;
  final String htmlUrl;
  final String followersUrl;
  final String followingUrl;
  final String gistsUrl;
  final String starredUrl;
  final String subscriptionsUrl;
  final String organizationsUrl;
  final String reposUrl;
  final String eventsUrl;
  final String receivedEventsUrl;
  final String type;
  final bool siteAdmin;
}

class Label {
  const Label({
    this.id = -1,
    this.defaultLabel = false,
    this.nodeId = '',
    this.url = '',
    this.name = '',
    this.description = '',
    this.color = '',
    this.isColorDark = false,
    this.colorF,
  });

  factory Label.fromData(LabelDataModel label) {
    const base = Label();
    final newColor = label.color ?? base.color;
    final colorF = newColor.isEmpty ? null : Color(int.parse('0xFF$newColor'));
    return Label(
      id: label.id ?? base.id,
      nodeId: label.nodeId ?? base.nodeId,
      url: label.url ?? base.url,
      name: label.name ?? base.name,
      description: label.description ?? base.description,
      color: label.color ?? base.color,
      defaultLabel: label.defaultLabel ?? base.defaultLabel,
      isColorDark: Label._isColorDark(newColor, colorF),
      colorF: colorF,
    );
  }

  final int id;
  final String nodeId;
  final String url;
  final String name;
  final String description;
  final String color;
  final bool defaultLabel;

  // internal
  final bool isColorDark;
  final Color? colorF;

  static bool _isColorDark(String color, Color? colorF) {
    if (color.isEmpty || colorF == null) {
      return false;
    }
    return (colorF.red * 299 + colorF.green * 587 + colorF.blue * 114) / 1000 <
        128;
  }
}

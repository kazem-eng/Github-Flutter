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
  });

  factory Issue.fromData(IssueDataModel issue) {
    const base = Issue();
    return Issue(
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
      closedAt: issue.closedAt ?? base.closedAt,
      createdAt: issue.createdAt ?? base.createdAt,
      updatedAt: issue.updatedAt ?? base.updatedAt,
      draft: issue.draft ?? base.draft,
      closedBy: issue.closedBy == null
          ? base.closedBy
          : SimpleUser.fromData(issue.closedBy!),
      authorAssociation: issue.authorAssociation ?? base.authorAssociation,
    );
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
  });

  factory Label.fromData(LabelDataModel label) {
    const base = Label();
    return Label(
      id: label.id ?? base.id,
      nodeId: label.nodeId ?? base.nodeId,
      url: label.url ?? base.url,
      name: label.name ?? base.name,
      description: label.description ?? base.description,
      color: label.color ?? base.color,
      defaultLabel: label.defaultLabel ?? base.defaultLabel,
    );
  }

  final int id;
  final String nodeId;
  final String url;
  final String name;
  final String description;
  final String color;
  final bool defaultLabel;
}

import 'package:json_annotation/json_annotation.dart';

part 'issue_data_model.g.dart';

@JsonSerializable(explicitToJson: true)
class Issue {
  Issue({
    this.id,
    this.number,
    this.title,
    this.labels,
    this.locked,
    this.comments,
    this.createdAt,
    this.updatedAt,
    this.draft,
    this.nodeId,
    this.url,
    this.repositoryUrl,
    this.labelsUrl,
    this.commentsUrl,
    this.eventsUrl,
    this.htmlUrl,
    this.state,
    this.authorAssociation,
    this.stateReason,
    this.body,
    this.user,
    this.assignee,
    this.assignees,
    this.activeLockReason,
    this.closedAt,
    this.closedBy,
  });

  factory Issue.fromJson(Map<String, dynamic> json) => _$IssueFromJson(json);

  final int? id;
  final String? nodeId;
  final String? url;
  final String? repositoryUrl;
  final String? labelsUrl;
  final String? commentsUrl;
  final String? eventsUrl;
  final String? htmlUrl;
  final int? number;
  final String? state;
  final String? stateReason;
  final String? title;
  final String? body;
  final SimpleUser? user;
  final List<Label>? labels;
  final SimpleUser? assignee;
  final List<SimpleUser>? assignees;
  final bool? locked;
  final String? activeLockReason;
  final int? comments;
  final DateTime? closedAt;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final bool? draft;
  final SimpleUser? closedBy;
  final String? authorAssociation;

  Map<String, dynamic> toJson() => _$IssueToJson(this);
}

@JsonSerializable()
class SimpleUser {
  SimpleUser({
    this.id,
    this.siteAdmin,
    this.login,
    this.nodeId,
    this.avatarUrl,
    this.url,
    this.htmlUrl,
    this.followersUrl,
    this.followingUrl,
    this.gistsUrl,
    this.starredUrl,
    this.subscriptionsUrl,
    this.organizationsUrl,
    this.reposUrl,
    this.eventsUrl,
    this.receivedEventsUrl,
    this.type,
  });

  factory SimpleUser.fromJson(Map<String, dynamic> json) =>
      _$SimpleUserFromJson(json);

  final String? login;
  final int? id;
  final String? nodeId;
  final String? avatarUrl;
  final String? url;
  final String? htmlUrl;
  final String? followersUrl;
  final String? followingUrl;
  final String? gistsUrl;
  final String? starredUrl;
  final String? subscriptionsUrl;
  final String? organizationsUrl;
  final String? reposUrl;
  final String? eventsUrl;
  final String? receivedEventsUrl;
  final String? type;
  final bool? siteAdmin;

  Map<String, dynamic> toJson() => _$SimpleUserToJson(this);
}

@JsonSerializable()
class Label {
  Label({
    this.id,
    this.defaultLabel,
    this.nodeId,
    this.url,
    this.name,
    this.description,
    this.color,
  });

  factory Label.fromJson(Map<String, dynamic> json) => _$LabelFromJson(json);

  final int? id;
  final String? nodeId;
  final String? url;
  final String? name;
  final String? description;
  final String? color;
  final bool? defaultLabel;

  Map<String, dynamic> toJson() => _$LabelToJson(this);
}

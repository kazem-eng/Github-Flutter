import 'package:json_annotation/json_annotation.dart';

part 'issue_data_model.g.dart';

@JsonSerializable()
class IssueDataModel {
  IssueDataModel({
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

  factory IssueDataModel.fromJson(Map<String, dynamic> json) =>
      _$IssueDataModelFromJson(json);

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
  final SimpleUserDataModel? user;
  final List<LabelDataModel>? labels;
  final SimpleUserDataModel? assignee;
  final List<SimpleUserDataModel>? assignees;
  final bool? locked;
  final String? activeLockReason;
  final int? comments;
  final DateTime? closedAt;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final bool? draft;
  final SimpleUserDataModel? closedBy;
  final String? authorAssociation;

  Map<String, dynamic> toJson() => _$IssueDataModelToJson(this);
}

@JsonSerializable()
class SimpleUserDataModel {
  SimpleUserDataModel({
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

  factory SimpleUserDataModel.fromJson(Map<String, dynamic> json) =>
      _$SimpleUserDataModelFromJson(json);

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

  Map<String, dynamic> toJson() => _$SimpleUserDataModelToJson(this);
}

@JsonSerializable()
class LabelDataModel {
  LabelDataModel({
    this.id,
    this.defaultLabel,
    this.nodeId,
    this.url,
    this.name,
    this.description,
    this.color,
  });

  factory LabelDataModel.fromJson(Map<String, dynamic> json) =>
      _$LabelDataModelFromJson(json);

  final int? id;
  final String? nodeId;
  final String? url;
  final String? name;
  final String? description;
  final String? color;
  final bool? defaultLabel;

  Map<String, dynamic> toJson() => _$LabelDataModelToJson(this);
}

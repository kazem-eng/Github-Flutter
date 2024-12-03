import 'package:json_annotation/json_annotation.dart';

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

  factory IssueDataModel.fromJson(Map<String, dynamic> json) {
    final data = IssueDataModel(
      id: json['id'] as int?,
      nodeId: json['node_id'] as String?,
      url: json['url'] as String?,
      repositoryUrl: json['repository_url'] as String?,
      labelsUrl: json['labels_url'] as String?,
      commentsUrl: json['comments_url'] as String?,
      eventsUrl: json['events_url'] as String?,
      htmlUrl: json['html_url'] as String?,
      number: json['number'] as int?,
      state: json['state'] as String?,
      stateReason: json['state_reason'] as String?,
      title: json['title'] as String?,
      body: json['body'] as String?,
      user: json['user'] == null
          ? null
          : SimpleUserDataModel.fromJson(json['user'] as Map<String, dynamic>),
      labels: json['labels']
          ?.map<LabelDataModel>(
            (e) => LabelDataModel.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
      assignee: json['assignee'] == null
          ? null
          : SimpleUserDataModel.fromJson(
              json['assignee'] as Map<String, dynamic>,
            ),
      assignees: json['assignees']
          ?.map<SimpleUserDataModel>(
            (e) => SimpleUserDataModel.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
      locked: json['locked'] as bool?,
      activeLockReason: json['active_lock_reason'] as String?,
      comments: json['comments'] as int?,
      closedAt: json['closed_at'] as String?,
      createdAt: json['created_at'],
      updatedAt: json['updated_at'] as String?,
      draft: json['draft'] as bool?,
      closedBy: json['closed_by'] == null
          ? null
          : SimpleUserDataModel.fromJson(
              json['closed_by'] as Map<String, dynamic>,
            ),
      authorAssociation: json['author_association'] as String?,
    );
    return data;
  }

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
  final String? closedAt;
  final String? createdAt;
  final String? updatedAt;
  final bool? draft;
  final SimpleUserDataModel? closedBy;
  final String? authorAssociation;
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

  factory SimpleUserDataModel.fromJson(Map<String, dynamic> json) {
    return SimpleUserDataModel(
      id: json['id'] as int?,
      siteAdmin: json['site_dmin'] as bool?,
      login: json['login'] as String?,
      nodeId: json['node_id'] as String?,
      avatarUrl: json['avatar_url'] as String?,
      url: json['url'] as String?,
      htmlUrl: json['html_url'] as String?,
      followersUrl: json['followers_url'] as String?,
      followingUrl: json['following_url'] as String?,
      gistsUrl: json['gistsUrl'] as String?,
      starredUrl: json['starred_url'] as String?,
      subscriptionsUrl: json['subscriptions_url'] as String?,
      organizationsUrl: json['organizations_url'] as String?,
      reposUrl: json['repos_url'] as String?,
      eventsUrl: json['events_url'] as String?,
      receivedEventsUrl: json['received_events_url'] as String?,
      type: json['type'] as String?,
    );
  }

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
}

class LabelDataModel {
  factory LabelDataModel.fromJson(Map<String, dynamic> json) {
    return LabelDataModel(
      id: json['id'] as int?,
      nodeId: json['node_id'] as String?,
      url: json['url'] as String?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      color: json['color'] as String?,
      defaultLabel: json['default_label'] as bool?,
    );
  }
  LabelDataModel({
    this.id,
    this.defaultLabel,
    this.nodeId,
    this.url,
    this.name,
    this.description,
    this.color,
  });

  final int? id;
  final String? nodeId;
  final String? url;
  final String? name;
  final String? description;
  final String? color;
  final bool? defaultLabel;
}

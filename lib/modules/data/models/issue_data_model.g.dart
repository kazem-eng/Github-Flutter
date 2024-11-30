// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'issue_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Issue _$IssueFromJson(Map<String, dynamic> json) {
  return Issue(
    id: (json['id'] as num?)?.toInt(),
    number: (json['number'] as num?)?.toInt(),
    title: json['title'] as String?,
    labels: (json['labels'] as List<dynamic>?)
        ?.map((e) => Label.fromJson(e as Map<String, dynamic>))
        .toList(),
    locked: json['locked'] as bool?,
    comments: (json['comments'] as num?)?.toInt(),
    createdAt: json['createdAt'] == null
        ? null
        : DateTime.parse(json['createdAt'] as String),
    updatedAt: json['updatedAt'] == null
        ? null
        : DateTime.parse(json['updatedAt'] as String),
    draft: json['draft'] as bool?,
    nodeId: json['nodeId'] as String?,
    url: json['url'] as String?,
    repositoryUrl: json['repositoryUrl'] as String?,
    labelsUrl: json['labelsUrl'] as String?,
    commentsUrl: json['commentsUrl'] as String?,
    eventsUrl: json['eventsUrl'] as String?,
    htmlUrl: json['htmlUrl'] as String?,
    state: json['state'] as String?,
    authorAssociation: json['authorAssociation'] as String?,
    stateReason: json['stateReason'] as String?,
    body: json['body'] as String?,
    user: json['user'] == null
        ? null
        : SimpleUser.fromJson(json['user'] as Map<String, dynamic>),
    assignee: json['assignee'] == null
        ? null
        : SimpleUser.fromJson(json['assignee'] as Map<String, dynamic>),
    assignees: (json['assignees'] as List<dynamic>?)
        ?.map((e) => SimpleUser.fromJson(e as Map<String, dynamic>))
        .toList(),
    activeLockReason: json['activeLockReason'] as String?,
    closedAt: json['closedAt'] == null
        ? null
        : DateTime.parse(json['closedAt'] as String),
    closedBy: json['closedBy'] == null
        ? null
        : SimpleUser.fromJson(json['closedBy'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$IssueToJson(Issue instance) => <String, dynamic>{
      'id': instance.id,
      'nodeId': instance.nodeId,
      'url': instance.url,
      'repositoryUrl': instance.repositoryUrl,
      'labelsUrl': instance.labelsUrl,
      'commentsUrl': instance.commentsUrl,
      'eventsUrl': instance.eventsUrl,
      'htmlUrl': instance.htmlUrl,
      'number': instance.number,
      'state': instance.state,
      'stateReason': instance.stateReason,
      'title': instance.title,
      'body': instance.body,
      'user': instance.user?.toJson(),
      'labels': instance.labels?.map((e) => e.toJson()).toList(),
      'assignee': instance.assignee?.toJson(),
      'assignees': instance.assignees?.map((e) => e.toJson()).toList(),
      'locked': instance.locked,
      'activeLockReason': instance.activeLockReason,
      'comments': instance.comments,
      'closedAt': instance.closedAt?.toIso8601String(),
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'draft': instance.draft,
      'closedBy': instance.closedBy?.toJson(),
      'authorAssociation': instance.authorAssociation,
    };

SimpleUser _$SimpleUserFromJson(Map<String, dynamic> json) => SimpleUser(
      id: (json['id'] as num?)?.toInt(),
      siteAdmin: json['siteAdmin'] as bool?,
      login: json['login'] as String?,
      nodeId: json['nodeId'] as String?,
      avatarUrl: json['avatarUrl'] as String?,
      url: json['url'] as String?,
      htmlUrl: json['htmlUrl'] as String?,
      followersUrl: json['followersUrl'] as String?,
      followingUrl: json['followingUrl'] as String?,
      gistsUrl: json['gistsUrl'] as String?,
      starredUrl: json['starredUrl'] as String?,
      subscriptionsUrl: json['subscriptionsUrl'] as String?,
      organizationsUrl: json['organizationsUrl'] as String?,
      reposUrl: json['reposUrl'] as String?,
      eventsUrl: json['eventsUrl'] as String?,
      receivedEventsUrl: json['receivedEventsUrl'] as String?,
      type: json['type'] as String?,
    );

Map<String, dynamic> _$SimpleUserToJson(SimpleUser instance) =>
    <String, dynamic>{
      'login': instance.login,
      'id': instance.id,
      'nodeId': instance.nodeId,
      'avatarUrl': instance.avatarUrl,
      'url': instance.url,
      'htmlUrl': instance.htmlUrl,
      'followersUrl': instance.followersUrl,
      'followingUrl': instance.followingUrl,
      'gistsUrl': instance.gistsUrl,
      'starredUrl': instance.starredUrl,
      'subscriptionsUrl': instance.subscriptionsUrl,
      'organizationsUrl': instance.organizationsUrl,
      'reposUrl': instance.reposUrl,
      'eventsUrl': instance.eventsUrl,
      'receivedEventsUrl': instance.receivedEventsUrl,
      'type': instance.type,
      'siteAdmin': instance.siteAdmin,
    };

Label _$LabelFromJson(Map<String, dynamic> json) => Label(
      id: (json['id'] as num?)?.toInt(),
      defaultLabel: json['defaultLabel'] as bool?,
      nodeId: json['nodeId'] as String?,
      url: json['url'] as String?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      color: json['color'] as String?,
    );

Map<String, dynamic> _$LabelToJson(Label instance) => <String, dynamic>{
      'id': instance.id,
      'nodeId': instance.nodeId,
      'url': instance.url,
      'name': instance.name,
      'description': instance.description,
      'color': instance.color,
      'defaultLabel': instance.defaultLabel,
    };

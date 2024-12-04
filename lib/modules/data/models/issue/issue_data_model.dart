import 'package:flutter_issues_viewer/modules/data/models/issue/label_data_model.dart';
import 'package:flutter_issues_viewer/modules/data/models/issue/user_data_model.dart';

class IssueDataModel {
  IssueDataModel({
    this.id,
    this.number,
    this.title,
    this.labels,
    this.createdAt,
    this.updatedAt,
    this.url,
    this.state,
    this.body,
    this.user,
    this.closedAt,
  });

  factory IssueDataModel.fromJson(Map<String, dynamic> json) {
    final data = IssueDataModel(
      id: json['id'] as int?,
      url: json['url'] as String?,
      number: json['number'] as int?,
      state: json['state'] as String?,
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
      closedAt: json['closed_at'] as String?,
      createdAt: json['created_at'],
      updatedAt: json['updated_at'] as String?,
    );
    return data;
  }

  final int? id;
  final String? url;
  final int? number;
  final String? state;
  final String? title;
  final String? body;
  final SimpleUserDataModel? user;
  final List<LabelDataModel>? labels;
  final String? closedAt;
  final String? createdAt;
  final String? updatedAt;
}

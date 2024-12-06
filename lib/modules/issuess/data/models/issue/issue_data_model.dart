import 'package:flutter_issues_viewer/modules/issuess/data/models/issue/label_data_model.dart';
import 'package:flutter_issues_viewer/modules/issuess/data/models/issue/user_data_model.dart';

class IssueDataModel {
  IssueDataModel({
    this.id,
    this.number,
    this.title,
    this.labels,
    this.state,
    this.body,
    this.user,
  });

  factory IssueDataModel.fromJson(Map<String, dynamic> json) {
    final data = IssueDataModel(
      id: json['id'] as int?,
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
    );
    return data;
  }

  final int? id;
  final int? number;
  final String? state;
  final String? title;
  final String? body;
  final SimpleUserDataModel? user;
  final List<LabelDataModel>? labels;
}

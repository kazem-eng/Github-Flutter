class LabelDataModel {
  factory LabelDataModel.fromJson(Map<String, dynamic> json) {
    return LabelDataModel(
      id: json['id'] as int?,
      name: json['name'] as String?,
      color: json['color'] as String?,
    );
  }
  LabelDataModel({
    this.id,
    this.name,
    this.color,
  });

  final int? id;
  final String? name;
  final String? color;
}

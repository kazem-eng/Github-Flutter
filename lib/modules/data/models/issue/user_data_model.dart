class SimpleUserDataModel {
  SimpleUserDataModel({
    this.id,
    this.login,
    this.avatarUrl,
    this.type,
  });

  factory SimpleUserDataModel.fromJson(Map<String, dynamic> json) {
    return SimpleUserDataModel(
      id: json['id'] as int?,
      login: json['login'] as String?,
      avatarUrl: json['avatar_url'] as String?,
      type: json['type'] as String?,
    );
  }

  final String? login;
  final int? id;
  final String? avatarUrl;
  final String? type;
}

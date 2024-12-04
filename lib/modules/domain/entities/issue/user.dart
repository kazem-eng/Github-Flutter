import 'package:flutter_issues_viewer/modules/data/models/issue/user_data_model.dart';

class SimpleUser {
  const SimpleUser({
    this.id = -1,
    this.login = '',
    this.avatarUrl = '',
    this.type = '',
  });

  factory SimpleUser.fromData(SimpleUserDataModel user) {
    const base = SimpleUser();
    return SimpleUser(
      id: user.id ?? base.id,
      login: user.login ?? base.login,
      avatarUrl: user.avatarUrl ?? base.avatarUrl,
      type: user.type ?? base.type,
    );
  }

  final String login;
  final int id;
  final String avatarUrl;
  final String type;
}

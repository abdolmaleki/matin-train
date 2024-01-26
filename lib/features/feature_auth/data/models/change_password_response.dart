import 'package:team_project/core/utils/architecture/data/common_models/user.dart';

class ChangePasswordResponse {
  UserModel? user;

  ChangePasswordResponse({this.user});

  ChangePasswordResponse.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? UserModel.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (user != null) {
      data['user'] = user!.toJson();
    }
    return data;
  }
}


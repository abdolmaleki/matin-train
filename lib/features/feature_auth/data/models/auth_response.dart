import 'package:team_project/core/utils/architecture/data/common_models/user.dart';

class AuthResponse {
  AuthResponse({
      this.oauth2,});

  AuthResponse.fromJson(dynamic json) {
    oauth2 = json['oauth2'] != null ? Oauth2.fromJson(json['oauth2']) : null;
  }
  Oauth2? oauth2;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (oauth2 != null) {
      map['oauth2'] = oauth2?.toJson();
    }
    return map;
  }

}

class Oauth2 {
  Oauth2({
      this.accessToken, 
      this.refreshToken, 
      this.user,});

  Oauth2.fromJson(dynamic json) {
    accessToken = json['accessToken'];
    refreshToken = json['refreshToken'];
    user = json['user'] != null ? UserModel.fromJson(json['user']) : null;
  }
  String? accessToken;
  String? refreshToken;
  UserModel? user;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['accessToken'] = accessToken;
    map['refreshToken'] = refreshToken;
    if (user != null) {
      map['user'] = user?.toJson();
    }
    return map;
  }

}


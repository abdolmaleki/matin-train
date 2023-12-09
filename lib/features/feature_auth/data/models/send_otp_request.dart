class SendOtpRequest {
  SendOtpRequest({
      this.password, 
      this.reason, 
      this.type, 
      this.username,});

  SendOtpRequest.fromJson(dynamic json) {
    password = json['password'];
    reason = json['reason'];
    type = json['type'];
    username = json['username'];
  }
  String? password;
  String? reason;
  String? type;
  String? username;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['password'] = password;
    map['reason'] = reason;
    map['type'] = type;
    map['username'] = username;
    return map;
  }

}
/// enable : true
/// length : 5

class SendOtpResponse {
  SendOtpResponse({
      this.coolDown, 
      this.code,
      this.token,});

  SendOtpResponse.fromJson(dynamic json) {
    coolDown = json['coolDown'];
    token = json['token'];
    code = json['code'];
  }
  int? coolDown;
  String? token;
  String? code;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['coolDown'] = coolDown;
    map['token'] = token;
    map['code'] = code;
    return map;
  }

}
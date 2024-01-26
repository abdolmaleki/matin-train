/// code : "111111"
/// token : "xxxxxxxxxxxxxxxxxxxxxxxxxxxx"

class VerifyOtpRequest {
  VerifyOtpRequest({
      this.code, 
      this.token,});

  VerifyOtpRequest.fromJson(dynamic json) {
    code = json['code'];
    token = json['token'];
  }
  String? code;
  String? token;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['code'] = code;
    map['token'] = token;
    return map;
  }

}
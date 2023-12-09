class AuthRequest {
  AuthRequest({
      this.password, 
      this.exchangeCode, 
      this.type, 
      this.username,});

  AuthRequest.fromJson(dynamic json) {
    password = json['password'];
    exchangeCode = json['exchangeCode'];
    type = json['type'];
    username = json['username'];
  }
  String? password;
  String? exchangeCode;
  String? type;
  String? username;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['password'] = password;
    map['exchangeCode'] = exchangeCode;
    map['type'] = type;
    map['username'] = username;
    return map;
  }

}
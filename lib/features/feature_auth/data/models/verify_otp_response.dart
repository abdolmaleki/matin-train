class VerifyOtpResponse {
  VerifyOtpResponse({
      this.exchangeCode,});

  VerifyOtpResponse.fromJson(dynamic json) {
    exchangeCode = json['exchangeCode'];
  }
  String? exchangeCode;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['exchangeCode'] = exchangeCode;
    return map;
  }

}
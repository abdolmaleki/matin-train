class OtpSettingResponse {
  int? length;
  bool? enable;

  OtpSettingResponse({this.length, this.enable});

  OtpSettingResponse.fromJson(Map<String, dynamic> json) {
    length = json['length'];
    enable = json['enable'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['length'] = length;
    data['enable'] = enable;
    return data;
  }
}


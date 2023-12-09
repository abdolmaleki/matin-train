class PolicyResponse {
  bool? accepted;

  PolicyResponse({this.accepted});

  PolicyResponse.fromJson(Map<String, dynamic> json) {
    accepted = json['accepted'];
  }


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['accepted'] = accepted;
    return data;
  }

}

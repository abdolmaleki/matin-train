class CustomerModel {
  int? id;
  double? progress;
  String? firstName;
  String? lastName;
  String? email;
  String? phone;
  String? avatar;
  String? userName;

  CustomerModel(
      {this.id,
        this.firstName,
        this.lastName,
        this.email,
        this.phone,
        this.avatar,
        this.userName});

  CustomerModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    phone = json['phone'];
    avatar = json['avatar'];
    userName = json['userName'];
    progress = json['progress'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['email'] = email;
    data['phone'] = phone;
    data['avatar'] = avatar;
    data['userName'] = userName;
    return data;
  }
}

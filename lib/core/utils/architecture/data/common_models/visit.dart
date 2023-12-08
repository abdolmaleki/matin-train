class VisitModel {
  VisitAddress? address;
  Customer? customer;
  String? date;
  int? id;
  List<Keys>? keys;
  String? paySoonAt;
  PaySoonBy? paySoonBy;
  String? shiftName;
  String? visitEndTime;
  String? visitLength;
  String? visitStartTime;
  String? visitStatus;

  VisitModel(
      {this.address,
      this.customer,
      this.date,
      this.id,
      this.keys,
      this.paySoonAt,
      this.paySoonBy,
      this.shiftName,
      this.visitEndTime,
      this.visitLength,
      this.visitStartTime,
      this.visitStatus});

  VisitModel.fromJson(Map<String, dynamic> json) {
    address =
        json['address'] != null ? VisitAddress.fromJson(json['address']) : null;
    customer =
        json['customer'] != null ? Customer.fromJson(json['customer']) : null;
    date = json['date'];
    id = json['id'];
    if (json['keys'] != null) {
      keys = <Keys>[];
      json['keys'].forEach((v) {
        keys!.add(Keys.fromJson(v));
      });
    }
    paySoonAt = json['pay_soon_at'];
    paySoonBy = json['pay_soon_by'] != null
        ? PaySoonBy.fromJson(json['pay_soon_by'])
        : null;
    shiftName = json['shiftName'];
    visitEndTime = json['visitEndTime'];
    visitLength = json['visitLength'];
    visitStartTime = json['visitStartTime'];
    visitStatus = json['visitStatus'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (address != null) {
      data['address'] = address!.toJson();
    }
    if (customer != null) {
      data['customer'] = customer!.toJson();
    }
    data['date'] = date;
    data['id'] = id;
    if (keys != null) {
      data['keys'] = keys!.map((v) => v.toJson()).toList();
    }
    data['pay_soon_at'] = paySoonAt;
    if (paySoonBy != null) {
      data['pay_soon_by'] = paySoonBy!.toJson();
    }
    data['shiftName'] = shiftName;
    data['visitEndTime'] = visitEndTime;
    data['visitLength'] = visitLength;
    data['visitStartTime'] = visitStartTime;
    data['visitStatus'] = visitStatus;
    return data;
  }
}

class VisitAddress {
  City? city;
  int? id;
  String? name;
  City? street;

  VisitAddress({this.city, this.id, this.name, this.street});

  VisitAddress.fromJson(Map<String, dynamic> json) {
    city = json['city'] != null ? City.fromJson(json['city']) : null;
    id = json['id'];
    name = json['name'];
    street = json['street'] != null ? City.fromJson(json['street']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (city != null) {
      data['city'] = city!.toJson();
    }
    data['id'] = id;
    data['name'] = name;
    if (street != null) {
      data['street'] = street!.toJson();
    }
    return data;
  }
}

class City {
  int? id;
  String? name;

  City({this.id, this.name});

  City.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}

class Customer {
  String? avatarUrl;
  String? firstName;
  String? gender;
  int? id;
  String? lastName;

  Customer(
      {this.avatarUrl, this.firstName, this.gender, this.id, this.lastName});

  Customer.fromJson(Map<String, dynamic> json) {
    avatarUrl = json['avatarUrl'];
    firstName = json['firstName'];
    gender = json['gender'];
    id = json['id'];
    lastName = json['lastName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['avatarUrl'] = avatarUrl;
    data['firstName'] = firstName;
    data['gender'] = gender;
    data['id'] = id;
    data['lastName'] = lastName;
    return data;
  }
}

class Keys {
  int? id;
  String? key;

  Keys({this.id, this.key});

  Keys.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    key = json['key'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['key'] = key;
    return data;
  }
}

class PaySoonBy {
  String? avatarUrl;
  String? firstName;
  int? id;
  String? lastName;

  PaySoonBy({this.avatarUrl, this.firstName, this.id, this.lastName});

  PaySoonBy.fromJson(Map<String, dynamic> json) {
    avatarUrl = json['avatarUrl'];
    firstName = json['firstName'];
    id = json['id'];
    lastName = json['lastName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['avatarUrl'] = avatarUrl;
    data['firstName'] = firstName;
    data['id'] = id;
    data['lastName'] = lastName;
    return data;
  }
}

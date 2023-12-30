class CustomerResponse {
  List<Items>? items;
  int? limit;
  int? offset;
  int? page;
  int? totalPages;
  int? totalRows;

  CustomerResponse(
      {this.items,
        this.limit,
        this.offset,
        this.page,
        this.totalPages,
        this.totalRows});

  CustomerResponse.fromJson(Map<String, dynamic> json) {
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(new Items.fromJson(v));
      });
    }
    limit = json['limit'];
    offset = json['offset'];
    page = json['page'];
    totalPages = json['totalPages'];
    totalRows = json['totalRows'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.items != null) {
      data['items'] = this.items!.map((v) => v.toJson()).toList();
    }
    data['limit'] = this.limit;
    data['offset'] = this.offset;
    data['page'] = this.page;
    data['totalPages'] = this.totalPages;
    data['totalRows'] = this.totalRows;
    return data;
  }
}

class Items {
  List<Absences>? absences;
  List<Addresses>? addresses;
  String? createdAt;
  List<CreditDetails>? creditDetails;
  String? deletedAt;
  List<Diagnoses>? diagnoses;
  String? extraExplanation;
  bool? hasLimitingTheRightToSelfDetermination;
  int? id;
  String? keyNo;
  List<Limitations>? limitations;
  String? limitingTheRightToSelfDeterminationEndDate;
  String? limitingTheRightToSelfDeterminationStartDate;
  String? mobilityContract;
  City? motherLang;
  String? nurseGenderWish;
  String? parkingInfo;
  String? paymentMethod;
  List<Relatives>? relatives;
  ResponsibleNurse? responsibleNurse;
  List<Sections>? sections;
  List<Services>? services;
  String? status;
  String? statusDate;
  String? updatedAt;
  User? user;

  Items(
      {this.absences,
        this.addresses,
        this.createdAt,
        this.creditDetails,
        this.deletedAt,
        this.diagnoses,
        this.extraExplanation,
        this.hasLimitingTheRightToSelfDetermination,
        this.id,
        this.keyNo,
        this.limitations,
        this.limitingTheRightToSelfDeterminationEndDate,
        this.limitingTheRightToSelfDeterminationStartDate,
        this.mobilityContract,
        this.motherLang,
        this.nurseGenderWish,
        this.parkingInfo,
        this.paymentMethod,
        this.relatives,
        this.responsibleNurse,
        this.sections,
        this.services,
        this.status,
        this.statusDate,
        this.updatedAt,
        this.user});

  Items.fromJson(Map<String, dynamic> json) {
    if (json['absences'] != null) {
      absences = <Absences>[];
      json['absences'].forEach((v) {
        absences!.add(new Absences.fromJson(v));
      });
    }
    if (json['addresses'] != null) {
      addresses = <Addresses>[];
      json['addresses'].forEach((v) {
        addresses!.add(new Addresses.fromJson(v));
      });
    }
    createdAt = json['created_at'];
    if (json['creditDetails'] != null) {
      creditDetails = <CreditDetails>[];
      json['creditDetails'].forEach((v) {
        creditDetails!.add(new CreditDetails.fromJson(v));
      });
    }
    deletedAt = json['deleted_at'];
    if (json['diagnoses'] != null) {
      diagnoses = <Diagnoses>[];
      json['diagnoses'].forEach((v) {
        diagnoses!.add(new Diagnoses.fromJson(v));
      });
    }
    extraExplanation = json['extraExplanation'];
    hasLimitingTheRightToSelfDetermination =
    json['hasLimitingTheRightToSelfDetermination'];
    id = json['id'];
    keyNo = json['keyNo'];
    if (json['limitations'] != null) {
      limitations = <Limitations>[];
      json['limitations'].forEach((v) {
        limitations!.add(new Limitations.fromJson(v));
      });
    }
    limitingTheRightToSelfDeterminationEndDate =
    json['limitingTheRightToSelfDeterminationEndDate'];
    limitingTheRightToSelfDeterminationStartDate =
    json['limitingTheRightToSelfDeterminationStartDate'];
    mobilityContract = json['mobilityContract'];
    motherLang = json['motherLang'] != null
        ? new City.fromJson(json['motherLang'])
        : null;
    nurseGenderWish = json['nurseGenderWish'];
    parkingInfo = json['parkingInfo'];
    paymentMethod = json['paymentMethod'];
    if (json['relatives'] != null) {
      relatives = <Relatives>[];
      json['relatives'].forEach((v) {
        relatives!.add(new Relatives.fromJson(v));
      });
    }
    responsibleNurse = json['responsibleNurse'] != null
        ? new ResponsibleNurse.fromJson(json['responsibleNurse'])
        : null;
    if (json['sections'] != null) {
      sections = <Sections>[];
      json['sections'].forEach((v) {
        sections!.add(new Sections.fromJson(v));
      });
    }
    if (json['services'] != null) {
      services = <Services>[];
      json['services'].forEach((v) {
        services!.add(new Services.fromJson(v));
      });
    }
    status = json['status'];
    statusDate = json['statusDate'];
    updatedAt = json['updated_at'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.absences != null) {
      data['absences'] = this.absences!.map((v) => v.toJson()).toList();
    }
    if (this.addresses != null) {
      data['addresses'] = this.addresses!.map((v) => v.toJson()).toList();
    }
    data['created_at'] = this.createdAt;
    if (this.creditDetails != null) {
      data['creditDetails'] =
          this.creditDetails!.map((v) => v.toJson()).toList();
    }
    data['deleted_at'] = this.deletedAt;
    if (this.diagnoses != null) {
      data['diagnoses'] = this.diagnoses!.map((v) => v.toJson()).toList();
    }
    data['extraExplanation'] = this.extraExplanation;
    data['hasLimitingTheRightToSelfDetermination'] =
        this.hasLimitingTheRightToSelfDetermination;
    data['id'] = this.id;
    data['keyNo'] = this.keyNo;
    if (this.limitations != null) {
      data['limitations'] = this.limitations!.map((v) => v.toJson()).toList();
    }
    data['limitingTheRightToSelfDeterminationEndDate'] =
        this.limitingTheRightToSelfDeterminationEndDate;
    data['limitingTheRightToSelfDeterminationStartDate'] =
        this.limitingTheRightToSelfDeterminationStartDate;
    data['mobilityContract'] = this.mobilityContract;
    if (this.motherLang != null) {
      data['motherLang'] = this.motherLang!.toJson();
    }
    data['nurseGenderWish'] = this.nurseGenderWish;
    data['parkingInfo'] = this.parkingInfo;
    data['paymentMethod'] = this.paymentMethod;
    if (this.relatives != null) {
      data['relatives'] = this.relatives!.map((v) => v.toJson()).toList();
    }
    if (this.responsibleNurse != null) {
      data['responsibleNurse'] = this.responsibleNurse!.toJson();
    }
    if (this.sections != null) {
      data['sections'] = this.sections!.map((v) => v.toJson()).toList();
    }
    if (this.services != null) {
      data['services'] = this.services!.map((v) => v.toJson()).toList();
    }
    data['status'] = this.status;
    data['statusDate'] = this.statusDate;
    data['updated_at'] = this.updatedAt;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class Absences {
  Customer? customer;
  int? customerId;
  String? deletedAt;
  String? endDate;
  int? id;
  String? reason;

  Absences(
      {
        this.customer,
        this.customerId,
        this.deletedAt,
        this.endDate,
        this.id,
        this.reason});

  Absences.fromJson(Map<String, dynamic> json) {
    customer = json['customer'] != null
        ? new Customer.fromJson(json['customer'])
        : null;
    customerId = json['customerId'];
    deletedAt = json['deleted_at'];
    endDate = json['end_date'];
    id = json['id'];
    reason = json['reason'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.customer != null) {
      data['customer'] = this.customer!.toJson();
    }
    data['customerId'] = this.customerId;
    data['deleted_at'] = this.deletedAt;
    data['end_date'] = this.endDate;
    data['id'] = this.id;
    data['reason'] = this.reason;
    return data;
  }
}

class Customer {
  String? avatarUrl;
  String? email;
  String? firstName;
  int? id;
  String? lastName;

  Customer(
      {this.avatarUrl, this.email, this.firstName, this.id, this.lastName});

  Customer.fromJson(Map<String, dynamic> json) {
    avatarUrl = json['avatarUrl'];
    email = json['email'];
    firstName = json['firstName'];
    id = json['id'];
    lastName = json['lastName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['avatarUrl'] = this.avatarUrl;
    data['email'] = this.email;
    data['firstName'] = this.firstName;
    data['id'] = this.id;
    data['lastName'] = this.lastName;
    return data;
  }
}

class Addresses {
  Address? address;
  int? addressId;
  int? customerId;
  String? deletedAt;
  int? id;

  Addresses(
      {this.address, this.addressId, this.customerId, this.deletedAt, this.id});

  Addresses.fromJson(Map<String, dynamic> json) {
    address =
    json['address'] != null ? new Address.fromJson(json['address']) : null;
    addressId = json['addressId'];
    customerId = json['customerId'];
    deletedAt = json['deleted_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.address != null) {
      data['address'] = this.address!.toJson();
    }
    data['addressId'] = this.addressId;
    data['customerId'] = this.customerId;
    data['deleted_at'] = this.deletedAt;
    data['id'] = this.id;
    return data;
  }
}

class Address {
  String? city;
  String? name;
  String? state;
  String? zipCode;

  Address({this.city, this.name, this.state, this.zipCode});

  Address.fromJson(Map<String, dynamic> json) {
    city = json['city'];
    name = json['name'];
    state = json['state'];
    zipCode = json['zipCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['city'] = this.city;
    data['name'] = this.name;
    data['state'] = this.state;
    data['zipCode'] = this.zipCode;
    return data;
  }
}

class CreditDetails {
  String? bankAccountNumber;
  BillingAddress? billingAddress;
  int? billingAddressId;
  int? customerId;
  String? deletedAt;
  int? id;

  CreditDetails(
      {this.bankAccountNumber,
        this.billingAddress,
        this.billingAddressId,
        this.customerId,
        this.deletedAt,
        this.id});

  CreditDetails.fromJson(Map<String, dynamic> json) {
    bankAccountNumber = json['bankAccountNumber'];
    billingAddress = json['billingAddress'] != null
        ? new BillingAddress.fromJson(json['billingAddress'])
        : null;
    billingAddressId = json['billingAddressId'];
    customerId = json['customerId'];
    deletedAt = json['deleted_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['bankAccountNumber'] = this.bankAccountNumber;
    if (this.billingAddress != null) {
      data['billingAddress'] = this.billingAddress!.toJson();
    }
    data['billingAddressId'] = this.billingAddressId;
    data['customerId'] = this.customerId;
    data['deleted_at'] = this.deletedAt;
    data['id'] = this.id;
    return data;
  }
}

class BillingAddress {
  String? buildingNumber;
  City? city;
  int? id;
  String? name;
  String? postalCode;
  City? street;

  BillingAddress(
      {this.buildingNumber,
        this.city,
        this.id,
        this.name,
        this.postalCode,
        this.street});

  BillingAddress.fromJson(Map<String, dynamic> json) {
    buildingNumber = json['buildingNumber'];
    city = json['city'] != null ? new City.fromJson(json['city']) : null;
    id = json['id'];
    name = json['name'];
    postalCode = json['postalCode'];
    street = json['street'] != null ? new City.fromJson(json['street']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['buildingNumber'] = this.buildingNumber;
    if (this.city != null) {
      data['city'] = this.city!.toJson();
    }
    data['id'] = this.id;
    data['name'] = this.name;
    data['postalCode'] = this.postalCode;
    if (this.street != null) {
      data['street'] = this.street!.toJson();
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}

class Diagnoses {
  int? customerId;
  String? deletedAt;
  City? diagnose;
  int? diagnoseId;
  int? id;

  Diagnoses(
      {this.customerId,
        this.deletedAt,
        this.diagnose,
        this.diagnoseId,
        this.id});

  Diagnoses.fromJson(Map<String, dynamic> json) {
    customerId = json['customerId'];
    deletedAt = json['deleted_at'];
    diagnose =
    json['diagnose'] != null ? new City.fromJson(json['diagnose']) : null;
    diagnoseId = json['diagnoseId'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['customerId'] = this.customerId;
    data['deleted_at'] = this.deletedAt;
    if (this.diagnose != null) {
      data['diagnose'] = this.diagnose!.toJson();
    }
    data['diagnoseId'] = this.diagnoseId;
    data['id'] = this.id;
    return data;
  }
}

class Limitations {
  int? customerId;
  String? description;
  int? id;
  Limitation? limitation;
  int? limitationId;

  Limitations(
      {this.customerId,
        this.description,
        this.id,
        this.limitation,
        this.limitationId});

  Limitations.fromJson(Map<String, dynamic> json) {
    customerId = json['customerId'];
    description = json['description'];
    id = json['id'];
    limitation = json['limitation'] != null
        ? new Limitation.fromJson(json['limitation'])
        : null;
    limitationId = json['limitationId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['customerId'] = this.customerId;
    data['description'] = this.description;
    data['id'] = this.id;
    if (this.limitation != null) {
      data['limitation'] = this.limitation!.toJson();
    }
    data['limitationId'] = this.limitationId;
    return data;
  }
}

class Limitation {
  String? description;
  int? id;
  String? name;

  Limitation({this.description, this.id, this.name});

  Limitation.fromJson(Map<String, dynamic> json) {
    description = json['description'];
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['description'] = this.description;
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}

class Relatives {
  String? addressName;
  String? buildingNumber;
  City? city;
  int? cityId;
  int? customerId;
  String? deletedAt;
  String? firstName;
  int? id;
  String? phoneNumber;
  String? postalCode;
  String? relation;
  City? street;
  int? streetId;

  Relatives(
      {this.addressName,
        this.buildingNumber,
        this.city,
        this.cityId,
        this.customerId,
        this.deletedAt,
        this.firstName,
        this.id,
        this.phoneNumber,
        this.postalCode,
        this.relation,
        this.street,
        this.streetId});

  Relatives.fromJson(Map<String, dynamic> json) {
    addressName = json['addressName'];
    buildingNumber = json['buildingNumber'];
    city = json['city'] != null ? new City.fromJson(json['city']) : null;
    cityId = json['cityId'];
    customerId = json['customerId'];
    deletedAt = json['deleted_at'];
    firstName = json['firstName'];
    id = json['id'];
    phoneNumber = json['phoneNumber'];
    postalCode = json['postalCode'];
    relation = json['relation'];
    street = json['street'] != null ? new City.fromJson(json['street']) : null;
    streetId = json['streetId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['addressName'] = this.addressName;
    data['buildingNumber'] = this.buildingNumber;
    if (this.city != null) {
      data['city'] = this.city!.toJson();
    }
    data['cityId'] = this.cityId;
    data['customerId'] = this.customerId;
    data['deleted_at'] = this.deletedAt;
    data['firstName'] = this.firstName;
    data['id'] = this.id;
    data['phoneNumber'] = this.phoneNumber;
    data['postalCode'] = this.postalCode;
    data['relation'] = this.relation;
    if (this.street != null) {
      data['street'] = this.street!.toJson();
    }
    data['streetId'] = this.streetId;
    return data;
  }
}

class ResponsibleNurse {
  String? avatarUrl;
  String? firstName;
  int? id;
  String? lastName;

  ResponsibleNurse({this.avatarUrl, this.firstName, this.id, this.lastName});

  ResponsibleNurse.fromJson(Map<String, dynamic> json) {
    avatarUrl = json['avatarUrl'];
    firstName = json['firstName'];
    id = json['id'];
    lastName = json['lastName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['avatarUrl'] = this.avatarUrl;
    data['firstName'] = this.firstName;
    data['id'] = this.id;
    data['lastName'] = this.lastName;
    return data;
  }
}

class Sections {
  int? customerId;
  String? deletedAt;
  int? id;
  City? section;
  int? sectionId;

  Sections(
      {this.customerId, this.deletedAt, this.id, this.section, this.sectionId});

  Sections.fromJson(Map<String, dynamic> json) {
    customerId = json['customerId'];
    deletedAt = json['deleted_at'];
    id = json['id'];
    section =
    json['section'] != null ? new City.fromJson(json['section']) : null;
    sectionId = json['sectionId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['customerId'] = this.customerId;
    data['deleted_at'] = this.deletedAt;
    data['id'] = this.id;
    if (this.section != null) {
      data['section'] = this.section!.toJson();
    }
    data['sectionId'] = this.sectionId;
    return data;
  }
}

class Services {
  int? customerId;
  String? deletedAt;
  String? description;
  String? endTimeRange;
  Grade? grade;
  int? gradeId;
  int? id;
  ResponsibleNurse? nurseWish;
  int? nurseWishId;
  String? repeat;
  Limitation? reportType;
  int? reportTypeId;
  Service? service;
  int? serviceId;
  int? serviceLengthMinute;
  String? serviceType;
  String? startTimeRange;
  String? timeValue;

  Services(
      {this.customerId,
        this.deletedAt,
        this.description,
        this.endTimeRange,
        this.grade,
        this.gradeId,
        this.id,
        this.nurseWish,
        this.nurseWishId,
        this.repeat,
        this.reportType,
        this.reportTypeId,
        this.service,
        this.serviceId,
        this.serviceLengthMinute,
        this.serviceType,
        this.startTimeRange,
        this.timeValue});

  Services.fromJson(Map<String, dynamic> json) {
    customerId = json['customerId'];
    deletedAt = json['deleted_at'];
    description = json['description'];
    endTimeRange = json['endTimeRange'];
    grade = json['grade'] != null ? new Grade.fromJson(json['grade']) : null;
    gradeId = json['gradeId'];
    id = json['id'];
    nurseWish = json['nurseWish'] != null
        ? new ResponsibleNurse.fromJson(json['nurseWish'])
        : null;
    nurseWishId = json['nurseWishId'];
    repeat = json['repeat'];
    reportType = json['reportType'] != null
        ? new Limitation.fromJson(json['reportType'])
        : null;
    reportTypeId = json['reportTypeId'];
    service =
    json['service'] != null ? new Service.fromJson(json['service']) : null;
    serviceId = json['serviceId'];
    serviceLengthMinute = json['serviceLengthMinute'];
    serviceType = json['serviceType'];
    startTimeRange = json['startTimeRange'];
    timeValue = json['timeValue'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['customerId'] = this.customerId;
    data['deleted_at'] = this.deletedAt;
    data['description'] = this.description;
    data['endTimeRange'] = this.endTimeRange;
    if (this.grade != null) {
      data['grade'] = this.grade!.toJson();
    }
    data['gradeId'] = this.gradeId;
    data['id'] = this.id;
    if (this.nurseWish != null) {
      data['nurseWish'] = this.nurseWish!.toJson();
    }
    data['nurseWishId'] = this.nurseWishId;
    data['repeat'] = this.repeat;
    if (this.reportType != null) {
      data['reportType'] = this.reportType!.toJson();
    }
    data['reportTypeId'] = this.reportTypeId;
    if (this.service != null) {
      data['service'] = this.service!.toJson();
    }
    data['serviceId'] = this.serviceId;
    data['serviceLengthMinute'] = this.serviceLengthMinute;
    data['serviceType'] = this.serviceType;
    data['startTimeRange'] = this.startTimeRange;
    data['timeValue'] = this.timeValue;
    return data;
  }
}

class Grade {
  String? color;
  String? description;
  int? grade;
  int? id;
  String? name;

  Grade({this.color, this.description, this.grade, this.id, this.name});

  Grade.fromJson(Map<String, dynamic> json) {
    color = json['color'];
    description = json['description'];
    grade = json['grade'];
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['color'] = this.color;
    data['description'] = this.description;
    data['grade'] = this.grade;
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}

class Service {
  String? description;
  int? id;
  String? name;
  City? serviceType;
  int? serviceTypeId;

  Service(
      {this.description,
        this.id,
        this.name,
        this.serviceType,
        this.serviceTypeId});

  Service.fromJson(Map<String, dynamic> json) {
    description = json['description'];
    id = json['id'];
    name = json['name'];
    serviceType = json['serviceType'] != null
        ? new City.fromJson(json['serviceType'])
        : null;
    serviceTypeId = json['serviceTypeId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['description'] = this.description;
    data['id'] = this.id;
    data['name'] = this.name;
    if (this.serviceType != null) {
      data['serviceType'] = this.serviceType!.toJson();
    }
    data['serviceTypeId'] = this.serviceTypeId;
    return data;
  }
}

class User {
  String? avatarUrl;
  String? email;
  String? firstName;
  String? gender;
  int? id;
  String? lastName;
  String? phone;

  User(
      {this.avatarUrl,
        this.email,
        this.firstName,
        this.gender,
        this.id,
        this.lastName,
        this.phone});

  User.fromJson(Map<String, dynamic> json) {
    avatarUrl = json['avatarUrl'];
    email = json['email'];
    firstName = json['firstName'];
    gender = json['gender'];
    id = json['id'];
    lastName = json['lastName'];
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['avatarUrl'] = this.avatarUrl;
    data['email'] = this.email;
    data['firstName'] = this.firstName;
    data['gender'] = this.gender;
    data['id'] = this.id;
    data['lastName'] = this.lastName;
    data['phone'] = this.phone;
    return data;
  }
}

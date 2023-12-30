class StaffResponse {
  List<Items>? items;
  int? limit;
  int? offset;
  int? page;
  int? totalPages;
  int? totalRows;

  StaffResponse(
      {this.items,
        this.limit,
        this.offset,
        this.page,
        this.totalPages,
        this.totalRows});

  StaffResponse.fromJson(Map<String, dynamic> json) {
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
  String? certificateCode;
  String? companyRegistrationNumber;
  String? contractExpiresAt;
  String? contractStartedAt;
  String? createdAt;
  String? deletedAt;
  int? experienceAmount;
  String? experienceAmountUnit;
  int? grace;
  int? hourLengthInContract;
  int? id;
  String? jobTitle;
  String? joinedAt;
  String? limitations;
  LanguageSkills? paymentType;
  int? percentLengthInContract;
  List<Permissions>? permissions;
  int? progress;
  String? quizTime;
  int? salary;
  String? updatedAt;
  Addresses? user;
  int? warning;

  Items(
      {this.absences,
        this.addresses,
        this.certificateCode,
        this.companyRegistrationNumber,
        this.contractExpiresAt,
        this.contractStartedAt,
        this.createdAt,
        this.deletedAt,
        this.experienceAmount,
        this.experienceAmountUnit,
        this.grace,
        this.hourLengthInContract,
        this.id,
        this.jobTitle,
        this.joinedAt,
        this.limitations,
        this.paymentType,
        this.percentLengthInContract,
        this.permissions,
        this.progress,
        this.quizTime,
        this.salary,
        this.updatedAt,
        this.user,
        this.warning});

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
    if (json['availableShifts'] != null) {
      json['availableShifts'].forEach((v) {
      });
    }
    certificateCode = json['certificateCode'];
    companyRegistrationNumber = json['companyRegistrationNumber'];
    contractExpiresAt = json['contract_expires_at'];
    contractStartedAt = json['contract_started_at'];
    if (json['contractTypes'] != null) {
      json['contractTypes'].forEach((v) {
      });
    }
    createdAt = json['created_at'];
    deletedAt = json['deleted_at'];
    experienceAmount = json['experienceAmount'];
    experienceAmountUnit = json['experienceAmountUnit'];
    grace = json['grace'];
    hourLengthInContract = json['hourLengthInContract'];
    id = json['id'];
    jobTitle = json['jobTitle'];
    joinedAt = json['joined_at'];
    limitations = json['limitations'];
    paymentType = json['paymentType'] != null
        ? new LanguageSkills.fromJson(json['paymentType'])
        : null;
    percentLengthInContract = json['percentLengthInContract'];
    if (json['permissions'] != null) {
      permissions = <Permissions>[];
      json['permissions'].forEach((v) {
        permissions!.add(new Permissions.fromJson(v));
      });
    }
    progress = json['progress'];
    quizTime = json['quiz_time'];
    salary = json['salary'];
    if (json['sections'] != null) {
      json['sections'].forEach((v) {
      });
    }
    if (json['staffTypes'] != null) {
      json['staffTypes'].forEach((v) {
      });
    }
    updatedAt = json['updated_at'];
    user = json['user'] != null ? new Addresses.fromJson(json['user']) : null;
    warning = json['warning'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.absences != null) {
      data['absences'] = this.absences!.map((v) => v.toJson()).toList();
    }
    if (this.addresses != null) {
      data['addresses'] = this.addresses!.map((v) => v.toJson()).toList();
    }

    data['certificateCode'] = this.certificateCode;
    data['companyRegistrationNumber'] = this.companyRegistrationNumber;
    data['contract_expires_at'] = this.contractExpiresAt;
    data['contract_started_at'] = this.contractStartedAt;

    data['created_at'] = this.createdAt;
    data['deleted_at'] = this.deletedAt;
    data['experienceAmount'] = this.experienceAmount;
    data['experienceAmountUnit'] = this.experienceAmountUnit;
    data['grace'] = this.grace;
    data['hourLengthInContract'] = this.hourLengthInContract;
    data['id'] = this.id;
    data['jobTitle'] = this.jobTitle;
    data['joined_at'] = this.joinedAt;
    data['limitations'] = this.limitations;
    if (this.paymentType != null) {
      data['paymentType'] = this.paymentType!.toJson();
    }
    data['percentLengthInContract'] = this.percentLengthInContract;
    if (this.permissions != null) {
      data['permissions'] = this.permissions!.map((v) => v.toJson()).toList();
    }
    data['progress'] = this.progress;
    data['quiz_time'] = this.quizTime;
    data['salary'] = this.salary;


    data['updated_at'] = this.updatedAt;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    data['warning'] = this.warning;
    return data;
  }
}

class Absences {
  String? endDate;
  int? id;
  String? reason;
  String? startDate;

  Absences({this.endDate, this.id, this.reason, this.startDate});

  Absences.fromJson(Map<String, dynamic> json) {
    endDate = json['end_date'];
    id = json['id'];
    reason = json['reason'];
    startDate = json['start_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['end_date'] = this.endDate;
    data['id'] = this.id;
    data['reason'] = this.reason;
    data['start_date'] = this.startDate;
    return data;
  }
}

class Addresses {
  String? accountNumber;
  String? avatarUrl;
  String? email;
  String? firstName;
  String? gender;
  int? id;
  List<LanguageSkills>? languageSkills;
  String? lastName;
  String? phone;
  String? registrationNumber;
  List<Roles>? roles;
  String? telephone;
  String? username;
  String? workPhoneNumber;

  Addresses(
      {this.accountNumber,
        this.avatarUrl,
        this.email,
        this.firstName,
        this.gender,
        this.id,
        this.languageSkills,
        this.lastName,
        this.phone,
        this.registrationNumber,
        this.roles,
        this.telephone,
        this.username,
        this.workPhoneNumber});

  Addresses.fromJson(Map<String, dynamic> json) {
    accountNumber = json['accountNumber'];
    avatarUrl = json['avatarUrl'];
    email = json['email'];
    firstName = json['firstName'];
    gender = json['gender'];
    id = json['id'];
    if (json['languageSkills'] != null) {
      languageSkills = <LanguageSkills>[];
      json['languageSkills'].forEach((v) {
        languageSkills!.add(new LanguageSkills.fromJson(v));
      });
    }
    lastName = json['lastName'];
    phone = json['phone'];
    registrationNumber = json['registrationNumber'];
    if (json['roles'] != null) {
      roles = <Roles>[];
      json['roles'].forEach((v) {
        roles!.add(new Roles.fromJson(v));
      });
    }
    telephone = json['telephone'];
    username = json['username'];
    workPhoneNumber = json['workPhoneNumber'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['accountNumber'] = this.accountNumber;
    data['avatarUrl'] = this.avatarUrl;
    data['email'] = this.email;
    data['firstName'] = this.firstName;
    data['gender'] = this.gender;
    data['id'] = this.id;
    if (this.languageSkills != null) {
      data['languageSkills'] =
          this.languageSkills!.map((v) => v.toJson()).toList();
    }
    data['lastName'] = this.lastName;
    data['phone'] = this.phone;
    data['registrationNumber'] = this.registrationNumber;
    if (this.roles != null) {
      data['roles'] = this.roles!.map((v) => v.toJson()).toList();
    }
    data['telephone'] = this.telephone;
    data['username'] = this.username;
    data['workPhoneNumber'] = this.workPhoneNumber;
    return data;
  }
}

class LanguageSkills {
  int? id;
  String? name;

  LanguageSkills({this.id, this.name});

  LanguageSkills.fromJson(Map<String, dynamic> json) {
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

class Roles {
  int? id;
  String? name;
  List<Permissions>? permissions;

  Roles({this.id, this.name, this.permissions});

  Roles.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    if (json['permissions'] != null) {
      permissions = <Permissions>[];
      json['permissions'].forEach((v) {
        permissions!.add(new Permissions.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    if (this.permissions != null) {
      data['permissions'] = this.permissions!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Permissions {
  int? id;
  String? name;
  String? title;

  Permissions({this.id, this.name, this.title});

  Permissions.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['title'] = this.title;
    return data;
  }
}

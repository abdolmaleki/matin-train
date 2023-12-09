import 'package:team_project/core/utils/architecture/data/common_models/permission.dart';

class RolePermissionModel {
  int? id;
  String? name;
  String? description;
  List<PermissionModel>? permissions;

  RolePermissionModel({this.id, this.name, this.permissions});

  RolePermissionModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    description = json['description'];
    name = json['name'];
    if (json['permissions'] != null) {
      permissions = <PermissionModel>[];
      json['permissions'].forEach((v) {
        permissions!.add(PermissionModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    if (permissions != null) {
      data['permissions'] = permissions!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}


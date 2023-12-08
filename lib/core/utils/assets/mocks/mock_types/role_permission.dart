import 'dart:convert';
import 'package:hoivalani/core/utils/architecture/data/common_models/permission.dart';
import 'package:hoivalani/core/utils/architecture/data/common_models/role_permission.dart';
import 'package:hoivalani/core/utils/assets/mocks/mock_factory.dart';

class MockRolePermissionList implements MockData {
  String jsonData =
      "[{\"id\":1,\"name\":\"dictumst\",\"permissions\":[{\"id\":1,\"name\":\"sem\",\"title\":\"Permisson1\"},{\"id\":2,\"name\":\"turpis\",\"title\":\"Permisson2\"}],\"description\":\"Sedsagittis.Namcongue,risussemperportavolutpat,quampedelobortisligula,sitameteleifendpedeliberoquisorci.\"},{\"id\":2,\"name\":\"viverra\",\"permissions\":[{\"id\":1,\"name\":\"varius\",\"title\":\"Permisson1\"},{\"id\":2,\"name\":\"arcu\",\"title\":\"Permisson2\"},{\"id\":3,\"name\":\"quis\",\"title\":\"Permisson3\"}],\"description\":\"Maecenastristique,estettempussemper,estquampharetramagna,acconsequatmetussapienutnunc.VestibulumanteipsumprimisinfaucibusorciluctusetultricesposuerecubiliaCurae;Maurisviverradiamvitaequam.\"},{\"id\":3,\"name\":\"tellus\",\"permissions\":[{\"id\":1,\"name\":\"vulputate\",\"title\":\"Permisson1\"},{\"id\":2,\"name\":\"consectetuer\",\"title\":\"Permisson2\"}],\"description\":\"Donecquisorciegetorcivehiculacondimentum.Curabiturinliberoutmassavolutpatconvallis.\"},{\"id\":4,\"name\":\"eleifend\",\"permissions\":[{\"id\":1,\"name\":\"ultrices\",\"title\":\"Permisson1\"},{\"id\":2,\"name\":\"enim\",\"title\":\"Permisson2\"},{\"id\":3,\"name\":\"magnis\",\"title\":\"Permisson3\"}],\"description\":\"Fuscecongue,diamidornareimperdiet,sapienurnapretiumnisl,utvolutpatsapienarcusedaugue.Aliquameratvolutpat.\"},{\"id\":5,\"name\":\"pedevenenatis\",\"permissions\":[{\"id\":1,\"name\":\"sapien\",\"title\":\"Permisson1\"},{\"id\":2,\"name\":\"non\",\"title\":\"Permisson2\"},{\"id\":3,\"name\":\"nulla\",\"title\":\"Permisson3\"}],\"description\":\"Maurisullamcorperpurussitametnulla.Quisquearculibero,rutrumac,lobortisvel,dapibusat,diam.\"}]";

  @override
  dynamic getMockJson() {
    return jsonDecode(jsonData);
  }

  @override
  List<RolePermissionModel> getMockObject() {
    List<RolePermissionModel> rolePermissions = List<RolePermissionModel>.from(
        getMockJson().map((model) => RolePermissionModel.fromJson(model)));
    return rolePermissions;
  }
}

class MockPermissionList implements MockData {
  String jsonData =
      "[{\"id\":1,\"name\":\"porttitor\",\"title\":\"Permisson1\"},{\"id\":2,\"name\":\"sapien\",\"title\":\"Permisson2\"},{\"id\":3,\"name\":\"etiam\",\"title\":\"Permisson3\"},{\"id\":4,\"name\":\"rhoncus\",\"title\":\"Permisson4\"},{\"id\":5,\"name\":\"quis\",\"title\":\"Permisson5\"},{\"id\":6,\"name\":\"maecenas\",\"title\":\"Permisson6\"}]";

  @override
  dynamic getMockJson() {
    return jsonDecode(jsonData);
  }

  @override
  List<PermissionModel> getMockObject() {
    List<PermissionModel> permissions = List<PermissionModel>.from(
        getMockJson().map((model) => PermissionModel.fromJson(model)));
    return permissions;
  }
}

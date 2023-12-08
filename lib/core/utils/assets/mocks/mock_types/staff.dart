import 'dart:convert';
import 'package:faker/faker.dart';
import 'package:hoivalani/core/config/dependency_injection/get_it.dart';
import 'package:hoivalani/core/utils/architecture/data/common_models/staff.dart';
import 'package:hoivalani/core/utils/architecture/domain/common_enums/staff_type.dart';
import 'package:hoivalani/core/utils/assets/mocks/mock_factory.dart';

class MockStaffList implements MockData {
  String jsonData =
      "[{\"id\":1,\"firstName\":\"Lauritz\",\"lastName\":\"McCloy\",\"phone\":\"(918)9028276\",\"avatar\":\"https://robohash.org/etomnisarchitecto.png?size=50x50&set=set1\",\"userName\":\"lmccloy0\",\"email\":\"lmccloy0@toplist.cz\",\"staffType\":\"janitor\"},{\"id\":2,\"firstName\":\"Maire\",\"lastName\":\"Gaenor\",\"phone\":\"(352)1951938\",\"avatar\":\"https://robohash.org/rationefacilisrem.png?size=50x50&set=set1\",\"userName\":\"mgaenor1\",\"email\":\"mgaenor1@usda.gov\",\"staffType\":\"doctor\"},{\"id\":3,\"firstName\":\"Dal\",\"lastName\":\"Christensen\",\"phone\":\"(189)7501381\",\"avatar\":\"https://robohash.org/intemporibusquod.png?size=50x50&set=set1\",\"userName\":\"dchristensen2\",\"email\":\"dchristensen2@imageshack.us\",\"staffType\":\"janitor\"},{\"id\":4,\"firstName\":\"Eddi\",\"lastName\":\"Cotterel\",\"phone\":\"(629)6879793\",\"avatar\":\"https://robohash.org/quodsuscipitdicta.png?size=50x50&set=set1\",\"userName\":\"ecotterel3\",\"email\":\"ecotterel3@parallels.com\",\"staffType\":\"janitor\"},{\"id\":5,\"firstName\":\"Kenneth\",\"lastName\":\"Gruby\",\"phone\":\"(229)8340893\",\"avatar\":\"https://robohash.org/magninonculpa.png?size=50x50&set=set1\",\"userName\":\"kgruby4\",\"email\":\"kgruby4@ifeng.com\",\"staffType\":\"practicalNurse\"},{\"id\":6,\"firstName\":\"Barbara\",\"lastName\":\"Thompkins\",\"phone\":\"(785)4795537\",\"avatar\":\"https://robohash.org/cumqueerroraut.png?size=50x50&set=set1\",\"userName\":\"bthompkins5\",\"email\":\"bthompkins5@networkadvertising.org\",\"staffType\":\"janitor\"},{\"id\":7,\"firstName\":\"Brandais\",\"lastName\":\"Whitrod\",\"phone\":\"(536)8576272\",\"avatar\":\"https://robohash.org/nesciuntnammaiores.png?size=50x50&set=set1\",\"userName\":\"bwhitrod6\",\"email\":\"bwhitrod6@abc.net.au\",\"staffType\":\"onCall\"},{\"id\":8,\"firstName\":\"Joshua\",\"lastName\":\"China\",\"phone\":\"(760)1445569\",\"avatar\":\"https://robohash.org/istefugapraesentium.png?size=50x50&set=set1\",\"userName\":\"jchina7\",\"email\":\"jchina7@sourceforge.net\",\"staffType\":\"practicalNurse\"},{\"id\":9,\"firstName\":\"Torrey\",\"lastName\":\"Britto\",\"phone\":\"(301)4299913\",\"avatar\":\"https://robohash.org/perspiciatisfacilissed.png?size=50x50&set=set1\",\"userName\":\"tbritto8\",\"email\":\"tbritto8@ucoz.ru\",\"staffType\":\"onCall\"},{\"id\":10,\"firstName\":\"Saraann\",\"lastName\":\"Adamovich\",\"phone\":\"(352)7671333\",\"avatar\":\"https://robohash.org/ipsaquiillum.png?size=50x50&set=set1\",\"userName\":\"sadamovich9\",\"email\":\"sadamovich9@goo.gl\",\"staffType\":\"onCall\"}]";

  @override
  dynamic getMockJson() {
    return jsonDecode(jsonData);
  }

  @override
  List<StaffModel> getMockObject() {
    List<StaffModel> staffs = List<StaffModel>.from(
        getMockJson().map((model) => StaffModel.fromJson(model)));
    return staffs;
  }
}

class MockStaff implements MockData {
  @override
  dynamic getMockJson() {
    return jsonEncode(getMockObject());
  }

  @override
  StaffModel getMockObject() {
    Faker faker = getIt.get<Faker>();
    return StaffModel(
        avatar: faker.image.image(keywords: ["Nurse", "Staff"], random: true),
        email: faker.internet.email(),
        firstName: faker.person.firstName(),
        id: faker.randomGenerator.integer(100),
        lastName: faker.person.lastName(),
        phone: faker.phoneNumber.de(),
        staffType: StaffType.values[random.integer(5, min: 0)],
        userName: faker.internet.userName());
  }
}

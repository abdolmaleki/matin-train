import 'package:faker/faker.dart';
import 'package:team_project/core/config/dependency_injection/get_it.dart';
import 'package:team_project/core/utils/architecture/data/common_models/address.dart';
import 'package:team_project/core/utils/architecture/data/common_models/relative.dart';
import 'package:team_project/core/utils/assets/mocks/enum.dart';
import 'package:team_project/core/utils/assets/mocks/mock_factory.dart';

class MockRelativeList implements MockData {
  @override
  dynamic getMockJson() {
    return null;
  }

  @override
  List<RelativeModel> getMockObject() {
    Faker faker = getIt.get<Faker>();
    return List.generate(
        3,
        (index) => RelativeModel(
            firstName: faker.person.firstName(),
            lastName: faker.person.lastName(),
            phone: faker.phoneNumber.us(),
            email: faker.internet.email(),
            relatives: faker.lorem.word(),
            address: (MockData(MockType.address).getMockObject() as AddressModel)));
  }
}

import 'package:faker/faker.dart';
import 'package:team_project/core/config/dependency_injection/get_it.dart';
import 'package:team_project/core/utils/architecture/data/common_models/staff_punishment.dart';
import 'package:team_project/core/utils/assets/mocks/enum.dart';
import 'package:team_project/core/utils/assets/mocks/mock_factory.dart';

class MockStaffPunishmentsList implements MockData {
  @override
  dynamic getMockJson() {
    return null;
  }

  @override
  List<StaffPunishmentModel> getMockObject() {
    Faker faker = getIt.get<Faker>();
    return List.generate(
        3,
        (index) => StaffPunishmentModel(
            date: faker.date.dateTime(minYear: 2022, maxYear: 2024),
            punishment: MockData(MockType.punishmentList)
                .getMockObject()[faker.randomGenerator.integer(3)]));
  }
}

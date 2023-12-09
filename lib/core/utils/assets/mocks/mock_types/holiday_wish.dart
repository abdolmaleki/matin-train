import 'package:faker/faker.dart';
import 'package:team_project/core/config/dependency_injection/get_it.dart';
import 'package:team_project/core/utils/architecture/data/common_models/holiday.dart';
import 'package:team_project/core/utils/architecture/data/common_models/holiday_wish.dart';
import 'package:team_project/core/utils/architecture/data/common_models/staff.dart';
import 'package:team_project/core/utils/assets/mocks/enum.dart';
import 'package:team_project/core/utils/assets/mocks/mock_factory.dart';

class MockHolidayWishList implements MockData {
  @override
  dynamic getMockJson() {
    return null;
  }

  @override
  List<HolidayWishModel> getMockObject() {
    Faker faker = getIt.get<Faker>();
    return List.generate(
        10,
        (index) => HolidayWishModel(
              id: index,
              staff: (MockData(MockType.staffsList).getMockObject()
                  as List<StaffModel>)[index],
              holiday: (MockData(MockType.holiday).getMockObject()
                  as List<HolidayModel>)[faker.randomGenerator.integer(5)],
              requestStatus: faker.randomGenerator
                  .element(["undefine", "accepted", "rejected"]),
            ));
  }
}

class MockHolidayList implements MockData {
  @override
  dynamic getMockJson() {
    return null;
  }

  @override
  List<HolidayModel> getMockObject() {
    Faker faker = getIt.get<Faker>();
    return List.generate(
        6,
        (index) => HolidayModel(
              name: faker.lorem.word(),
              description: faker.lorem.sentence(),
              startDate: faker.date.dateTimeBetween(
                  DateTime(2023, 11, 1), DateTime(2023, 11, 10)),
              endDate: faker.date.dateTimeBetween(
                  DateTime(2023, 11,15), DateTime(2023, 11,25)),
            ));
  }
}

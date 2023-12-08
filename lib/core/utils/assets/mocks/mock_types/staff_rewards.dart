import 'package:faker/faker.dart';
import 'package:hoivalani/core/config/dependency_injection/get_it.dart';
import 'package:hoivalani/core/utils/architecture/data/common_models/staff_rewards.dart';
import 'package:hoivalani/core/utils/assets/mocks/enum.dart';
import 'package:hoivalani/core/utils/assets/mocks/mock_factory.dart';

class MockStaffRewardsList implements MockData {
  @override
  dynamic getMockJson() {
    return null;
  }

  @override
  List<StaffRewardModel> getMockObject() {
    Faker faker = getIt.get<Faker>();
    return List.generate(
        5,
        (index) => StaffRewardModel(
            date: faker.date.dateTime(minYear: 2022, maxYear: 2024),
            reward: MockData(MockType.rewardList)
                .getMockObject()[faker.randomGenerator.integer(3)]));
  }
}

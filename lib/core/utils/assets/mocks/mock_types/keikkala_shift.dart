import 'package:faker/faker.dart';
import 'package:team_project/core/config/dependency_injection/get_it.dart';
import 'package:team_project/core/utils/architecture/data/common_models/keikkala_shift.dart';
import 'package:team_project/core/utils/architecture/domain/common_enums/shift_type.dart';
import 'package:team_project/core/utils/architecture/domain/common_enums/staff_type.dart';
import 'package:team_project/core/utils/assets/mocks/mock_factory.dart';

class MockKeikkalaShiftList implements MockData {
  @override
  dynamic getMockJson() {
    return null;
  }

  @override
  List<KeikkalaShiftModel> getMockObject() {
    Faker faker = getIt.get<Faker>();
    return List.generate(
        10,
        (index) => KeikkalaShiftModel(
            startDate: faker.date
                .dateTimeBetween(DateTime(2023, 1, 1), DateTime(2023, 1, 6)),
            endDate: faker.date
                .dateTimeBetween(DateTime(2023, 1, 7), DateTime(2023, 1, 10)),
            startTime: faker.date.justTime(),
            endTime: faker.date.justTime(),
            description: faker.lorem.sentence(),
            paymentType: faker.randomGenerator.element(PaymentType.values),
            section: faker.lorem.word(),
            team: "Team ${faker.lorem.word()}",
            isFreelancing: faker.randomGenerator.boolean(),
            bonus: faker.randomGenerator.integer(100, min: 50),
            staffType: faker.randomGenerator.element(StaffType.values),
            shiftType: faker.randomGenerator.element(ShiftType.values)));
  }
}

import 'package:faker/faker.dart';
import 'package:hoivalani/core/config/dependency_injection/get_it.dart';
import 'package:hoivalani/core/utils/architecture/data/common_models/cycle_visit.dart';
import 'package:hoivalani/core/utils/architecture/data/common_models/shift.dart';
import 'package:hoivalani/core/utils/architecture/data/common_models/visit.dart';
import 'package:hoivalani/core/utils/assets/mocks/mock_factory.dart';

class MockCycleVisit implements MockData {
  @override
  dynamic getMockJson() {
    return null;
  }

  @override
  CycleVisitsModel getMockObject() {
    Faker faker = getIt.get<Faker>();
    return CycleVisitsModel(
        shifts: List.generate(
            10,
            (index) => ShiftModel(
                date: faker.date.dateTime(minYear: 2023, maxYear: 2024),
                staff: [
                  Staff(
                    firstName: faker.person.firstName(),
                    lastName: faker.person.lastName(),
                    userName: faker.internet.userName(),
                    visitsCancelledCount: faker.randomGenerator.integer(4),
                    visitsDoneCount: faker.randomGenerator.integer(4),
                    visitsDelayCount: faker.randomGenerator.integer(4),
                    role: Role(
                        id: faker.randomGenerator.integer(1000),
                        name: faker.randomGenerator
                            .element(["Doctor", "Nurse", "Janitor"])),
                    avatarUrl: faker.image.image(
                        width: 200,
                        height: 200,
                        random: true,
                        keywords: ['avatar']),
                    id: faker.randomGenerator.integer(1000),
                  ),
                ],
                onGoingCustomer: OnGoingCustomer(
                  avatarUrl: faker.image.image(
                    width: 400,
                    height: 400,
                    random: true,
                    keywords: ['avatar'],
                  ),
                  lastName: faker.person.lastName(),
                  firstName: faker.person.firstName(),
                ),
                visits: List.generate(
                    12,
                    (index) => VisitModel(
                        visitStartTime: faker.date.time(),
                        visitEndTime: faker.date.time(),
                        visitLength: "${faker.randomGenerator.integer(50,min: 15)} Min",
                        keys: [
                          Keys(key: faker.randomGenerator.integer(20,min: 10).toString())
                        ],
                        shiftName: faker.randomGenerator
                            .element(["morning", "evening", "night"]),
                        address: VisitAddress(city: City(name: "Tehran"),street:City(name: "Jomhouri")),
                        customer: Customer(
                          firstName: faker.person.firstName(),
                          lastName: faker.person.lastName(),
                          gender: faker.randomGenerator.element(["Female,Man"]),
                          avatarUrl: faker.image.image(
                              width: 200,
                              height: 200,
                              random: true,
                              keywords: ['avatar']),
                        ),
                        visitStatus: faker.randomGenerator.element([
                          "ongoing",
                          "done",
                          "delay",
                          "canceled",
                          "notstarted"
                        ]))))));
  }
}

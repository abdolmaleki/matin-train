import 'package:faker/faker.dart';
import 'package:team_project/core/config/dependency_injection/get_it.dart';
import 'package:team_project/core/utils/architecture/data/common_models/staff.dart';
import 'package:team_project/core/utils/architecture/data/common_models/ticket.dart';
import 'package:team_project/core/utils/assets/mocks/enum.dart';
import 'package:team_project/core/utils/assets/mocks/mock_factory.dart';

class MockTicketList implements MockData {
  @override
  dynamic getMockJson() {
    return null;
  }

  @override
  List<TicketModel> getMockObject() {
    Faker faker = getIt.get<Faker>();
    StaffModel staffModel = MockData(MockType.staff).getMockObject();
    return List.generate(
        6,
        (index) => TicketModel(
            id: faker.randomGenerator.integer(999999, min: 100001),
            title: "Ticket ${faker.lorem.word()}",
            status: faker.randomGenerator.element(TicketStatus.values),
            description: faker.lorem.sentence(),
            createDate: faker.date.dateTime(minYear: 2022, maxYear: 2023),
            departmentId: faker.randomGenerator.integer(10000),
            priority: "High",
            receiver: faker.lorem.word(),
            receiverType:
                faker.randomGenerator.element(TicketReceiverType.values),
            userId: faker.randomGenerator.integer(20000, min: 100),
            messages: List.generate(
                faker.randomGenerator.integer(10, min: 1),
                (index) => TicketMessage(
                    sequenceId: index,
                    userId: staffModel.id!,
                    message: faker.lorem.sentence(),
                    name: "${staffModel.firstName!}${staffModel.lastName!}",
                    avatar: staffModel.avatar!,
                    date: faker.date.dateTime(maxYear: 2023, minYear: 2022)))));
  }
}

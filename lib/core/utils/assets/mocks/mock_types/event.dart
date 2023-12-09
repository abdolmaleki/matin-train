import 'package:faker/faker.dart';
import 'package:team_project/core/config/dependency_injection/get_it.dart';
import 'package:team_project/core/utils/architecture/data/common_models/attachment.dart';
import 'package:team_project/core/utils/architecture/data/common_models/events.dart';
import 'package:team_project/core/utils/architecture/domain/common_enums/staff_type.dart';
import 'package:team_project/core/utils/assets/mocks/enum.dart';
import 'package:team_project/core/utils/assets/mocks/mock_factory.dart';

class MockEventList implements MockData {
  @override
  dynamic getMockJson() {
    return null;
  }

  @override
  List<EventModel> getMockObject() {
    Faker faker = getIt.get<Faker>();
    return List.generate(
        4,
        (index) => EventModel(
            description: faker.lorem.sentence(),
            participantCount: faker.randomGenerator.integer(4, min: 1),
            eventType: (MockData(MockType.eventTypeList).getMockObject()
                as List<EventTypeModel>)[faker.randomGenerator.integer(3)],
            startDate: faker.date.dateTime(minYear: 2023, maxYear: 2024),
            endDate: faker.date.dateTime(minYear: 2023, maxYear: 2024),
            startTime: faker.date.justTime(),
            endTime: faker.date.justTime(),
            staffs: List.generate(
              faker.randomGenerator.integer(4, min: 1),
              (index) => MockData(MockType.staff).getMockObject(),
            ),
            location: faker.address.streetAddress(),
            attachments: [
              AttachmentModel(
                  type: AttachmentType.remote,
                  address: faker.image
                      .image(width: 600, height: 300, keywords: ['event'])),
              AttachmentModel(
                  type: AttachmentType.remote,
                  address: faker.image
                      .image(width: 600, height: 300, keywords: ['event'])),
            ],
            staffTypes: [
              StaffType.nurse,
              StaffType.doctor,
              StaffType.janitor,
            ],
            unlimitedParticipant: faker.randomGenerator.boolean(),
            name: faker.lorem.word()));
  }
}

import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:hoivalani/core/config/dependency_injection/get_it.dart';
import 'package:hoivalani/core/utils/architecture/data/common_models/customer_service.dart';
import 'package:hoivalani/core/utils/assets/mocks/mock_factory.dart';

class MockCustomerServiceList implements MockData {
  @override
  dynamic getMockJson() {
    return null;
  }

  @override
  List<CustomerServiceModel> getMockObject() {
    Faker faker = getIt.get<Faker>();
    return List.generate(
        3,
        (index) => CustomerServiceModel(
              endTimeRange: TimeOfDay.fromDateTime(
                  faker.date.dateTime(minYear: 2023, maxYear: 2023)),
              startTimeRange: TimeOfDay.fromDateTime(
                  faker.date.dateTime(minYear: 2023, maxYear: 2023)),
              time: TimeOfDay.fromDateTime(
                  faker.date.dateTime(minYear: 2023, maxYear: 2023)),
              description: faker.lorem.sentences(4).toString(),
              grade: faker.randomGenerator.integer(4, min: 1).toString(),
              nurseWish: faker.person.name(),
              repeat: "Every Wednesday",
              reportType: faker.randomGenerator
                  .fromPattern(["Report Type 1", "Report Type 2"]),
              service:
                  faker.randomGenerator.fromPattern(["Service 1", "Service 2"]),
              serviceLength: faker.randomGenerator
                  .fromPattern(["15 min", "20 min", "30 min"]),
              visitType:
                  faker.randomGenerator.fromPattern(["OnSite", "Online"]),
            ));
  }
}

import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:team_project/core/config/dependency_injection/get_it.dart';
import 'package:team_project/core/utils/architecture/data/common_models/section.dart';
import 'package:team_project/core/utils/assets/mocks/mock_factory.dart';

class MockSectionList implements MockData {
  @override
  getMockJson() {
    return null;
  }

  @override
  List<SectionModel> getMockObject() {
    Faker faker = getIt.get<Faker>();
    return List.generate(
        1,
        (index) => SectionModel(
            description: faker.lorem.sentence(),
            number: faker.randomGenerator.integer(0),
            color: Colors.blue,
            title: 'Helsinki'
        ));
  }
}

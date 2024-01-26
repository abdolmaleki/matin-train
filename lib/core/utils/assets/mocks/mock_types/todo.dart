import 'package:faker/faker.dart';
import 'package:team_project/core/config/dependency_injection/get_it.dart';
import 'package:team_project/core/utils/architecture/data/common_models/todo.dart';
import 'package:team_project/core/utils/assets/mocks/mock_factory.dart';

class MockTodoList implements MockData {
  @override
  dynamic getMockJson() {
    return null;
  }

  @override
  List<TodoModel> getMockObject() {
    Faker faker = getIt.get<Faker>();
    return List.generate(
        3,
        (index) => TodoModel(
            title: faker.lorem.word(),
            content: faker.lorem.sentences(4).toString(),
            creatorName: faker.person.name(),
            creatorImage: faker.image.image(keywords: ['nurse'],random: true),
            createDate: faker.date.dateTime(minYear: 2022,maxYear: 2023),
        ));
  }
}

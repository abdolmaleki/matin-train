import 'package:faker/faker.dart';
import 'package:team_project/core/config/dependency_injection/get_it.dart';
import 'package:team_project/core/utils/architecture/data/common_models/customer_report.dart';
import 'package:team_project/core/utils/assets/mocks/mock_factory.dart';

class MockCustomerReportList implements MockData {
  @override
  dynamic getMockJson() {
    return null;
  }

  @override
  List<CustomerReportModel> getMockObject() {
    return List.generate(
        3,
        (index) => CustomerReportModel(
            title: getIt.get<Faker>().lorem.words(3).toString(),
            content: getIt.get<Faker>().lorem.sentences(4).toString(),
            images: List.generate(getIt.get<Faker>().randomGenerator.integer(5,min: 2), (index) => getIt.get<Faker>().image.image(keywords: ['attachment','nurse','staff']))));
  }
}

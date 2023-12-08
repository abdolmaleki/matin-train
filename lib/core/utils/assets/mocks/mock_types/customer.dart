import 'dart:convert';
import 'package:faker/faker.dart';
import 'package:hoivalani/core/config/dependency_injection/get_it.dart';
import 'package:hoivalani/core/utils/architecture/data/common_models/customer.dart';
import 'package:hoivalani/core/utils/assets/mocks/mock_factory.dart';

class MockCustomerList implements MockData {
  String jsonData =
      "[{\"id\":1,\"firstName\":\"Almeria\",\"lastName\":\"Caffery\",\"phone\":\"(538)1887754\",\"avatar\":\"https://robohash.org/autquaeratquibusdam.png?size=50x50&set=set1\",\"userName\":\"acaffery0\",\"email\":\"acaffery0@independent.co.uk\",\"progress\":0.2},{\"id\":2,\"firstName\":\"Elinor\",\"lastName\":\"Inkpin\",\"phone\":\"(986)9659988\",\"avatar\":\"https://robohash.org/architectoeosipsam.png?size=50x50&set=set1\",\"userName\":\"einkpin1\",\"email\":\"einkpin1@deliciousdays.com\",\"progress\":0.3},{\"id\":3,\"firstName\":\"Zonda\",\"lastName\":\"Thackray\",\"phone\":\"(577)7353253\",\"avatar\":\"https://robohash.org/ipsamquipraesentium.png?size=50x50&set=set1\",\"userName\":\"zthackray2\",\"email\":\"zthackray2@wired.com\",\"progress\":0.2},{\"id\":4,\"firstName\":\"Trudi\",\"lastName\":\"Mattaus\",\"phone\":\"(874)8922146\",\"avatar\":\"https://robohash.org/praesentiumprovidentnon.png?size=50x50&set=set1\",\"userName\":\"tmattaus3\",\"email\":\"tmattaus3@qq.com\",\"progress\":0.6},{\"id\":5,\"firstName\":\"Tobie\",\"lastName\":\"Bown\",\"phone\":\"(175)5279159\",\"avatar\":\"https://robohash.org/eosutid.png?size=50x50&set=set1\",\"userName\":\"tbown4\",\"email\":\"tbown4@exblog.jp\",\"progress\":0.8},{\"id\":6,\"firstName\":\"Teodoor\",\"lastName\":\"Drivers\",\"phone\":\"(968)2079321\",\"avatar\":\"https://robohash.org/illumquiadignissimos.png?size=50x50&set=set1\",\"userName\":\"tdrivers5\",\"email\":\"tdrivers5@imgur.com\",\"progress\":0.8},{\"id\":7,\"firstName\":\"Sheena\",\"lastName\":\"Rhodus\",\"phone\":\"(256)4348583\",\"avatar\":\"https://robohash.org/iustoabeum.png?size=50x50&set=set1\",\"userName\":\"srhodus6\",\"email\":\"srhodus6@springer.com\",\"progress\":0.5},{\"id\":8,\"firstName\":\"Roxanna\",\"lastName\":\"Simounet\",\"phone\":\"(347)7362217\",\"avatar\":\"https://robohash.org/rerumporrosunt.png?size=50x50&set=set1\",\"userName\":\"rsimounet7\",\"email\":\"rsimounet7@foxnews.com\",\"progress\":0.3},{\"id\":9,\"firstName\":\"Kynthia\",\"lastName\":\"Prendergast\",\"phone\":\"(837)6561654\",\"avatar\":\"https://robohash.org/eaoccaecatiad.png?size=50x50&set=set1\",\"userName\":\"kprendergast8\",\"email\":\"kprendergast8@fotki.com\",\"progress\":0.6},{\"id\":10,\"firstName\":\"Harley\",\"lastName\":\"Waylen\",\"phone\":\"(973)3302585\",\"avatar\":\"https://robohash.org/errornequeipsa.png?size=50x50&set=set1\",\"userName\":\"hwaylen9\",\"email\":\"hwaylen9@gmpg.org\",\"progress\":0.4},{\"id\":11,\"firstName\":\"Shawn\",\"lastName\":\"Faich\",\"phone\":\"(474)8396633\",\"avatar\":\"https://robohash.org/aspernaturliberoet.png?size=50x50&set=set1\",\"userName\":\"sfaicha\",\"email\":\"sfaicha@mit.edu\",\"progress\":0.1},{\"id\":12,\"firstName\":\"Franciska\",\"lastName\":\"Dilston\",\"phone\":\"(968)8118242\",\"avatar\":\"https://robohash.org/commodiquiaamet.png?size=50x50&set=set1\",\"userName\":\"fdilstonb\",\"email\":\"fdilstonb@imageshack.us\",\"progress\":0.7},{\"id\":13,\"firstName\":\"Inglebert\",\"lastName\":\"Gosnold\",\"phone\":\"(936)9638797\",\"avatar\":\"https://robohash.org/temporibusvoluptatibusvoluptas.png?size=50x50&set=set1\",\"userName\":\"igosnoldc\",\"email\":\"igosnoldc@bizjournals.com\",\"progress\":0.8}]";

  @override
  dynamic getMockJson() {
    return jsonDecode(jsonData);
  }

  @override
  List<CustomerModel> getMockObject() {
    List<CustomerModel> staffs = List<CustomerModel>.from(
        getMockJson().map((model) => CustomerModel.fromJson(model)));
    return staffs;
  }
}

class MockCustomer implements MockData {
  @override
  dynamic getMockJson() {
    return jsonEncode(getMockObject());
  }

  @override
  CustomerModel getMockObject() {
    Faker faker = getIt.get<Faker>();
    return CustomerModel(
        avatar: faker.image.image(keywords: ["Nurse", "Staff"], random: true),
        email: faker.internet.email(),
        firstName: faker.person.firstName(),
        id: faker.randomGenerator.integer(100),
        lastName: faker.person.lastName(),
        phone: faker.phoneNumber.de(),
        userName: faker.internet.userName());
  }
}

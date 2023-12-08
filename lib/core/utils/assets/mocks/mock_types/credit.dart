import 'dart:convert';
import 'package:hoivalani/core/utils/assets/mocks/mock_factory.dart';
import 'package:hoivalani/features/feature_customer/data/models/credit.dart';

class MockCustomerAdditionalInfo implements MockData {
  String jsonData =
      "[{\"bankAccountNumber\":\"4041599646223499\",\"billingAddress\":\"4153MacphersonRoad\"},{\"bankAccountNumber\":\"4041590015616\",\"billingAddress\":\"7MelbyAlley\"},{\"bankAccountNumber\":\"4041594353146\",\"billingAddress\":\"15SchmedemanRoad\"}]";

  @override
  dynamic getMockJson() {
    return jsonDecode(jsonData);
  }

  @override
  List<CreditModel> getMockObject() {
    List<CreditModel> credits = List<CreditModel>.from(
        getMockJson().map((model) => CreditModel.fromJson(model)));
    return credits;
  }
}

import 'dart:convert';
import 'package:hoivalani/core/utils/architecture/data/common_models/address.dart';
import 'package:hoivalani/core/utils/assets/mocks/enum.dart';
import 'package:hoivalani/core/utils/assets/mocks/mock_factory.dart';

class MockAddress implements MockData {

  @override
  dynamic getMockJson() {
    return null;
  }

  @override
  AddressModel getMockObject() {
    final mockData=MockData(MockType.addressList).getMockObject() as List<AddressModel>;
    return mockData[0];
  }
}

class MockAddressList implements MockData {
  String jsonData =
      "[{\"name\":\"Home\",\"city\":\"Pacaraos\",\"street\":\"Crowley\",\"buildingNumber\":\"BPFH\",\"postalCode\":\"35213\"},{\"name\":\"Work\",\"city\":\"Telde\",\"street\":\"Almo\",\"buildingNumber\":\"SHOP\",\"postalCode\":\"35213\"},{\"name\":\"Home1\",\"city\":\"SanCristobal\",\"street\":\"DelSol\",\"buildingNumber\":\"BKSC\",\"postalCode\":\"36800\"},{\"name\":\"Work2\",\"city\":\"Kumanis\",\"street\":\"Hanson\",\"buildingNumber\":\"LTEA\",\"postalCode\":\"35213\"},{\"name\":\"Home3\",\"city\":\"Kivertsi\",\"street\":\"Rowland\",\"buildingNumber\":\"BRC\",\"postalCode\":\"35213\"}]";

  @override
  dynamic getMockJson() {
    return jsonDecode(jsonData);
  }

  @override
  List<AddressModel> getMockObject() {
    List<AddressModel> addresses = List<AddressModel>.from(
        getMockJson().map((model) => AddressModel.fromJson(model)));
    return addresses;
  }
}

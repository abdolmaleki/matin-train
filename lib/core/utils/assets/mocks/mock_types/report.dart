import 'dart:convert';
import 'package:hoivalani/core/utils/architecture/data/common_models/report.dart';
import 'package:hoivalani/core/utils/architecture/data/common_models/report_category.dart';
import 'package:hoivalani/core/utils/architecture/data/common_models/report_type.dart';
import 'package:hoivalani/core/utils/assets/mocks/mock_factory.dart';

class MockReportTypeList implements MockData {
  String jsonData =
      "[{\"name\":\"Report Type 1\"},{\"name\":\"Report Type 2\"},{\"name\":\"Report Type 3\"}]";

  @override
  dynamic getMockJson() {
    return jsonDecode(jsonData);
  }

  @override
  List<ReportTypeModel> getMockObject() {
    List<ReportTypeModel> reportTypes = List<ReportTypeModel>.from(
        getMockJson().map((model) => ReportTypeModel.fromJson(model)));
    return reportTypes;
  }
}

class MockReportCategoryList implements MockData {
  String jsonData =
      "[{\"name\":\"Cat 1\",\"description\":\"Sedante.Vivamustortor.\",\"reportType\":\"ReportType1\"},{\"name\":\"Cat 2\",\"description\":\"Curabiturconvallis.Duisconsequatduinecnisivolutpateleifend.Donecutdolor.\",\"reportType\":\"ReportType1\"},{\"name\":\"Cat 3\",\"description\":\"Integerpedejusto,laciniaeget,tincidunteget,tempusvel,pede.Morbiporttitorloremidligula.Suspendisseornareconsequatlectus.\",\"reportType\":\"ReportType2\"},{\"name\":\"Cat 4\",\"description\":\"Duisacnibh.Fuscelacuspurus,aliquetat,feugiatnon,pretiumquis,lectus.Suspendissepotenti.\",\"reportType\":\"ReportType1\"}]";

  @override
  dynamic getMockJson() {
    return jsonDecode(jsonData);
  }

  @override
  List<ReportCategoryModel> getMockObject() {
    List<ReportCategoryModel> reportCategories = List<ReportCategoryModel>.from(
        getMockJson().map((model) => ReportCategoryModel.fromJson(model)));
    return reportCategories;
  }
}

class MockReportList implements MockData {
  String jsonData =
      "[{\"name\":\"Rep 1\",\"description\":\"Sedante.Vivamustortor.\",\"reportCategory\":\"Cat 1\"},{\"name\":\"Rep 2\",\"description\":\"Curabiturconvallis.Duisconsequatduinecnisivolutpateleifend.Donecutdolor.\",\"reportCategory\":\"Cat 2\"},{\"name\":\"Rep 3\",\"description\":\"Integerpedejusto,laciniaeget,tincidunteget,tempusvel,pede.Morbiporttitorloremidligula.Suspendisseornareconsequatlectus.\",\"reportCategory\":\"Cat 3\"},{\"name\":\"Rep 4\",\"description\":\"Duisacnibh.Fuscelacuspurus,aliquetat,feugiatnon,pretiumquis,lectus.Suspendissepotenti.\",\"reportCategory\":\"Cat 4\"}]";

  @override
  dynamic getMockJson() {
    return jsonDecode(jsonData);
  }

  @override
  List<ReportModel> getMockObject() {
    List<ReportModel> reports = List<ReportModel>.from(
        getMockJson().map((model) => ReportModel.fromJson(model)));
    return reports;
  }
}

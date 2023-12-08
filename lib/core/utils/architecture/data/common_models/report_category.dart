class ReportCategoryModel {
  String? name;
  String? description;
  String? reportType;

  ReportCategoryModel({this.name, this.description,this.reportType});

  ReportCategoryModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    description = json['description'];
    reportType = json['reportType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['description'] = description;
    data['reportType'] = reportType;
    return data;
  }
}
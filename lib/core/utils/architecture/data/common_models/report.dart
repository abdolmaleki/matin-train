class ReportModel {
  String? name;
  String? description;
  String? reportCategory;

  ReportModel({this.name, this.description,this.reportCategory});

  ReportModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    description = json['description'];
    reportCategory = json['reportCategory'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['description'] = description;
    data['reportCategory'] = reportCategory;
    return data;
  }
}
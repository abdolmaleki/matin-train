class LanguageSkillModel {
  String? name;
  String? description;
  int? id;

  LanguageSkillModel({this.name, this.description,this.id});

  LanguageSkillModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    description = json['description'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['description'] = description;
    data['id'] = id;
    return data;
  }
}
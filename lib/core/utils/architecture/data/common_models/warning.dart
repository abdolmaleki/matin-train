import 'package:team_project/core/utils/architecture/data/common_models/punishment.dart';

class WarningModel {

  String? name;
  PunishmentModel? punishment;
  int? warningCount;
  String? description;

  WarningModel({this.name, this.punishment, this.warningCount, this.description});
}
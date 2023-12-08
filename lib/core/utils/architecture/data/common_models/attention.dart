import 'package:hoivalani/core/utils/architecture/data/common_models/punishment.dart';

class AttentionModel {

  String? name;
  PunishmentModel? punishment;
  int? attentionCount;
  String? description;

  AttentionModel({this.name, this.punishment, this.attentionCount, this.description});
}
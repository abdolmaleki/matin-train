
import 'package:team_project/core/utils/architecture/data/common_models/section.dart';

abstract class SectionState{}
class InitState extends SectionState{}
class SectionLoaded extends SectionState{
 final List<SectionModel>section;

  SectionLoaded({required this.section});
}
class SectionAdded extends SectionState{}
class SectionRemoved extends SectionState{}
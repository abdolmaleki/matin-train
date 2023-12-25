
import 'package:dio/dio.dart';
import 'package:team_project/features/feature_section/data/model/create_section_response.dart';
import 'package:team_project/features/feature_section/data/model/delete_section_response.dart';
import 'package:team_project/features/feature_section/data/model/get_section_response.dart';
import 'package:team_project/features/feature_section/domain/usecases/delete_section_usecase.dart';

abstract class SectionState{}
class InitState extends SectionState{}
class SectionLoaded extends SectionState{
final GetSectionResponse sectionResponse;

SectionLoaded(this.sectionResponse);
}
class SectionError extends SectionState{
 DioException error;

 SectionError(this.error);
}
class SectionAdded extends SectionState{
 final CreateSectionResponse createSectionResponse;

 SectionAdded(this.createSectionResponse);
}
class SectionRemoved extends SectionState{
 final DeleteSectionRespnse deleteSectionRespnse;

 SectionRemoved(this.deleteSectionRespnse);
}
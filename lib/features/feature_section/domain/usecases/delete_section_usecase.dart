
import 'package:team_project/core/config/dependency_injection/get_it.dart';
import 'package:team_project/core/utils/architecture/data/data_state.dart';
import 'package:team_project/core/utils/architecture/domain/use_case.dart';
import 'package:team_project/features/feature_section/data/model/delete_section_request.dart';
import 'package:team_project/features/feature_section/data/model/delete_section_response.dart';
import 'package:team_project/features/feature_section/data/repository/section_repository.dart';

class DeleteSectionUseCase implements UseCase<DataState<DeleteSectionRespnse>,DeleteSectionRequest>{
  final SectionRepository sectionRepository = getIt.get<SectionRepository>();

  @override
  Future<DataState<DeleteSectionRespnse>> call(DeleteSectionRequest request) async{
    return await sectionRepository.deleteSection(request);
  }


}
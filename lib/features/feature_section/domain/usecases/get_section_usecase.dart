
import 'package:team_project/core/config/dependency_injection/get_it.dart';
import 'package:team_project/core/utils/architecture/data/data_state.dart';
import 'package:team_project/core/utils/architecture/domain/use_case.dart';
import 'package:team_project/features/feature_section/data/model/get_section_response.dart';
import 'package:team_project/features/feature_section/data/repository/section_repository.dart';

class GetSectionUseCase implements UseCase<DataState<GetSectionResponse>,NoParams>{
  final SectionRepository sectionRepository = getIt.get<SectionRepository>();

  @override
  Future<DataState<GetSectionResponse>> call(NoParams params) async {
    return await sectionRepository.getSection();
  }
}
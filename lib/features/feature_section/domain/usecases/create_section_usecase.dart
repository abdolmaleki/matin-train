
import 'package:team_project/core/config/dependency_injection/get_it.dart';
import 'package:team_project/core/utils/architecture/data/data_state.dart';
import 'package:team_project/core/utils/architecture/domain/use_case.dart';
import 'package:team_project/features/feature_section/data/model/create_section_request.dart';
import 'package:team_project/features/feature_section/data/model/create_section_response.dart';
import 'package:team_project/features/feature_section/data/repository/section_repository.dart';

class CreateSectionUseCase implements UseCase<DataState<CreateSectionResponse>,CreateSectionRequest>{
  final SectionRepository sectionRepository = getIt.get<SectionRepository>();
  @override
  Future<DataState<CreateSectionResponse>> call(CreateSectionRequest request)async {
    return await sectionRepository.createSection(request);
  }

}
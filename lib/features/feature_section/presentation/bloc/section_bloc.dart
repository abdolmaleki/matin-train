import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:team_project/core/utils/architecture/data/data_state.dart';
import 'package:team_project/features/feature_section/data/model/create_section_request.dart';
import 'package:team_project/features/feature_section/data/model/delete_section_request.dart';
import 'package:team_project/features/feature_section/domain/usecases/create_section_usecase.dart';
import 'package:team_project/features/feature_section/domain/usecases/delete_section_usecase.dart';
import 'package:team_project/features/feature_section/presentation/bloc/section_state.dart';

import '../../../../core/utils/architecture/domain/use_case.dart';
import '../../domain/usecases/get_section_usecase.dart';

class SectionBloc extends Cubit<SectionState> {
  final GetSectionUseCase getSectionUseCase = GetSectionUseCase();
  final CreateSectionUseCase createSectionUseCase = CreateSectionUseCase();
  final DeleteSectionUseCase deleteSectionUseCase = DeleteSectionUseCase();

  SectionBloc() : super(InitState());

  Future<void> loadSection() async {
    final result = await getSectionUseCase(NoParams());
    if (result is DataSuccess) {
      emit(SectionLoaded(result.data!));
    } else {
      emit(SectionError(result.error!));
    }
  }

  void addSection(CreateSectionRequest request) async {
    final result = await createSectionUseCase(request);
    if (result is DataSuccess) {
      emit(SectionAdded(result.data!));
    } else {
      emit(SectionError(result.error!));
    }
  }

// void removeSection(Items model){
//   _sections?.remove(model);
//   emit(SectionRemoved());
// }
  void deleteSection(DeleteSectionRequest request) async {
    final result = await deleteSectionUseCase(request);
    if (result is DataSuccess) {
      emit(SectionRemoved(result.data!));
    } else {
      emit(SectionError(result.error!));
    }
  }
}

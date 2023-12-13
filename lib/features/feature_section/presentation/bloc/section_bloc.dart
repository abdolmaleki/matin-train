import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:team_project/core/utils/architecture/data/common_models/section.dart';
import 'package:team_project/core/utils/assets/mocks/mock_types/section.dart';
import 'package:team_project/features/feature_section/presentation/bloc/section_state.dart';

class SectionBloc extends Cubit<SectionState>{
  final List<SectionModel>_sections = MockSectionList().getMockObject();
  SectionBloc():super(InitState());

  void loadSection(){
    Future.delayed(const Duration(seconds: 1), () {
      emit(SectionLoaded( section: _sections));
    });
  }
  void addSection(SectionModel model){
    _sections.add(model);
    emit(SectionAdded());
  }
  void removeSection(SectionModel model){
    _sections.remove(model);
    emit(SectionRemoved());
  }
}
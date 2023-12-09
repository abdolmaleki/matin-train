import 'dart:ui';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:team_project/core/utils/architecture/domain/use_case.dart';
import 'package:team_project/features/feature_root/domain/usecase/application_usecases.dart';
import 'package:team_project/features/feature_root/presentation/bloc/root_state.dart';

class RootBloc extends Cubit<RootState> {
  RootBloc(this._applicationUseCases) : super(ApplicationInitializeState());

  final ApplicationUseCases _applicationUseCases;

  void changeLanguage(Locale locale) async {
    _applicationUseCases.saveAppLanguage.call(locale.languageCode);
    emit(ApplicationConfigChangeState(
        locale: Locale(await _applicationUseCases.getAppLanguage.call(NoParams()))));
  }
}

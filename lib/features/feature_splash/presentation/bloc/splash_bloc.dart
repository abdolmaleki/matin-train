import 'package:team_project/core/utils/architecture/data/data_state.dart';
import 'package:team_project/core/utils/architecture/domain/use_case.dart';
import 'package:team_project/features/feature_splash/domain/use_case/get_user_info.dart';
import 'package:team_project/features/feature_splash/presentation/bloc/splash_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashBloc extends Cubit<SplashState> {
  SplashBloc() : super(StartInitializingState()) {
    getUserInfo();
  }

  final GetUserInfoUseCase _getUserInfoUseCase=GetUserInfoUseCase();

  void getUserInfo()async{
    final result=await _getUserInfoUseCase(NoParams());
    if(result is DataSuccess){
      emit(UserInfoLoaded(result.data!.user!));
    }else{
      emit(SplashError(result.error!));
    }
  }
}

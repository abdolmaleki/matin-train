import 'package:team_project/core/utils/architecture/data/common_models/user.dart';

abstract class SplashState{}
class StartInitializingState extends SplashState{}
class SuccessfulInitializeState extends SplashState{}
class UserInfoLoaded extends SplashState{
  final UserModel userModel;
  UserInfoLoaded(this.userModel);
}
class SplashError extends SplashState{
  final Exception e;
  SplashError(this.e);
}
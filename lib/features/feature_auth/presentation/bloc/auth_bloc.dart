import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:team_project/core/config/dependency_injection/get_it.dart';
import 'package:team_project/core/utils/architecture/data/common_models/user.dart';
import 'package:team_project/core/utils/architecture/data/data_state.dart';
import 'package:team_project/core/utils/architecture/domain/use_case.dart';
import 'package:team_project/core/utils/constants/keys/sharead_preference.dart';
import 'package:team_project/core/utils/helper/logger.dart';
import 'package:team_project/features/feature_auth/data/models/auth_request.dart';
import 'package:team_project/features/feature_auth/data/models/auth_response.dart';
import 'package:team_project/features/feature_auth/data/models/change_password_request.dart';
import 'package:team_project/features/feature_auth/data/models/send_otp_request.dart';
import 'package:team_project/features/feature_auth/data/models/verify_otp_request.dart';
import 'package:team_project/features/feature_auth/domain/use_case/accept_policy.dart';
import 'package:team_project/features/feature_auth/domain/use_case/auth.dart';
import 'package:team_project/features/feature_auth/domain/use_case/change_password.dart';
import 'package:team_project/features/feature_auth/domain/use_case/get_otp_setting.dart';
import 'package:team_project/features/feature_auth/domain/use_case/send_otp.dart';
import 'package:team_project/features/feature_auth/domain/use_case/verify_otp.dart';
import 'package:team_project/features/feature_auth/presentation/bloc/auth_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthBloc extends Cubit<AuthState>{
  AuthBloc():super(InitState());

  final GetOtpSettingUseCase _getOtpSettingUseCase=GetOtpSettingUseCase();
  final SendOtpUseCase _sendOtpUseCase=SendOtpUseCase();
  final VerifyOtpUseCase _verifyOtpUseCase=VerifyOtpUseCase();
  final AuthUseCase _authUseCase=AuthUseCase();
  late AcceptPolicyUseCase _acceptPolicyUseCase;
  late ChangePasswordUseCase _changePasswordUseCase;

  void getOtpSetting()async {
    emit(AuthLoading());
    final result=await _getOtpSettingUseCase(NoParams());
    if(result is DataSuccess){
      emit(OtpSettingLoaded(result.data!));
    }else{
      emit(AuthError(result.error!));
    }
  }

  void sendOtp(SendOtpRequest request)async{
    final result=await _sendOtpUseCase(request);
    if(result is DataSuccess){
      AppLogger.log(result.data!.code!);
      emit(OtpSentSuccessfully(result.data!));
    }else{
      emit(AuthError(result.error!));
    }
  }

  void verifyOtp(VerifyOtpRequest request) async{
    emit(OtpVerifying());
    final result=await _verifyOtpUseCase(request);
    if(result is DataSuccess){
      emit(OtpVerifiedSuccessfully(result.data!));
    }else{
      emit(AuthError(result.error!));
    }
  }

  void auth(AuthRequest request) async{
    emit(AuthLoading());
    final result=await _authUseCase(request);
    if(result is DataSuccess){
      _saveUserInfo(result.data!.oauth2!);
      emit(AuthSuccessful(result.data!));
    }else{
      emit(AuthError(result.error!));
    }
  }

  void acceptPolicy()async {
    _acceptPolicyUseCase=AcceptPolicyUseCase();
    emit(PolicyAccepting());
    final result=await _acceptPolicyUseCase(NoParams());
    if(result is DataSuccess){
      emit(PolicyAccepted());
    }else{
      emit(AuthError(result.error!));
    }
  }

  void changePassword(ChangePasswordRequest request)async{
    _changePasswordUseCase=ChangePasswordUseCase();
    emit(ChangePasswordLoading());
    final result=await _changePasswordUseCase(request);
    if(result is DataSuccess){
      emit(ChangePasswordDone());
    }else{
      emit(AuthError(result.error!));
    }
  }

  void _saveUserInfo(Oauth2 oauth) {
    SharedPreferences sharedPreferences = getIt.get<SharedPreferences>();
    String token = oauth.accessToken!;
    UserModel userInfo = oauth.user!;
    sharedPreferences.setString(SharedPreferenceKey.token, token);
    sharedPreferences.setString(SharedPreferenceKey.user, userInfo.toString());
  }
}
import 'package:team_project/features/feature_auth/data/models/auth_response.dart';
import 'package:team_project/features/feature_auth/data/models/otp_setting_response.dart';
import 'package:team_project/features/feature_auth/data/models/send_otp_response.dart';
import 'package:team_project/features/feature_auth/data/models/verify_otp_response.dart';

abstract class AuthState{}

class InitState extends AuthState{}

class AuthLoading extends AuthState{}

class OtpSettingLoaded extends AuthState{
  final OtpSettingResponse otpSetting;
  OtpSettingLoaded(this.otpSetting);
}

class OtpSentSuccessfully extends AuthState{
  final SendOtpResponse sendOtp;
  OtpSentSuccessfully(this.sendOtp);
}

class OtpVerifiedSuccessfully extends AuthState{
  final VerifyOtpResponse verifyOtp;
  OtpVerifiedSuccessfully(this.verifyOtp);
}

class OtpVerifying extends AuthState{

}

class AuthSuccessful extends AuthState{
  final AuthResponse auth;
  AuthSuccessful(this.auth);
}

class PolicyAccepted extends AuthState{

}

class PolicyAccepting extends AuthState{

}

class ChangePasswordLoading extends AuthState{

}

class ChangePasswordDone extends AuthState{

}

class AuthError extends AuthState{
  final Exception exception;
  AuthError(this.exception);
}
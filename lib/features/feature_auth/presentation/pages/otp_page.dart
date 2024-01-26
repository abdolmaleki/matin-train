import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:team_project/core/config/themes/typography.dart';
import 'package:team_project/core/utils/architecture/presentation/error_handler.dart';
import 'package:team_project/core/utils/assets/app_svg.dart';
import 'package:team_project/core/utils/components/buttons/enums/button_size.dart';
import 'package:team_project/core/utils/components/buttons/elevated_button.dart';
import 'package:team_project/core/utils/components/otp_input/custom_otp_input.dart';
import 'package:team_project/core/utils/custom_widgets/footer_widget.dart';
import 'package:team_project/core/utils/routes/router.gr.dart';
import 'package:team_project/features/feature_auth/data/models/auth_request.dart';
import 'package:team_project/features/feature_auth/data/models/verify_otp_request.dart';
import 'package:team_project/features/feature_auth/presentation/bloc/auth_bloc.dart';
import 'package:team_project/features/feature_auth/presentation/bloc/auth_state.dart';
import 'package:team_project/features/feature_auth/presentation/widgets/resend_code_timer.dart';

@RoutePage()
class OtpPage extends StatefulWidget {
  const OtpPage(
      {super.key,
      required this.enteredEmail,
      required this.token,
      this.email,
      this.password});

  final String enteredEmail;
  final String token;
  final String? email;
  final String? password;

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _controller = TextEditingController();

  bool _enableButton = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 14, top: 17),
              child: Align(alignment: Alignment.topLeft, child: AppIcon.logo),
            ),
            Expanded(
                child: Align(
              alignment: Alignment.bottomCenter,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        AppIcon.emailSent,
                        const SizedBox(
                          height: 16,
                        ),
                        Text(
                          "enterYourCode",
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .apply(
                                        color: Theme.of(context)
                                            .secondaryHeaderColor),
                                children: [
                                  TextSpan(
                                      text:
                                          "enterThe6digitConfirmationCodeWeSentTo"),
                                  TextSpan(text: widget.enteredEmail),
                                  TextSpan(
                                      text:
                                          "pleaseEnterTheCodeToVerifyYourEmail"),
                                ])),
                        const SizedBox(
                          height: 32,
                        ),
                        Form(
                            key: _formKey,
                            autovalidateMode: AutovalidateMode.disabled,
                            child: Column(
                              children: [
                                CustomOtpInput(
                                  length: 5,
                                  controller: _controller,
                                  onComplete: (otp) {},
                                  onChanged: (otp) {
                                    setState(() {
                                      _enableButton =
                                          otp.isNotEmpty && otp.length == 5;
                                    });
                                  },
                                  validator: (otp) {
                                    // if (otp != "000000") {
                                    //   return appIntl!
                                    //       .wrongOTPEntered;
                                    // }
                                    return null;
                                  },
                                ),
                                const SizedBox(
                                  height: 40,
                                ),
                                const ResendCodeTimerWidget(),
                                const SizedBox(
                                  height: 40,
                                ),
                                BlocConsumer<AuthBloc, AuthState>(
                                  builder: (context, state) =>
                                      CustomElevatedButton(
                                    label: "verify",
                                    isLoading: state is OtpVerifying,
                                    onPressed: () {
                                      if (_formKey.currentState!.validate()) {
                                        _verifyOtp();
                                        //context.router.replace(const NewPasswordRoute());
                                      }
                                    },
                                    buttonSize: ButtonSize.medium,
                                    disabled: !_enableButton,
                                  ),
                                  listener: (context, state) {
                                    if (state is OtpVerifiedSuccessfully) {
                                      _auth(context,
                                          state.verifyOtp.exchangeCode!);
                                    } else if (state is AuthError) {
                                      ErrorHandler.handle(
                                          context, state.exception);
                                    } else if (state is AuthSuccessful) {
                                      _checkAuthResponse(state);
                                    }
                                  },
                                ),
                              ],
                            )),
                        const SizedBox(
                          height: 12,
                        ),
                        _buildReturnButton(),
                        const SizedBox(
                          height: 48,
                        ),
                        const FooterWidget(),
                        const SizedBox(
                          height: 10,
                        )
                      ]),
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }

  void _verifyOtp() {
    VerifyOtpRequest request =
        VerifyOtpRequest(code: _controller.text, token: widget.token);
    context.read<AuthBloc>().verifyOtp(request);
  }

  void _auth(BuildContext context, String exchangeCode) {
    AuthRequest request = AuthRequest(
        username: widget.email,
        type: 'email',
        exchangeCode: exchangeCode,
        password: widget.password);
    context.read<AuthBloc>().auth(request);
  }

  void _checkAuthResponse(AuthSuccessful state) {
    if (state.auth.oauth2!.user!.privacyPolicyAcceptedAt == null) {
      context.router.replace(const TermsPrivacyRoute());
    } else {
     //Todo by Matin
    }
  }

  Widget _buildReturnButton() {
    return GestureDetector(
      onTap: () => context.router.navigate(const LoginRoute()),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AppIcon.chevronLeft,
          const SizedBox(
            width: 14,
          ),
          Text(
            "returnToSignIn",
            style: AppTypography.buttonSmall,
          )
        ],
      ),
    );
  }
}

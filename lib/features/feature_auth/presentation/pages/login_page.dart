import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:team_project/core/utils/architecture/presentation/error_handler.dart';
import 'package:team_project/core/utils/assets/app_svg.dart';
import 'package:team_project/core/utils/components/buttons/enums/button_size.dart';
import 'package:team_project/core/utils/components/buttons/elevated_button.dart';
import 'package:team_project/core/utils/components/divider/titled_divider.dart';
import 'package:team_project/core/utils/components/form/form.dart';
import 'package:team_project/core/utils/components/text_fields/enum.dart';
import 'package:team_project/core/utils/components/text_fields/normal_text_field.dart';
import 'package:team_project/core/utils/constants/url/api.dart';
import 'package:team_project/core/utils/custom_widgets/footer_widget.dart';
import 'package:team_project/core/utils/routes/router.gr.dart';
import 'package:team_project/core/utils/validators/validator_functions.dart';
import 'package:team_project/features/feature_auth/data/models/auth_request.dart';
import 'package:team_project/features/feature_auth/data/models/send_otp_request.dart';
import 'package:team_project/features/feature_auth/presentation/bloc/auth_bloc.dart';
import 'package:team_project/features/feature_auth/presentation/bloc/auth_state.dart';
import 'package:team_project/features/feature_auth/presentation/widgets/language_dropdown.dart';
import 'package:team_project/features/feature_auth/presentation/widgets/or_divider.dart';
import 'package:team_project/features/feature_root/presentation/bloc/root_bloc.dart';

import '../../../feature_section/presentation/widgets/tabbar.dart';

@RoutePage()
class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _languageController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _loginButtonEnable = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 14, top: 17),
                  child: AppIcon.logo,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 17, right: 17),
                  child: Column(
                    children: [
                      AppIcon.login,
                      const SizedBox(
                        height: 13,
                      ),
                      Text(
                        "signIn",
                        style: Theme.of(context).textTheme.labelSmall,
                      ),
                    ],
                  ),
                )
              ],
            ),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: SingleChildScrollView(
                  padding: EdgeInsets.zero,
                  physics: const ClampingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      AppIcon.nfc,
                      const SizedBox(
                        height: 12,
                      ),
                      Text(
                        "pleaseInsertYourNFCCard",
                        style: Theme.of(context).textTheme.bodyMedium!.apply(
                            color: Theme.of(context).secondaryHeaderColor),
                      ),
                      const OrDividerWidget(),
                      Text(
                        "pleaseInsertYourNFCCard",
                        style: Theme.of(context).textTheme.bodyMedium!.apply(
                            color: Theme.of(context).secondaryHeaderColor),
                      ),
                      const SizedBox(
                        height: 32,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: CustomForm(
                            formKey: _formKey,
                            onChanged: () {
                              _checkForm();
                            },
                            child: Column(
                              children: [
                                CustomTextFormField(
                                  controller: _emailController,
                                  labelText: "pleaseInsertYourNFCCard",
                                  inputSize: InputSize.normal,
                                  validator:
                                      AppValidatorFunctions.emailValidator,
                                  textInputAction: TextInputAction.next,
                                ),
                                const SizedBox(
                                  height: 12,
                                ),
                                CustomTextFormField(
                                  controller: _passwordController,
                                  labelText: "pleaseInsertYourNFCCard",
                                  inputSize: InputSize.normal,
                                  isPasswordField: true,
                                  textInputAction: TextInputAction.done,
                                  validator: (String? text) {
                                    if (text == null || text.isEmpty) {
                                      return "pleaseInsertYourNFCCard";
                                    }
                                    return null;
                                  },
                                ),
                                const SizedBox(
                                  height: 21,
                                ),
                                LanguageDropdownWidget(
                                    controller: _languageController,
                                    onLanguageSelected: (locale) {
                                      if (locale != null) {
                                        BlocProvider.of<RootBloc>(context)
                                            .changeLanguage(locale);
                                      }
                                    }),
                                const SizedBox(
                                  height: 40,
                                ),
                                BlocConsumer<AuthBloc, AuthState>(
                                  builder: (context, state) {
                                    return CustomElevatedButton(
                                      label: "login",
                                      isLoading: state is AuthLoading,
                                      onPressed: () {
                                        if (_formKey.currentState!.validate()) {
                                          context
                                              .read<AuthBloc>()
                                              .getOtpSetting();
                                        }
                                      },
                                      disabled: !_loginButtonEnable,
                                      buttonSize: ButtonSize.medium,
                                    );
                                  },
                                  listener: (context, state) {
                                    if (state is OtpSettingLoaded) {
                                      _checkOtpSetting(context, state);
                                    } else if (state is OtpSentSuccessfully) {
                                      _verifyOtp(context, state);
                                    } else if (state is AuthSuccessful) {
                                      _checkAuthResponse(state);
                                    } else if (state is AuthError) {
                                      ErrorHandler.handle(
                                          context, state.exception);
                                    }
                                  },
                                ),
                              ],
                            )),
                      ),
                      const SizedBox(
                        height: 72,
                      ),
                      const FooterWidget(),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _checkForm() {
    if (_emailController.text.isNotEmpty &&
        _passwordController.text.isNotEmpty &&
        _languageController.text.isNotEmpty) {
      setState(() {
        _loginButtonEnable = true;
      });
    } else {
      setState(() {
        _loginButtonEnable = false;
      });
    }
  }

  void _checkOtpSetting(BuildContext context, OtpSettingLoaded state) {
    if (state.otpSetting.enable!) {
      SendOtpRequest sendOtpRequest = SendOtpRequest(
          password: _passwordController.text,
          reason: OtpReason.login.name,
          type: 'email',
          username: _emailController.text);
      context.read<AuthBloc>().sendOtp(sendOtpRequest);
    } else {
      _auth(context);
    }
  }

  void _verifyOtp(BuildContext context, OtpSentSuccessfully state) async {
    context.router.replace(
      OtpRoute(
          enteredEmail: _emailController.text,
          token: state.sendOtp.token!,
          email: _emailController.text,
          password: _passwordController.text),
    );
  }

  void _auth(BuildContext context) {
    AuthRequest request = AuthRequest(
        username: _emailController.text,
        type: 'email',
        exchangeCode: '',
        password: _passwordController.text);
    context.read<AuthBloc>().auth(request);
  }

  void _checkAuthResponse(AuthSuccessful state) {
    if (state.auth.oauth2!.user!.privacyPolicyAcceptedAt == null) {
      context.router.replace(const TermsPrivacyRoute());
    } else {
      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>TabBarWidget()));

      //Todo by Matin
    }
  }
}

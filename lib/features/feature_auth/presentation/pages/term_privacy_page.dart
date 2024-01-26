import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:team_project/core/utils/architecture/presentation/error_handler.dart';
import 'package:team_project/core/utils/assets/app_svg.dart';
import 'package:team_project/core/utils/components/buttons/enums/button_size.dart';
import 'package:team_project/core/utils/components/buttons/elevated_button.dart';
import 'package:team_project/core/utils/components/buttons/outlined_button.dart';
import 'package:team_project/core/utils/components/scrollbar/text_scrollbar.dart';
import 'package:team_project/core/utils/routes/router.gr.dart';
import 'package:team_project/features/feature_auth/presentation/bloc/auth_bloc.dart';
import 'package:team_project/features/feature_auth/presentation/bloc/auth_state.dart';

@RoutePage()
class TermsPrivacyPage extends StatelessWidget {
  const TermsPrivacyPage({super.key});

  @override
  Widget build(BuildContext context) {
    double textHeight = (MediaQuery.of(context).size.height) * 40 / 100;
    return Scaffold(
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 14, top: 17),
            child: AppIcon.logo,
          ),
          const Expanded(child: SizedBox()),
          Column(
            children: [
              Text("termsAndPrivacy",
                  style: Theme.of(context).textTheme.headlineSmall,
                  textAlign: TextAlign.center),
              const SizedBox(
                height: 16,
              ),
              Container(
                height: textHeight,
                padding: const EdgeInsets.only(left: 24, right: 12),
                child: CustomScrollbar(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 12),
                      child: Text(
                        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,",
                        style: Theme.of(context).textTheme.bodySmall!.apply(
                            color: Theme.of(context).secondaryHeaderColor),
                        textAlign: TextAlign.justify,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: CustomOutlinedButton(
                          label: "iReject",
                          onPressed: () {
                            context.router.replace(const LoginRoute());
                          },
                          buttonSize: ButtonSize.medium),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: BlocConsumer<AuthBloc, AuthState>(
                        builder: (context, state) => CustomElevatedButton(
                            label: "iReject",
                            isLoading: state is PolicyAccepted,
                            onPressed: () {
                              context.read<AuthBloc>().acceptPolicy();
                            },
                            buttonSize: ButtonSize.medium),
                        listener: (context, state) {
                          if (state is PolicyAccepted) {
                           _goNextStep(context);
                          }else if(state is AuthError){
                            ErrorHandler.handle(context, state.exception);
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const Expanded(child: SizedBox()),
        ],
      )),
    );
  }

  void _goNextStep(BuildContext context) {
    //SharedPreferences sharedPreferences=getIt.get<SharedPreferences>();
    //UserModel user=UserModel.fromString(sharedPreferences.getString(SharedPreferenceKey.user)!);
  }
}

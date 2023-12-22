import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:team_project/core/utils/architecture/presentation/error_handler.dart';
import 'package:team_project/core/utils/assets/app_svg.dart';
import 'package:team_project/core/utils/constants/theme/colors.dart';
import 'package:team_project/core/utils/routes/router.gr.dart';
import 'package:team_project/features/feature_splash/presentation/bloc/splash_bloc.dart';
import 'package:team_project/features/feature_splash/presentation/bloc/splash_state.dart';

@RoutePage()
class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: SafeArea(
        child: BlocProvider(
          create: (context) => SplashBloc(),
          child: BlocListener<SplashBloc, SplashState>(
            listener: (context, state) {
              _handleState(state);
            },
            child: Padding(
              padding: const EdgeInsets.fromLTRB(17.3, 14.19, 17.3, 12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Align(alignment: Alignment.topLeft, child: AppIcon.logo),
                  Text(
                    "welcomeToHoivalani",
                    style: Theme.of(context)
                        .textTheme
                        .displaySmall!
                        .apply(color: AppColors.white),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 94,
                  ),
                  AppIcon.nfcLarge,
                  const Expanded(child: SizedBox()),
                  Text(
                    "pleaseInsertYourNFCCard",
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .apply(color: AppColors.white),
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _handleState(SplashState state) {
    if (state is UserInfoLoaded) {
      print("Its Ok");
      context.router.replace(const MedicineRoute());
      //context.router.replace(const HomeRoute());
    }else if(state is SplashError){
      ErrorHandler.handle(context, state.e);
    }
  }
}

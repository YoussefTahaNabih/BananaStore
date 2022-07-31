import 'dart:async';
import 'dart:ui';
import 'package:app/presentation/resources/assets_manger.dart';
import 'package:app/presentation/resources/color_manger.dart';
import 'package:app/presentation/resources/constant_manger.dart';
import 'package:app/presentation/resources/routes_manger.dart';
import 'package:app/presentation/resources/values_manger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../app/app_prefs.dart';
import '../../app/di.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  final AppPreferences _appPreferences = instance<AppPreferences>();

  // ignore: unused_field
  Timer? _timer;
  _startDelay() {
    _timer = Timer(const Duration(seconds: AppConstants.splashDelay), _goNext);
  }

  _goNext() async {
    _appPreferences.isUserLoggedIn().then((isUserLoggedIn) => {
          if (isUserLoggedIn)
            {
              // navigate to main screen
              Navigator.pushReplacementNamed(context, Routes.mainRoute)
            }
          else
            {
              _appPreferences
                  .isOnBoardingScreenViewed()
                  .then((isOnBoardingScreenViewed) => {
                        if (isOnBoardingScreenViewed)
                          {
                            // navigate to login screen

                            Navigator.pushReplacementNamed(
                                context, Routes.loginRoute)
                          }
                        else
                          {
                            // navigate to onboarding screen

                            Navigator.pushReplacementNamed(
                                context, Routes.onBoardingRoute)
                          }
                      })
            }
        });
  }

  @override
  void initState() {
    super.initState();
    _startDelay();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primary,
      body: const Center(
          child: SizedBox(
        height: AppSize.s160,
        width: AppSize.s160,
        child: Image(
          image: AssetImage(ImageAssets.logoIc),
        ),
      )),
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}

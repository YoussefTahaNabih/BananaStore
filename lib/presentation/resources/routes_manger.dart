import 'package:app/presentation/forget_pass/view/forget_pass_view.dart';
import 'package:app/presentation/main/main_view.dart';
import 'package:app/presentation/onBoarding/view/onboarding_view.dart';
import 'package:app/presentation/resources/strings_manger.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../app/di.dart';
import '../login/view/login_view.dart';
import '../regester/view/regester_view.dart';
import '../splash/splash_view.dart';
import '../store_details/view/store_details_view.dart';

class Routes {
  static const String splashRoute = '/';
  static const String loginRoute = '/login';
  static const String regesterRoute = '/regester';
  static const String onBoardingRoute = '/onBoarding';

  static const String forgetPassRoute = '/forgetPass';
  static const String mainRoute = '/main';
  static const String storeDetailsRoute = '/storeDetails';
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (_) => const SplashView());
      case Routes.loginRoute:
        initLoginModule();
        return MaterialPageRoute(builder: (_) => const LoginView());
      case Routes.onBoardingRoute:
        return MaterialPageRoute(builder: (_) => const OnBoardingView());
      case Routes.regesterRoute:
        initRegisterModule();
        return MaterialPageRoute(builder: (_) => const RegesterView());
      case Routes.forgetPassRoute:
        initForgotPasswordModule();
        return MaterialPageRoute(builder: (_) => const ForgotPasswordView());
      case Routes.mainRoute:
        initHomeModule();
        return MaterialPageRoute(builder: (_) => const MainView());
      case Routes.storeDetailsRoute:
        initStoreDetailsModule();
        return MaterialPageRoute(builder: (_) => const StoreDetailsView());
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              appBar: AppBar(
                title: Text(AppStrings.noRouteFound.tr()),
              ),
              body: Center(child: Text(AppStrings.noRouteFound.tr())),
            ));
  }
}

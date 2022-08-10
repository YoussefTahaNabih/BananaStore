import 'package:app/app/app_prefs.dart';
import 'package:app/app/di.dart';
import 'package:app/data/data_source/local_dataSource.dart';
import 'dart:math' as math;

import 'package:app/presentation/resources/assets_manger.dart';
import 'package:app/presentation/resources/color_manger.dart';
import 'package:app/presentation/resources/values_manger.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:flutter_svg/svg.dart';

import '../../../resources/langauge_manager.dart';
import '../../../resources/routes_manger.dart';
import '../../../resources/strings_manger.dart';

class MyAccountPage extends StatefulWidget {
  const MyAccountPage({Key? key}) : super(key: key);

  @override
  State<MyAccountPage> createState() => _MyAccountPageState();
}

class _MyAccountPageState extends State<MyAccountPage> {
  final AppPreferences _appPreferences = instance<AppPreferences>();
  final LocalDataSource _localDataSource = instance<LocalDataSource>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 3,
          child: Container(
              width: MediaQuery.of(context).size.width,
              color: ColorManager.primary,
              child: Column(
                children: [
                  Container(
                    width: AppSize.s75,
                    height: AppSize.s75,
                    decoration: BoxDecoration(
                      color: ColorManager.gray,
                      shape: BoxShape.circle,
                    ),
                    child: const Image(image: AssetImage(ImageAssets.logoIc)),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Youssef Taha",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ).tr(),
                  const SizedBox(
                    height: 5,
                  ),
                  const Text("yousseftaha@gmail.com").tr(),
                ],
              )),
        ),
        Expanded(
          flex: 8,
          child: ListView(
            padding: const EdgeInsets.all(AppPadding.p8),
            children: [
              ListTile(
                leading: Icon(
                  Icons.language,
                  color: ColorManager.primary,
                ),
                title: Text(
                  AppStrings.changeLanguage.tr(),
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                trailing: Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.rotationY(isRtl() ? math.pi : 0),
                  child: SvgPicture.asset(ImageAssets.rightSettingsIc),
                ),
                onTap: () {
                  _changeLanguage();
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.favorite_border,
                  color: ColorManager.primary,
                ),
                title: Text(
                  AppStrings.favourite.tr(),
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                trailing: Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.rotationY(isRtl() ? math.pi : 0),
                  child: SvgPicture.asset(ImageAssets.rightSettingsIc),
                ),
                onTap: () {
                  _changeLanguage();
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.shopping_cart,
                  color: ColorManager.primary,
                ),
                title: Text(
                  AppStrings.shoppingCart.tr(),
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                trailing: Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.rotationY(isRtl() ? math.pi : 0),
                  child: SvgPicture.asset(ImageAssets.rightSettingsIc),
                ),
                onTap: () {
                  _changeLanguage();
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.add_task,
                  color: ColorManager.primary,
                ),
                title: Text(
                  AppStrings.contactUs.tr(),
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                trailing: Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.rotationY(isRtl() ? math.pi : 0),
                  child: SvgPicture.asset(ImageAssets.rightSettingsIc),
                ),
                onTap: () {
                  _contactUs();
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.share,
                  color: ColorManager.primary,
                ),
                title: Text(
                  AppStrings.inviteYourFriends.tr(),
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                trailing: Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.rotationY(isRtl() ? math.pi : 0),
                  child: SvgPicture.asset(ImageAssets.rightSettingsIc),
                ),
                onTap: () {
                  _inviteFriends();
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.logout,
                  color: ColorManager.primary,
                ),
                title: Text(
                  AppStrings.logout.tr(),
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                onTap: () {
                  _logout();
                },
              ),
            ],
          ),
        )
      ],
    );
  }

  bool isRtl() {
    return context.locale == ARABIC_LOCAL;
  }

  _changeLanguage() {
    _appPreferences.changeAppLanguage();
    Phoenix.rebirth(context);
  }

  _contactUs() {}

  _inviteFriends() {}

  _logout() {
    _appPreferences.logout();
    _localDataSource.clearCache();
    Navigator.pushReplacementNamed(context, Routes.loginRoute);
  }
}

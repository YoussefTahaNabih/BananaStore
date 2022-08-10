import 'dart:ui';

import 'package:app/presentation/main/pages/home/view/home_page.dart';
import 'package:app/presentation/main/pages/myAccount/my_account.dart';
import 'package:app/presentation/main/pages/notifications/notif_page.dart';
import 'package:app/presentation/main/pages/search/search_page.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../resources/color_manger.dart';
import '../resources/strings_manger.dart';
import '../resources/values_manger.dart';

class MainView extends StatefulWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  _MainViewState createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  List<Widget> pages = [
    const HomePage(),
    const SearchPage(),
    const NotificationPage(),
    const MyAccountPage()
  ];
  List<String> titles = [
    AppStrings.home.tr(),
    AppStrings.search.tr(),
    AppStrings.notifications.tr(),
    AppStrings.myAccount.tr(),
  ];

  var _title = AppStrings.home.tr();
  var _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorManager.primary,
        title: Text(_title, style: TextStyle(color: ColorManager.white)),
      ),
      body: pages[_currentIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(color: ColorManager.gray, spreadRadius: AppSize.s1)
        ]),
        child: BottomNavigationBar(
          selectedItemColor: ColorManager.primary,
          unselectedItemColor: ColorManager.gray,
          currentIndex: _currentIndex,
          onTap: onTap,
          items: [
            BottomNavigationBarItem(
                icon: const Icon(Icons.home_outlined),
                label: AppStrings.home.tr()),
            BottomNavigationBarItem(
                icon: const Icon(Icons.add_shopping_cart),
                label: AppStrings.shoppingCart.tr()),
            BottomNavigationBarItem(
                icon: const Icon(Icons.favorite_border),
                label: AppStrings.favourite.tr()),
            BottomNavigationBarItem(
                icon: const Icon(Icons.person_outline),
                label: AppStrings.myAccount.tr()),
          ],
        ),
      ),
    );
  }

  onTap(int index) {
    setState(() {
      _currentIndex = index;
      _title = titles[index];
    });
  }
}

import 'package:e_commerce/utilities/routes.dart';
import 'package:e_commerce/views/pages/bottom_navbar.dart';
import 'package:e_commerce/views/pages/landing_page.dart';
import 'package:e_commerce/views/pages/auth_page.dart';
// import 'package:e_commerce/views/pages/register_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Route<dynamic> onGenerate(RouteSettings settings) {
  switch (settings.name) {
    case AppRoutes.loginPageRoute:
      return CupertinoPageRoute(
        builder: (_) => AuthPage(),
        settings: settings,
      );
    case AppRoutes.bottomNavbarRoute:
      return CupertinoPageRoute(
        builder: (_) => BottomNavbar(),
        settings: settings,
      );
    case AppRoutes.landingPageRoute:
    default:
      return CupertinoPageRoute(
        builder: (_) => LandingPage(),
        settings: settings,
      );
  }
}

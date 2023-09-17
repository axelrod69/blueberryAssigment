import 'package:blueberry_assignment/utils/routes/routeNames.dart';
import 'package:blueberry_assignment/view/dashboardScreen.dart';
import 'package:blueberry_assignment/view/errorScreen.dart';
import 'package:blueberry_assignment/view/loginScreen.dart';
import 'package:blueberry_assignment/view/onboardingScreen.dart';
import 'package:flutter/material.dart';

class GenerateRoutes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.onBoarding:
        return MaterialPageRoute(builder: (context) => OnboardingScreen());

      case RouteNames.login:
        return MaterialPageRoute(builder: (context) => LoginScreen());

      case RouteNames.dashboard:
        return MaterialPageRoute(builder: (context) => Dashboard());

      default:
        return MaterialPageRoute(builder: (context) => ErrorScreen());
    }
  }
}

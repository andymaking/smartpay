import 'package:flutter/material.dart';

import '../../locator.dart';
import '../../screens/auth/login/login-with-pin/login.pin.ui.dart';
import '../../screens/auth/login/login.ui.dart';
import '../../screens/auth/signup/enter-details.uignup.dart';
import '../../screens/auth/signup/enter-email.signup.dart';
import '../../screens/auth/signup/verify-email.signup.dart';
import '../../screens/onboarding/onboarding.dart';
import '../services/local/cache.service.dart';
import 'routes.dart';

class Routers {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final cache = locator<AppCache>();
    switch (settings.name) {
      case ONBOARDING:
        return MaterialPageRoute(builder: (_) => const OnboardingPage());
      case LOGINROUTE:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case PINLOGINROUTE:
        return MaterialPageRoute(builder: (_) => const LoginWithPin());
      case SIGNUPROUTE:
        return MaterialPageRoute(builder: (_) => const EnterEmailSignUp());
      case VERIFYOTPROUTE:
        return MaterialPageRoute(builder: (_) => const VerifyEmailSignUp());
      case ENTERDETAILSSIGNUPROUTE:
        return MaterialPageRoute(builder: (_) => const EnterDetailsSignUp());
      // case GiveGroupName:
      //   return MaterialPageRoute(builder: (_) => const GiveGroupNameScreen());
      // case HomeRoute:
      //   return MaterialPageRoute(builder: (_) => const DashBoardScreen());

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}

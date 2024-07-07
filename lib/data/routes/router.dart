import 'package:flutter/material.dart';

import '../../locator.dart';
import '../../screens/auth/forgot-password/create-new.forgot-password.ui.dart';
import '../../screens/auth/forgot-password/enter-email.forgot-password.ui.dart';
import '../../screens/auth/forgot-password/verify-email.forgot-password.ui.dart';
import '../../screens/auth/login/login-with-pin/login.pin.ui.dart';
import '../../screens/auth/login/login.ui.dart';
import '../../screens/auth/signup/create-pin.signup.dart';
import '../../screens/auth/signup/enter-details.uignup.dart';
import '../../screens/auth/signup/enter-email.signup.dart';
import '../../screens/auth/signup/verify-email.signup.dart';
import '../../screens/main/home.ui.dart';
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
      case CREATEPINROUTE:
        return MaterialPageRoute(builder: (_) => const CreatePinScreen());
      case HOMEROUTE:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case FORGOTHOMEROUTE:
        return MaterialPageRoute(builder: (_) => const EnterEmailForgotScreen());
      case VERIFYFORGOTHOMEROUTE:
        return MaterialPageRoute(builder: (_) => const VerifyEmailForgotScreen());
      case CREATEPASSWORDFORGOTHOMEROUTE:
        return MaterialPageRoute(builder: (_) => const CreatePasswordForgotScreen());


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

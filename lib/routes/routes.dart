import 'package:flutter/material.dart';
import 'package:nostalicious_web/routes/routeName.dart';
import 'package:nostalicious_web/screens/eating_choice.dart';
import 'package:nostalicious_web/screens/make_your_own.dart';
import 'package:nostalicious_web/screens/payment_method_selection.dart';
import 'package:nostalicious_web/screens/use_existing.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    print("Routes say ${settings.name}");
    switch (settings.name) {
      case RouteName.eatingChoice:
        return MaterialPageRoute(builder: (context) => EatingChoice());
      case RouteName.useExisting:
        return MaterialPageRoute(builder: (context) => UseExistingScreen());
      case RouteName.makeYourOwn:
        return MaterialPageRoute(builder: (context) => MakeYourOwnScreen());
      case RouteName.paymentMethodSelection:
        return MaterialPageRoute(builder: (context) => PaymentScreen());
      // case RouteName.signInCashierScreen:
      //   return MaterialPageRoute(builder: (context) => SignInCashier());

      default:
        return MaterialPageRoute(builder: (context) {
          return const Scaffold(body: Center(child: Text("wrong place dude!")));
        });
    }
  }
}

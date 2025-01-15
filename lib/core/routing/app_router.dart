import 'package:flutter/material.dart';
import 'package:spiders_task/core/routing/routes.dart';
import 'package:spiders_task/features/home/ui/views/home_view.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    // this arguments to be passed in any screen like this (arguments: arguments as ClassName)
    final arrguments = settings.arguments;

    switch (settings.name) {
      case Routes.homeView:
        return MaterialPageRoute(
          builder: (_) => const HomeView(),
        );

      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                    child: Text("No route defined for ${settings.name}"),
                  ),
                ));
    }
  }
}

import 'package:flutter/material.dart';
import 'package:spiders_task/core/routing/app_router.dart';
import 'package:spiders_task/core/routing/routes.dart';
import 'package:spiders_task/core/theming/colors.dart';

class SpidersReels extends StatelessWidget {
  final AppRouter appRouter;
  const SpidersReels({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Doc Adavanced Flutter",
      theme: ThemeData(
        primaryColor: ColorsManager.mainBlue,
        scaffoldBackgroundColor: Colors.white,
        fontFamily: "Open Sans",
      ),
      initialRoute: Routes.homeView,
      onGenerateRoute: appRouter.generateRoute,
    );
  }
}

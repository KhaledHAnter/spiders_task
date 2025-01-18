import 'package:flutter/material.dart';
import 'package:spiders_task/core/di/dependency_injection.dart';
import 'package:spiders_task/core/routing/app_router.dart';
import 'package:spiders_task/spiders_reels.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupGetIt();
  runApp(SpidersReels(
    appRouter: AppRouter(),
  ));
}

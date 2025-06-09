import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio_web/app/routes/app_pages.dart';
import 'package:portfolio_web/utils/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // Firebase initialization commented out temporarily
 await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,

  );
  
  // Ensure old instances are cleared before starting app
  await Get.deleteAll(force: true);
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Arnab Mondal - Portfolio',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.light, // Start with light theme by default
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      defaultTransition: Transition.fade,
      enableLog: true,
      builder: (context, child) {
        // Add a top-level error boundary
        return child ?? const SizedBox();
      },
    );
  }
}

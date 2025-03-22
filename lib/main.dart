import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio_web/app/routes/app_pages.dart';
import 'package:portfolio_web/utils/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Firebase initialization commented out temporarily
  // await Firebase.initializeApp(
  //   options: const FirebaseOptions(
  //     apiKey: "YOUR_API_KEY",
  //     authDomain: "YOUR_AUTH_DOMAIN",
  //     projectId: "YOUR_PROJECT_ID",
  //     storageBucket: "YOUR_STORAGE_BUCKET",
  //     messagingSenderId: "YOUR_MESSAGING_SENDER_ID",
  //     appId: "YOUR_APP_ID",
  //     measurementId: "YOUR_MEASUREMENT_ID",
  //   ),
  // );
  
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

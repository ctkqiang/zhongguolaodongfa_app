import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zhongguolaodongfa_app/constant/Strings.dart';
import 'package:zhongguolaodongfa_app/pages/splash.dart';

Future<void> main() async {
  try {
    WidgetsFlutterBinding.ensureInitialized();

    runApp(const MyApp());
  } catch (issue) {
    throw issue.toString();
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: appName,
      theme: ThemeData(
        primarySwatch: Colors.red,
        fontFamily: "main",
      ),
      home: const SplashScreen(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_dotid_mobiledev_test/pages/main_page.dart';
import 'package:flutter_dotid_mobiledev_test/pages/login_page.dart';
import 'package:flutter_dotid_mobiledev_test/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      // home: Routes.mainPage,
      initialRoute: Routes.mainPage,
      routes: routes,
    );
  }
}

class Routes {
  static const String mainPage = "/main";
  static const String loginPage = "/login";
  static const String homePage = "/home";
}

Map<String, Widget Function(BuildContext)> routes = {
  Routes.mainPage: (context) => MainPage(),
  Routes.loginPage: (context) => LoginPage(),
  Routes.homePage: (context) => HomePage()
};
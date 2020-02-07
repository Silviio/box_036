import 'package:box036/screens/home_screen.dart';
import 'package:box036/screens/splash_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Box 036',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      initialRoute: SplashScreen.kRoute,
      routes: {
        HomeScreen.kRoute: (context) => HomeScreen(),
        SplashScreen.kRoute: (context) => SplashScreen()
      },
    );
  }
}

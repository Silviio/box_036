import 'package:box036/constants/string_value.dart';
import 'package:box036/screens/home_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  static const String kRoute = '/splash';

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _visible = false;
  @override
  void initState() {
    super.initState();
    _initAnimationTransition();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: AnimatedOpacity(
            duration: Duration(seconds: 1),
            opacity: _visible ? 1.0 : 0.0,
            child: Container(
              height: 60.0,
              child: Image.asset(Strings.gymImage),
            ),
          ),
        ),
      ),
    );
  }

  void _initAnimationTransition() async {
    await Future.delayed(Duration(milliseconds: 50)).then((_) {
      setState(() {
        _visible = true;
      });
    }).then((_) async {
      await Future.delayed(Duration(seconds: 1, milliseconds: 50));

      Navigator.pushNamedAndRemoveUntil(
          context, HomeScreen.kRoute, (_) => false);
    });
  }
}

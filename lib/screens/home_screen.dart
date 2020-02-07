import 'dart:async';

import 'package:box036/constants/component.dart';
import 'package:box036/constants/string_value.dart';
import 'package:box036/layout/layout_point_card.dart';
import 'package:flutter/material.dart';
import 'package:connectivity/connectivity.dart';

class HomeScreen extends StatefulWidget {
  static const kRoute = '/';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _hasConnection = true;
  StreamSubscription<ConnectivityResult> _subscription;

  @override
  void initState() {
    super.initState();
    _checkConnectivity();
  }

  @override
  void dispose() {
    super.dispose();
    _subscription.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder<bool>(
            future: _getHome(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (snapshot.data) {
                return _getHomeContent();
              } else {
                return _getInternetWarning();
              }
            }));
  }

  Widget _getHomeContent() {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          automaticallyImplyLeading: false,
          elevation: 8.0,
          forceElevated: true,
          floating: true,
          centerTitle: true,
          title: Text(
            Strings.title,
            style: kAppBarTextStyle,
          ),
          flexibleSpace: Container(
            decoration: kDefaultBoxDecoration,
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              if (index == 0) {
                return LayoutBuilder(builder: (context, constraint) {
                  if (constraint.maxWidth > 600) {
                    return LayoutPointCardManager.of(context)
                        .getLayoutForLargeScreen();
                  } else {
                    return LayoutPointCardManager.of(context)
                        .getLayoutForSmallScreen();
                  }
                });
              } else {
                return null;
              }
            },
          ),
        )
      ],
    );
  }

  Widget _getInternetWarning() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
              width: 100, height: 100, child: Image.asset(Strings.robotImage)),
          SizedBox(
            height: 8.0,
          ),
          Text(
            Strings.internetWarning,
            textAlign: TextAlign.center,
            style: kDefaultTextStyle.copyWith(
                fontSize: 19.0, fontWeight: FontWeight.bold),
          ),
          Text(Strings.checkConnection,
              style: kDefaultTextStyle.copyWith(
                  fontSize: 16.0, fontWeight: FontWeight.bold))
        ],
      ),
    );
  }

  _checkConnectivity() {
    _subscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      setState(() {
        if (result == ConnectivityResult.mobile ||
            result == ConnectivityResult.wifi) {
          _hasConnection = true;
        } else {
          _hasConnection = false;
        }
        _getHome();
      });
    });
  }

  Future<bool> _getHome() async {
    return _hasConnection;
  }
}

import 'package:box036/entitie/point.dart';
import 'package:box036/firebase/firebase_store.dart';
import 'package:flutter/material.dart';

import 'custom_dialog.dart';

class PointCard extends StatelessWidget {
  final Point point;
  final _firebaseStore = FirebaseStore();

  PointCard({this.point});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        //_firebaseStore.addPointsToFireStore(point);

        showDialog(
            barrierDismissible: false,
            context: context,
            builder: (BuildContext context) {
              Future.delayed(Duration(seconds: 1, milliseconds: 50), () {
                Navigator.of(context).pop(true);
              });

              return CustomDialog(
                title: "Obrigado!",
                description: 'Seu feedback foi adicionado com sucesso.',
                image: Image.asset(point.image),
              );
            });
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
        child: Stack(
          children: <Widget>[
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Text(
                      point.title,
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          color: Colors.white,
                          fontSize: 18.0,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  Container(height: 8.0),
                  Padding(
                    padding: EdgeInsets.only(left: 6.0),
                    child: Text(point.description,
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            color: Colors.white,
                            fontSize: 24.0,
                            fontWeight: FontWeight.w500)),
                  ),
                ],
              ),
              height: 124.0,
              margin: EdgeInsets.only(left: 46.0),
              decoration: BoxDecoration(
                color: point.color,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(8.0),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10.0,
                    offset: Offset(0.0, 10.0),
                  ),
                ],
              ),
            ),
            Container(
                margin: EdgeInsets.symmetric(vertical: 16.0),
                alignment: FractionalOffset.centerLeft,
                child: Image.asset(
                  point.image,
                  height: 92.0,
                  width: 92.0,
                ))
          ],
        ),
      ),
    );
  }
}

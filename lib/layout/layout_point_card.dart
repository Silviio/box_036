import 'package:box036/model/point_model.dart';
import 'package:box036/widgets/point_card.dart';
import 'package:flutter/material.dart';

class LayoutPointCardManager {
  static BuildContext _context;

  Widget getLayoutForSmallScreen() {
    return Column(
      children: List.generate(pointsList.length, (index) {
        return PointCard(point: pointsList[index]);
      }),
    );
  }

  Widget getLayoutForLargeScreen() {
    return Column(
      children: List.generate(pointsMap.length, (index) {
        if (index == pointsMap.length - 1) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                width: (MediaQuery.of(_context).size.width / 2),
                child: PointCard(point: pointsMap[index][0]),
              )
            ],
          );
        }

        return Row(
          children: <Widget>[
            Expanded(child: PointCard(point: pointsMap[index][0])),
            Expanded(child: PointCard(point: pointsMap[index][1])),
          ],
        );
      }),
    );
  }

  static LayoutPointCardManager of(BuildContext context) {
    _context = context;
    return LayoutPointCardManager();
  }
}

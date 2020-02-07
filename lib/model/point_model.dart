import 'package:box036/entitie/point.dart';
import 'package:flutter/material.dart';

List<Point> pointsList = [
  Point(
      id: 1,
      title: 'Leve',
      description: '0 - 2',
      value: 1,
      color: Colors.blue,
      image: 'images/veryhappy.png'),
  Point(
      id: 2,
      title: ' Moderado',
      description: '3 - 4',
      value: 2,
      color: Colors.green,
      image: 'images/happy.png'),
  Point(
      id: 3,
      title: 'Pesado',
      description: '5 - 6',
      value: 3,
      color: Colors.yellow[700],
      image: 'images/neutral.png'),
  Point(
      id: 4,
      title: 'Muito Pesado',
      description: '7 - 8',
      value: 4,
      color: Colors.orangeAccent,
      image: 'images/sweat.png'),
  Point(
      id: 5,
      title: 'Extremamente Pesado',
      description: '9 - 10',
      value: 5,
      color: Colors.red,
      image: 'images/dead.png'),
];

Map<int, List<Point>> pointsMap = {
  0: [
    Point(
        id: 1,
        title: 'Leve',
        description: '0 - 2',
        value: 1,
        color: Colors.blue,
        image: 'images/veryhappy.png'),
    Point(
        id: 2,
        title: ' Moderado',
        description: '3 - 4',
        value: 2,
        color: Colors.green,
        image: 'images/happy.png')
  ],
  1: [
    Point(
        id: 3,
        title: 'Pesado',
        description: '5 - 6',
        value: 3,
        color: Colors.yellow[700],
        image: 'images/neutral.png'),
    Point(
        id: 4,
        title: 'Muito Pesado',
        description: '7 - 8',
        value: 4,
        color: Colors.orangeAccent,
        image: 'images/sweat.png'),
  ],
  2: [
    Point(
        id: 5,
        title: 'Extremamente Pesado',
        description: '9 - 10',
        value: 5,
        color: Colors.red,
        image: 'images/dead.png'),
  ]
};

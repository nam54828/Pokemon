import 'package:flutter/cupertino.dart';
import 'package:pokemon/home.dart';

class selectOption{
  final String text;
  final String image;
  final Widget route;
  selectOption(this.text,this.image,this.route);
}

final List<selectOption> selectOptions = <selectOption>[
  selectOption('Pokemon', 'images/ball.png', Home()),
  selectOption('Favorite', 'images/touch.png', Home()),
  selectOption('Cart', 'images/trolley.png', Home()),
  selectOption('Term', 'images/terms.png', Home()),
];


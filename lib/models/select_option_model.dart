import 'package:flutter/cupertino.dart';
import 'package:pokemon/home.dart';
import 'package:pokemon/view/Favorite/favorite_screen.dart';
import 'package:pokemon/view/Pokemon/select_pokemon.dart';
import 'package:pokemon/view/Term/terms.dart';

class selectOption{
  final String text;
  final String image;
  final Widget route;
  selectOption(this.text,this.image,this.route);
}

final List<selectOption> selectOptions = <selectOption>[
  selectOption('Pokemon', 'images/ball.png', SelectPokemon()),
  selectOption('Favorite', 'images/touch.png', FavoriteScreen()),
  selectOption('Cart', 'images/trolley.png', Home()),
  selectOption('Term', 'images/terms.png', Terms()),
];


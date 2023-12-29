import 'package:flutter/material.dart';
import 'pokemon_api_models.dart';

class CartModels extends ChangeNotifier{
  final List<APIPokemon> _carts = [];
  List<APIPokemon> get carts => _carts;

  void addCart(APIPokemon pokemon){
    if(!_carts.any((element) => element.id == pokemon.id)){
      _carts.add(pokemon);
      notifyListeners();
    }
  }

  void removeCart(APIPokemon pokemon){
    _carts.removeWhere((element) => element.id == pokemon.id);
    notifyListeners();
  }

  bool isCart(APIPokemon pokemon){
    return _carts.any((element) => element.id == pokemon.id);
  }
}
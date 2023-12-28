

import 'package:flutter/cupertino.dart';
import 'package:pokemon/models/pokemon_api_models.dart';

class FavoriteModel extends ChangeNotifier {

  final List<APIPokemon> _favorites =[];
  List<APIPokemon> get favorites => _favorites;

  void addFavorite(APIPokemon pokemon){
    if(!_favorites.any((element) => element.id == pokemon.id)){
      _favorites.add(pokemon);
      notifyListeners();
    }
  }
  void removeFavorite(APIPokemon pokemon){
   _favorites.removeWhere((element) => element.id == pokemon.id);
   notifyListeners();
  }
  bool isFavorite(APIPokemon pokemon){
    return _favorites.any((element) => element.id == pokemon.id);
  }
}
import 'package:flutter/cupertino.dart';

import '../models/pokemon_api_models.dart';

class SearchProvider extends ChangeNotifier {
  List<APIPokemon> allPokemons = [];
  List<APIPokemon> filteredPokemons = [];

  bool _isSearching = false;
  bool get isSearching => _isSearching;

  void setSearching(bool value) {
    _isSearching = value;
    notifyListeners();
  }

  void initializePokemons(List<APIPokemon> pokemons) {
    allPokemons = pokemons;
    filteredPokemons = List<APIPokemon>.from(allPokemons);
    notifyListeners();
  }

  void filterPokemons(String query) {
    if (query.isEmpty) {
      filteredPokemons = allPokemons;
    } else {
      filteredPokemons = allPokemons
          .where((pokemon) => pokemon.name!.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
    notifyListeners();
  }
}

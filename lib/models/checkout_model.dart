import 'package:flutter/foundation.dart';
import 'package:pokemon/models/pokemon_api_models.dart';

class Checkout extends ChangeNotifier {
  static int calculatorToalPrice(List<APIPokemon> cartItems) {
    int total = 0;
    for (var pokemon in cartItems){
      total += pokemon.price * pokemon.quantity;
    }
    return total;
  }
  List<APIPokemon> carts = [];
  void increaseItemQuantity(APIPokemon pokemon) {
    pokemon.quantity++;
    notifyListeners();
  }

  void decreaseItemQuantity(APIPokemon pokemon) {
    if (pokemon.quantity > 1) {
      pokemon.quantity--;
    }
    notifyListeners();
  }
}
import 'package:flutter/foundation.dart';
import 'package:pokemon/models/pokemon_api_models.dart';

class Checkout extends ChangeNotifier {
  static int calculatorToalPrice(List<APIPokemon> cartItems) {
    int total = 0;
    for (var item in cartItems){
      total += item.price * item.quantity;
    }
    return total;
  }
  List<APIPokemon> carts = [];
  void increaseItemQuantity(APIPokemon item) {
    item.quantity++;
    notifyListeners();
  }

  void decreaseItemQuantity(APIPokemon item) {
    if (item.quantity > 1) {
      item.quantity--;
      notifyListeners();
    }
  }
}
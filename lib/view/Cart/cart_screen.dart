import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pokemon/home.dart';
import 'package:pokemon/models/cart_models.dart';
import 'package:pokemon/models/pokemon_api_models.dart';
import 'package:pokemon/view/Cart/checkOut_Screen.dart';
import 'package:provider/provider.dart';

import '../../models/checkout_model.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    var carts = Provider.of<CartModels>(context, listen: true).carts;
    int totalPrice = Checkout.calculatorToalPrice(carts);
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("CART", style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18
        ),),
        centerTitle: true,
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: Icon(CupertinoIcons.left_chevron, color: Colors.white,)),
      ),
      body: Padding(padding: EdgeInsets.all(12),
          child: carts.isEmpty ? Center(
            child: Container(
              child: Text("Your Car Is Empty"),
            ),
          ) :
          ListView.builder(
            itemCount: carts.length,
            itemBuilder: (context, index){
              APIPokemon pokemon = carts[index];
              return Column(
                children: [
                  Card(
                    child: Row(
                      children: [
                        Image.network(
                          '${pokemon.img}',
                          height: 110,
                          width: 110,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  'Name: ${pokemon.name}',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,

                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                            Text("Price: ${pokemon.price}\$ ")
                          ],
                        ),
                      Row(
                        children: [
                          IconButton(
                            icon: Icon(Icons.remove),
                            onPressed: () {
                              setState(() {
                                // Decrease quantity
                                Provider.of<Checkout>(context, listen: false)
                                    .decreaseItemQuantity(pokemon);
                                print("remove");
                              });
                            },
                          ),
                          Text('${pokemon.quantity}'),
                          IconButton(
                            icon: Icon(Icons.add),
                            onPressed: () {
                              setState(() {
                                Provider.of<Checkout>(context, listen: false)
                                    .increaseItemQuantity(pokemon);
                                print("add");
                                print(totalPrice);
                              });
                            },
                          )

                        ],
                      )
                      ],
                    ) ,
                  )
                ],
              );
            },
          )
      ),

      bottomNavigationBar: Consumer<Checkout>(
        builder: (context, checkout, child) {
          return GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => CheckoutScreen()));
            },
            child: Container(
              height: 80,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("CHECK OUT - Total: \$${totalPrice}", style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),),
                  SizedBox(
                    width: 10,
                  ),
                  Icon(Icons.payment, color: Colors.white,)
                ],
              ),
              decoration: BoxDecoration(
                  color: Colors.grey
              ),
            ),
          );
        },
      ),
    ));
  }
}

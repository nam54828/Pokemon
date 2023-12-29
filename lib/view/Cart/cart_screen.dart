import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pokemon/home.dart';
import 'package:pokemon/models/cart_models.dart';
import 'package:pokemon/models/pokemon_api_models.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var carts = Provider.of<CartModels>(context, listen: true).carts;
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
            child: Text("Null"),
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
                      height: 120,
                      width: 120,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
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
                        Text("Quantity: ")
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
      bottomNavigationBar: Container(
        height: 80,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("CHECK OUT", style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white
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
    ));
  }
}

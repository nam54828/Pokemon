import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pokemon/models/pokemon_api_models.dart';

class AddToCart extends StatefulWidget {
  final APIPokemon postData;
  const AddToCart({Key? key, required this.postData}) : super(key: key);

  @override
  State<AddToCart> createState() => _AddToCartState();
}

class _AddToCartState extends State<AddToCart> {
  @override
  Widget build(BuildContext context) {
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
      body: SingleChildScrollView(
        child: Padding(padding: EdgeInsets.all(12),
        child: Column(
          children: [
            Card(
              child: Row(
                children: [
                  Image.network(
                    '${widget.postData.img}',
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
                          'Name: ${widget.postData.name}',
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
        ),),
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

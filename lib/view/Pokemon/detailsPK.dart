import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pokemon/models/favorite_models.dart';
import 'package:pokemon/models/pokemon_api_models.dart';
import 'package:pokemon/view/Cart/add_to_cart.dart';
import 'package:provider/provider.dart';
class DetailsPokemon extends StatefulWidget {
  final APIPokemon postData;
  const DetailsPokemon({Key? key, required this.postData}) : super(key: key);

  @override
  State<DetailsPokemon> createState() => _DetailsPokemonState();
}

class _DetailsPokemonState extends State<DetailsPokemon> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('${widget.postData.name}', style: TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),),
        centerTitle: true,
        actions: [
          Consumer<FavoriteModel>(
            builder: (context, favoriteModel, child) {
              bool isFavorite = favoriteModel.isFavorite(widget.postData);
              return IconButton(
                onPressed: () {
                  if (isFavorite) {
                    favoriteModel.removeFavorite(widget.postData);
                  } else {
                    favoriteModel.addFavorite(widget.postData);
                  }
                },
                icon: Icon(
                  isFavorite ? Icons.favorite : Icons.favorite_border,
                  color: isFavorite ? Colors.red : Colors.white,
                ),
              );
            },
          ),
        ],
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        },
            icon: Icon(CupertinoIcons.left_chevron, color: Colors.white,)),
      ),
      body: SingleChildScrollView(
        child: Padding(padding: EdgeInsets.all(12),
        child: Column(
              children: [
                Center(child: Image.network('${widget.postData.img}',fit: BoxFit.cover, height: 180)),
                Row(
                 crossAxisAlignment: CrossAxisAlignment.center,
                 children: [
                   Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       Text("Height: ", style: TextStyle(
                         fontWeight: FontWeight.bold,
                       ),),
                       Text("Candy: ", style: TextStyle(
                           fontWeight: FontWeight.bold
                       ),),
                       Text("Candy Count: ", style: TextStyle(
                           fontWeight: FontWeight.bold
                       ),),
                       Text("Egg: ", style: TextStyle(
                           fontWeight: FontWeight.bold
                       ),),
                       Text("Type: ", style: TextStyle(
                           fontWeight: FontWeight.bold
                       ),),
                       Text("Weight: ", style: TextStyle(
                           fontWeight: FontWeight.bold
                       ),),
                     ],
                   ),
                   SizedBox(
                     width: 50,
                   ),
                   Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       Text("${widget.postData.height}"),
                       Text("${widget.postData.candy}"),
                       Text("${widget.postData.candyCount}"),
                       Text("${widget.postData.egg}"),
                       Text("${widget.postData.type}"),
                       Text("${widget.postData.weight}")
                     ],
                   )
                 ],
               ),

              ],
        ),),
      ),
      bottomNavigationBar: Container(
        height: 80,
        child: GestureDetector(
         onTap: (){
           Navigator.push(context, MaterialPageRoute(builder: (context) => AddToCart(postData: widget.postData,)));
         },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Add To Cart", style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold
              ),),
              SizedBox(
                width: 10,
              ),
              Icon(CupertinoIcons.cart, color: Colors.white,)
            ],
          ),
        ),
        decoration: BoxDecoration(
          color: Colors.grey
        ),
      ),
    ));
  }
}

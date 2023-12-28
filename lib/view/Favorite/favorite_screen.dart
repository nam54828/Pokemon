import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pokemon/models/favorite_models.dart';
import 'package:provider/provider.dart';

import '../../models/pokemon_api_models.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var favorites = Provider.of<FavoriteModel>(context, listen: true).favorites;
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.black,
              title: Text(
                "FAVORITE",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
              centerTitle: true,
              leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    CupertinoIcons.left_chevron,
                    color: Colors.white,
                  )),
            ),
            body: Padding(
              padding: EdgeInsets.all(12),
              child: favorites.isEmpty
                  ? Center(child: Text('No favorites yet!!!'))
                  : ListView.builder(
                      itemCount: favorites.length,
                      itemBuilder: (context, index) {
                        APIPokemon pokemon = favorites[index];
                        return Card(
                          color: Colors.white,
                          child: GestureDetector(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Image.network(
                                  '${pokemon.img}',
                                  height: 120,
                                  width: 120,
                                ),
                                Text(
                                  '${pokemon.name}',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,

                                    fontSize: 16,
                                  ),
                                ),
                                Consumer<FavoriteModel>(builder:(context,favoriteModel,child){
                                  bool isFavorite = favoriteModel.isFavorite(pokemon);
                                  return IconButton(onPressed: (){
                                    if(isFavorite){
                                      favoriteModel.removeFavorite(pokemon);
                                    }else{
                                      favoriteModel.addFavorite(pokemon);
                                    }
                                  },
                                      icon: isFavorite ? Icon(Icons.favorite, color: Colors.red,) : Icon(Icons.favorite_border, color: Colors.white,));
                                })
                              ],
                            ),
                          ),
                        );
                      },
                    ),
            )));
  }
}

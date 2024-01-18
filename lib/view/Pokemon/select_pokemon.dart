import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pokemon/provider/search_provider.dart';
import 'package:pokemon/view/Seach/listview_search.dart';
import 'package:pokemon/view/Seach/search_pokemon.dart';
import 'package:pokemon/services/pokemon_api_services.dart';
import 'package:provider/provider.dart';

import 'detailsPK.dart';
import '../../models/pokemon_api_models.dart';

import 'package:shimmer/shimmer.dart';

class SelectPokemon extends StatefulWidget {
  const SelectPokemon({Key? key}) : super(key: key);

  @override
  State<SelectPokemon> createState() => _SelectPokemonState();
}

class _SelectPokemonState extends State<SelectPokemon> {
  List<APIPokemon> postDataApi = [];

  @override
  void initState() {
    super.initState();
    pokemonAPI.fetchPost().then((dataFromServer) {
      print(dataFromServer);
      setState(() {
        postDataApi = dataFromServer;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final isSearching = Provider.of<SearchProvider>(context).isSearching;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text(
            "POKÉMON",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: Colors.white,
            ),
          ),
          backgroundColor: Colors.black,
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              CupertinoIcons.back,
              color: Colors.white,
              size: 18,
            ),
          ),
        ),
        backgroundColor: Colors.black,
        body: Padding(
          padding: EdgeInsets.all(12),
          child: Column(
            children: [
              Flexible(
                  flex: 1,
                  child: Search()),
              Flexible(
                flex: 6,
                child: isSearching ? ListView_Search() : GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                  ),
                  itemCount: postDataApi.length,
                  itemBuilder: (BuildContext context, int index) {
                    if(postDataApi.isEmpty){
                      return Shimmer.fromColors(
                        baseColor: Colors.grey[400]!,
                        highlightColor: Colors.grey[200]!,
                        child: Card(
                          color: Colors.white,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 80,
                                width: 80,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                              ),
                              SizedBox(height: 8),
                              Container(
                                height: 16,
                                width: 100,
                                color: Colors.grey[300]!,
                              ),
                            ],
                          ),
                        ),
                      );
                    }else {
                      return Card(
                        color: Colors.white,
                        child: GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => DetailsPokemon(postData: postDataApi[index])));
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.network(
                                '${postDataApi[index].img}',
                                height: 120,
                                width: 120,
                              ),
                              SizedBox(height: 8),
                              Text(
                                '${postDataApi[index].name}',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,

                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}

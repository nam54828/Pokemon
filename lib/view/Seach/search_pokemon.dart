import 'package:flutter/material.dart';
import 'package:pokemon/provider/search_provider.dart';
import 'package:pokemon/services/pokemon_api_services.dart';
import 'package:pokemon/view/Pokemon/detailsPK.dart';
import 'package:provider/provider.dart';


class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  TextEditingController searchController = TextEditingController();
  FocusNode searchFocusNode = FocusNode();
  bool isSearching = false;

  @override
  void initState() {
    super.initState();
    fetchPokemons();
    searchFocusNode.addListener(() {
      setState(() {
        Provider.of<SearchProvider>(context, listen: false).setSearching(searchFocusNode.hasFocus);
      });
    });
  }

  void fetchPokemons() async {
    try {
      var dataFromServer = await pokemonAPI.fetchPost();
      if (dataFromServer != null && dataFromServer.isNotEmpty) {
        Provider.of<SearchProvider>(context, listen: false).initializePokemons(dataFromServer);
      } else {
        print('No data received');
      }
    } catch (e) {
      print('Error fetching data: $e');
    }
  }
  @override
  Widget build(BuildContext context) {
    final searchProvider = Provider.of<SearchProvider>(context);
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: searchController,
            decoration: InputDecoration(
              hintText: "Search Pokemon",
              hintStyle: TextStyle(color: Colors.grey),
              prefixIcon: Icon(Icons.search, color: Colors.black),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide.none,
              ),
              filled: true,
              fillColor: Colors.white,
            ),
            onChanged: (value){
              searchProvider.filterPokemons(value);
            },
            focusNode: searchFocusNode,
            style: TextStyle(color: Colors.black),
          ),
        ),
        if (isSearching)
          Expanded(
              child: Consumer<SearchProvider>(
                builder: (context, searchProvider, child) {
                  return ListView.builder(
                    itemCount: searchProvider.filteredPokemons.length,
                    itemBuilder: (context, index) {
                      var pokemon = searchProvider.filteredPokemons[index];
                      return ListTile(
                        title: Text(pokemon.name ?? 'No Name', style: TextStyle(
                            color: Colors.white
                        ),),
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => DetailsPokemon(postData: pokemon)));
                        },
                      );
                    },
                  );
                },
              )

          ),
      ],
    );
  }

  @override
  void dispose() {
    searchController.dispose();
    searchFocusNode.dispose();
    super.dispose();
  }
}
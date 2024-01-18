import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/search_provider.dart';
import '../Pokemon/detailsPK.dart';

class ListView_Search extends StatelessWidget {
  const ListView_Search({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final searchProvider = Provider.of<SearchProvider>(context);
    if (searchProvider.isSearching &&
        searchProvider.filteredPokemons.isNotEmpty) {
      return ListView.builder(
        itemCount: searchProvider.filteredPokemons.length,
        itemBuilder: (context, index) {
          var pokemon = searchProvider.filteredPokemons[index];
          return ListTile(
            title: Text(pokemon.name ?? 'No Name',
                style: TextStyle(color: Colors.white)),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                  builder: (context) => DetailsPokemon(postData: pokemon)));
            },
          );
        },
      );
    } else {
      return Container();
    }
  }
}

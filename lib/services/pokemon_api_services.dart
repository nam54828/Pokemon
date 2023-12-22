import 'dart:convert' ;

import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';

import 'package:pokemon/models/pokemon_api_models.dart';

class pokemonAPI {
  static const String url = 'https://6585bd87022766bcb8c945ba.mockapi.io/pokemon';
  static List<APIPokemon> parsePost(String responseBody){
      var list = json.decode(responseBody) as List<dynamic>;
      List<APIPokemon> apiPokemons = list.map((model) => APIPokemon.fromJson(model)).toList();
      return apiPokemons;
  }

  static Future<List<APIPokemon>> fetchPost({int page = 1}) async {
      http.Response response = await http.get(Uri.parse(url));
      String source = Utf8Decoder().convert(response.bodyBytes);
      if (response.statusCode == 200) {
        return compute(parsePost, source);
      }else if ( response.statusCode == 404) {
        throw Exception('Not Found');
      }else {
        throw Exception('Can\'t get post');
      }
  }

}


import 'package:flutter/material.dart';
import 'package:pokemon/models/cart_models.dart';
import 'package:pokemon/provider/video_provider.dart';
import 'package:pokemon/video_PK.dart';
import 'package:provider/provider.dart';
import 'models/favorite_models.dart';
import 'home.dart';

void main() {
  runApp(
    MultiProvider(providers: [
     ChangeNotifierProvider(create: (context) => VideoProvider()),
    ChangeNotifierProvider(create: (context) => FavoriteModel()),
      ChangeNotifierProvider(create: (context) => CartModels()),
    ],
    child: const MyApp(),
    ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pokémon',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Home(),
    );
  }
}

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pokemon/models/cart_models.dart';
import 'package:pokemon/models/checkout_model.dart';
import 'package:pokemon/models/pokemon_api_models.dart';
import 'package:pokemon/provider/search_provider.dart';
import 'package:pokemon/provider/video_provider.dart';
import 'package:pokemon/view/Login/login.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';
import 'models/favorite_models.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MultiProvider(providers: [
     ChangeNotifierProvider(create: (context) => VideoProvider()),
    ChangeNotifierProvider(create: (context) => FavoriteModel()),
      ChangeNotifierProvider(create: (context) => CartModels()),
      ChangeNotifierProvider(create: (context) => SearchProvider()),
      ChangeNotifierProvider(create: (context) => Checkout()),
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
      home: Login(),
    );
  }
}

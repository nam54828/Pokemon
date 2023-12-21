import 'package:flutter/material.dart';
import 'package:pokemon/provider/video_provider.dart';
import 'package:pokemon/video_PK.dart';
import 'package:provider/provider.dart';

import 'home.dart';

void main() {
  runApp(
    MultiProvider(providers: [
     ChangeNotifierProvider(create: (context) => VideoProvider())
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

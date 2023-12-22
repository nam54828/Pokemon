import 'package:flutter/material.dart';
import 'package:pokemon/models/select_option_model.dart';
import 'package:pokemon/search_pokemon.dart';
import 'package:pokemon/select_option.dart';
import 'package:pokemon/video_PK.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Positioned(
            top: -50,
            right: -95,
            child: Container(
              width: 180,
              height: 180,
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage("images/pokeball.png"),
                fit: BoxFit.cover,
                opacity: 0.2),
              ),
            ),
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 12, left: 5),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                        height: 100,
                        child: Text(
                          "What Pokémon are you\nlooking for?",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 28,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  Search(),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                      height: 280,
                      child: Expanded(child: SelectOption())),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text("Watch", style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      color: Colors.white
                    ),),
                  ),
                   SizedBox(
                     height: 10,
                   ),
                   Container(
                       height: 300,
                       child: videoPlayerPK()),
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }
}

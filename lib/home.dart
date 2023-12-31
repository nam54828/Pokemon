import 'package:flutter/material.dart';
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
          drawer: Drawer(
            child: ListView(
              // Important: Remove any padding from the ListView.
              padding: EdgeInsets.zero,
              children: <Widget>[
                DrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.blue,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleAvatar(
                          radius: 35,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Do Duc Nam", style: TextStyle(
                            fontWeight: FontWeight.bold
                          ),),
                          Text("dnam37035@gmail.com", style: TextStyle(
                            fontSize: 13
                          ),),
                        ],
                      )
                    ],
                  )
                ),
                ListTile(
                  leading: Icon(Icons.catching_pokemon, color: Colors.redAccent,),
                  title: Text('Pokemon'),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SelectOption()));
                  },
                ),
                ListTile(
                  leading: Icon(Icons.favorite, color:  Colors.red,),
                  title: Text('Favorite'),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SelectOption()));
                  },
                ),
                ListTile(
                  leading: Icon(Icons.shopping_cart, color: Colors.blue,),
                  title: Text('Cart'),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SelectOption()));
                  },
                ),
                ListTile(
                  leading: Icon(Icons.rule_sharp, color: Colors.purple,),
                  title: Text('Terms'),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SelectOption()));
                  },
                ),
                ListTile(
                  leading: Icon(Icons.settings),
                  title: Text('Setting'),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SelectOption()));
                  },
                ),
                ListTile(
                  leading: Icon(Icons.logout, color: Colors.pinkAccent,),
                  title: Text('LogOut'),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SelectOption()));
                  },
                ),
              ],
            ),
          ),
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

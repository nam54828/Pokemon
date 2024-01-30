import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pokemon/provider/search_provider.dart';
import 'package:pokemon/view/Cart/cart_screen.dart';
import 'package:pokemon/view/Favorite/favorite_screen.dart';
import 'package:pokemon/view/Pokemon/select_pokemon.dart';
import 'package:pokemon/view/Seach/listview_search.dart';
import 'package:pokemon/view/Seach/search_pokemon.dart';
import 'package:pokemon/select_option.dart';
import 'package:pokemon/video_PK.dart';
import 'package:pokemon/view/Login/login.dart';
import 'package:pokemon/view/Term/terms.dart';
import 'package:provider/provider.dart';


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final auth = FirebaseAuth.instance;
  final currentUser = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    var isSearching = Provider.of<SearchProvider>(context).isSearching;
    return SafeArea(
        child: Scaffold(
      drawer: Drawer(
        child: ListView(
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
                        Text(
                          "Do Duc Nam",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "dnam37035@gmail.com",
                          style: TextStyle(fontSize: 13),
                        ),
                      ],
                    )
                  ],
                )),
            ListTile(
              leading: Icon(
                Icons.catching_pokemon,
                color: Colors.redAccent,
              ),
              title: Text('Pokemon'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SelectPokemon()));
              },
            ),
            ListTile(
              leading: Icon(
                Icons.favorite,
                color: Colors.red,
              ),
              title: Text('Favorite'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => FavoriteScreen()));
              },
            ),
            ListTile(
              leading: Icon(
                Icons.shopping_cart,
                color: Colors.blue,
              ),
              title: Text('My Order'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CartScreen()));
              },
            ),
            ListTile(
              leading: Icon(
                Icons.rule_sharp,
                color: Colors.purple,
              ),
              title: Text('Terms'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Terms()));
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
              leading: Icon(
                Icons.logout,
                color: Colors.pinkAccent,
              ),
              title: Text('LogOut'),
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Login()));
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
                image: DecorationImage(
                    image: AssetImage("images/pokeball.png"),
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
                  Container(height: 80, child: Search()),
                  isSearching
                      ? Container(
                      height:500,
                      child: ListView_Search())
                      : Column(
                          children: [
                            SizedBox(
                              height: 20,
                            ),
                            Container(height: 280, child: SelectOption()),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                "Watch",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 24,
                                    color: Colors.white),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(height: 300, child: videoPlayerPK()),
                          ],
                        )
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }
}

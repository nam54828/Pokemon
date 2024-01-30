import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pokemon/models/cart_models.dart';
import 'package:pokemon/models/pokemon_api_models.dart';
import 'package:pokemon/models/checkout_model.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({Key? key}) : super(key: key);

  @override
  _CheckoutScreenState createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();

  bool isEditing = false;

  @override
  Widget build(BuildContext context) {
    var carts = Provider.of<CartModels>(context, listen: true).carts;
    int totalPrice = Checkout.calculatorToalPrice(carts);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("CHECKOUT", style: TextStyle(
            fontWeight: FontWeight.bold
          ),),
            centerTitle: true,
          leading: IconButton(onPressed: (){
            Navigator.pop(context);
          }, icon: Icon(CupertinoIcons.left_chevron)),
        ),
        body: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    "Personal Information",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  IconButton(
                    onPressed: () async {
                      if (isEditing) {
                        // If in editing mode, save the data to Firestore
                        try {
                          User? user = FirebaseAuth.instance.currentUser;

                          if (user != null) {
                            await FirebaseFirestore.instance.collection('users').doc(user.uid).set({
                              'name': _nameController.text,
                              'phone': _phoneController.text,
                              'address': _addressController.text,
                              'timestamp': FieldValue.serverTimestamp(),
                            });

                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('User data saved successfully!'),
                                duration: Duration(seconds: 2),
                              ),
                            );
                          } else {
                            print("User not authenticated");
                          }
                        } catch (e) {
                          print("Error: $e");
                        }
                      }

                      // Toggle the editing state
                      setState(() {
                        isEditing = !isEditing;
                      });
                    },
                    icon: isEditing ? Icon(Icons.save) : Icon(Icons.edit),
                  )
                ],
              ),
              SizedBox(height: 8),
              // Check if there is saved user information
              StreamBuilder(
                stream: FirebaseFirestore.instance.collection('users').doc(FirebaseAuth.instance.currentUser!.uid).snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasData && snapshot.data!.exists) {
                    Map<String, dynamic> userData = snapshot.data!.data() as Map<String, dynamic>;
                    _nameController.text = userData['name'];
                    _phoneController.text = userData['phone'];
                    _addressController.text = userData['address'];

                    return isEditing
                        ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextFormField(
                          controller: _nameController,
                          decoration: InputDecoration(
                            hintText: "Enter your name",
                            border: OutlineInputBorder(),
                          ),
                        ),
                        SizedBox(height: 8),
                        TextFormField(
                          controller: _phoneController,
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                            hintText: "Enter your phone number",
                            border: OutlineInputBorder(),
                          ),
                        ),
                        SizedBox(height: 8),
                        TextFormField(
                          controller: _addressController,
                          decoration: InputDecoration(
                            hintText: "Enter your delivery address",
                            border: OutlineInputBorder(),
                          ),
                        ),
                        SizedBox(height: 16),
                      ],
                    )
                        : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Name: ${userData['name']}"),
                        Text("Phone: ${userData['phone']}"),
                        Text("Address: ${userData['address']}"),
                        SizedBox(height: 16),
                      ],
                    );
                  } else {
                    return SizedBox.shrink();
                  }
                },
              ),
              SizedBox(height: 16),
              Text(
                "Order Summary",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              SizedBox(height: 8),
              Expanded(
                child: ListView.builder(
                  itemCount: carts.length,
                  itemBuilder: (context, index) {
                    APIPokemon pokemon = carts[index];
                    return ListTile(
                      title: Text('${pokemon.name} x ${pokemon.quantity}'),
                      subtitle: Text("Price: \$${pokemon.price}"),
                      leading: Image.network("${pokemon.img}"),
                    );
                  },
                ),
              ),
              SizedBox(height: 16),
              SizedBox(
                width: 440,
                child: ElevatedButton(
                  onPressed: () async {
                    bool confirmOrder = await showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text("Confirm Order"),
                          content: Text("Do you want to place the order?"),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop(false);
                              },
                              child: Text("Cancel"),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop(true);
                              },
                              child: Text("OK"),
                            ),
                          ],
                        );
                      },
                    );

                    if (confirmOrder == true) {
                      try {
                        User? user = FirebaseAuth.instance.currentUser;

                        if (user != null) {
                          await FirebaseFirestore.instance.collection('users').doc(user.uid).set({
                            'name': _nameController.text,
                            'phone': _phoneController.text,
                            'address': _addressController.text,
                            'timestamp': FieldValue.serverTimestamp(),
                          });

                          await FirebaseFirestore.instance.collection('myOrder').add({
                            'userId': user.uid,
                            'name': _nameController.text,
                            'phone': _phoneController.text,
                            'address': _addressController.text,
                            'orderItems': carts.map((pokemon) {
                              return {
                                'name': pokemon.name,
                                'quantity': pokemon.quantity,
                                'price': pokemon.price,
                              };
                            }).toList(),
                            'totalPrice': totalPrice,
                            'timestamp': FieldValue.serverTimestamp(),
                          });

                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Order placed successfully!'),
                              duration: Duration(seconds: 2),
                            ),
                          );

                          // Navigate back to home after checkout
                          Navigator.pop(context);
                        } else {
                          print("User not authenticated");
                        }
                      } catch (e) {
                        print("Error: $e");
                      }
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.orangeAccent,
                    padding: EdgeInsets.symmetric(vertical: 16),
                  ),
                  child: Text(
                    "Place Order - Total: \$${totalPrice}",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../models/orderItem_models.dart';
import 'order_list.dart';

class My_Order extends StatelessWidget {
  const My_Order({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    User? currentUser = FirebaseAuth.instance.currentUser;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "My Order",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(CupertinoIcons.left_chevron),
        ),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection("myOrder").where(
          'userId', isEqualTo: currentUser?.uid
        ).snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return CircularProgressIndicator();
          }
          var documents = snapshot.data!.docs;
          return ListView.builder(
            itemCount: documents.length,
            itemBuilder: (context, index) {
              var orderData = documents[index].data() as Map<String, dynamic>;

              return OrderListItem(
                totalPrice: orderData['totalPrice'],
                orderItems: (orderData['orderItems'] as List<dynamic>).map((item) {
                  return OrderItem(
                    name: item['name'],
                    quantity: item['quantity'],
                    price: item['price'],
                    img:  item['img']
                  );
                }).toList(),
              );
            },
          );
        },
      ),
    );
  }
}

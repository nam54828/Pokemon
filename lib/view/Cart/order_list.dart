import 'package:flutter/material.dart';

import '../../models/orderItem_models.dart';

class OrderListItem extends StatelessWidget {
  final int totalPrice;
  final List<OrderItem> orderItems;

  OrderListItem({
    required this.totalPrice,
    required this.orderItems,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListView.builder(
            shrinkWrap: true,
            itemCount: orderItems.length,
            itemBuilder: (context, index) {
              return Card(
                margin: EdgeInsets.all(8),
                child: ListTile(
                  contentPadding: EdgeInsets.all(8),
                  leading: Image.network("${orderItems[index].img}", width: 80, height: 80, fit: BoxFit.cover),
                  title: Text("${orderItems[index].name}"),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Quantity: ${orderItems[index].quantity}"),
                      Text("Price: \$${orderItems[index].price}"),
                    ],
                  ),
                ),
              );
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Total Price: \$${totalPrice.toString()}",style: TextStyle(
                  fontWeight: FontWeight.bold
                ),),
              )
            ],
          ),
          SizedBox(height: 18),
        ],
      ),
    );
  }
}

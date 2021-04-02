import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/components/main_drawer.component.dart';
import 'package:shop_app/components/order_item.component.dart';
import 'package:shop_app/providers/orders.provider.dart' show Orders;

class OrdersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(
        title: Text('Your Orders'),
      ),
      body: RefreshIndicator(
        onRefresh: () =>
            Provider.of<Orders>(context, listen: false).fetchAndSetOrders(),
        child: FutureBuilder(
          future:
              Provider.of<Orders>(context, listen: false).fetchAndSetOrders(),
          builder: (context, dataSnapshot) {
            if (dataSnapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              if (dataSnapshot.error != null) {
                return Center(child: Text("An error ocurred!"));
              } else {
                return Consumer<Orders>(
                  builder: (_, orderData, child) => ListView.builder(
                    itemCount: orderData.orders.length,
                    itemBuilder: (context, i) => OrderItem(
                      orderData.orders[i],
                    ),
                  ),
                );
              }
            }
          },
        ),
      ),
    );
  }
}

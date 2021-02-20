import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/components/main_drawer.component.dart';
import 'package:shop_app/components/user_product_item.component.dart';
import 'package:shop_app/providers/products.provider.dart';

class UserProductsScreen extends StatelessWidget {
  static const routeName = '/user-products';

  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);

    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(
        title: Text('Your Products'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              // ...
            },
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: ListView.builder(
          itemCount: productsData.items.length,
          itemBuilder: (_, index) => UserProductItem(
            title: productsData.items[index].title,
            imageUrl: productsData.items[index].imageUrl,
          ),
        ),
      ),
    );
  }
}
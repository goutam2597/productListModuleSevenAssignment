
import 'package:flutter/material.dart';
import 'package:product_list_module_seven/pages/shopping_list.dart';

class CartPage extends StatelessWidget {
  final List<Product> products;
  final int totalProducts;

  CartPage({required this.products, required this.totalProducts});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Cart'),
      ),
      body: Center(
        child: Text('Total Products: $totalProducts'),
      ),
    );
  }
}

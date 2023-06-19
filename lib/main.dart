import 'package:flutter/material.dart';
import 'package:product_list_module_seven/pages/shopping_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Product List',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: ShoppingListPage(),
    );
  }
}
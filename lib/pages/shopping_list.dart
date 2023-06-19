import 'package:flutter/material.dart';
import 'package:product_list_module_seven/pages/cart_page.dart';

class ShoppingListPage extends StatefulWidget {
  const ShoppingListPage({super.key});

  @override
  State<ShoppingListPage> createState() => _ShoppingListPageState();
}

class _ShoppingListPageState extends State<ShoppingListPage> {

  List<Product> products = [
    Product('Strawberry', 10.99),
    Product('Watermelon', 19.99),
    Product('Grapefruit', 15.99),
    Product('Blueberry', 11.99),
    Product('Raspberry', 25.99),
    Product('Pomegranate', 17.99),
    Product('Avocado', 71.99),
    Product('Pineapple', 17.99),
    Product('Banana', 19.99),
    Product('Apples', 20.99),
    Product('Orange', 19.99),
    Product('Mango', 11.99),
  ];
  int totalProducts = 0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CartPage(products: products, totalProducts: totalProducts)),
          );
        },
        child: const Icon(Icons.shopping_cart),
      ),
      appBar: AppBar(
        title: Text('Product List'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context,index){
          return ListTile(
            title: Text(products[index].name),
            subtitle: Text('\$${products[index].price.toStringAsFixed(2)}'),
            trailing: CounterButton(
              product: products[index],
              onPressed: () {
                setState(() {
                  totalProducts++;
                  products[index].incrementCounter();
                  if (products[index].counter == 5) {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text('Congratulations!'),
                          content: Text('You\'ve bought 5 ${products[index].name}!'),
                          actions: <Widget>[
                            TextButton(
                              child: Text('Close'),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        );
                      },
                    );
                  }
                });
              },
            ),
          );
        },

      ),
    );
  }
}

class Product {
  final String name;
  final double price;
  int counter;

  Product(this.name, this.price) : counter = 0;

  void incrementCounter() {
    counter++;
  }
}

class CounterButton extends StatelessWidget {
  final Product product;
  final VoidCallback onPressed;

  CounterButton({required this.product, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Counter: ${product.counter}'),
        SizedBox(
          height: 30,
          child: ElevatedButton(
            onPressed: onPressed,
            child: Text('Buy Now'),
          ),
        ),
      ],
    );
  }
}


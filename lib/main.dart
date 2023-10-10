import 'package:flutter/material.dart';
import 'package:fruits_provider/screens/product_list.dart';
import 'package:fruits_provider/screens/cartProvider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(create: (context)=>CartProvider(),
    child: const Main(),
  ));
}

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return  const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProductList(),
    );
  }
}

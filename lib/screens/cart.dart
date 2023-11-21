import 'package:flutter/material.dart';
import 'package:fruits_provider/screens/cartProvider.dart';
import 'package:provider/provider.dart';

class Cart extends StatefulWidget {
  Cart({super.key,});


  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: GridView.builder(
                itemCount: context.read<CartProvider>().cart.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image(
                            image:
                                NetworkImage(context.read<CartProvider>().cart[index]['image'])),
                        Text(context.read<CartProvider>().cart[index]['name'],
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18)),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 40,
                              child: Text(
                                  context.read<CartProvider>().cart[index]['price'] +
                                      r'$' +
                                      (context.read<CartProvider>().cart[index]['weight']),
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15)),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 300,
                    childAspectRatio: 1.1 / 1.3,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20),
              ),
            )
          ],
        ),
      ),
    );
  }
}

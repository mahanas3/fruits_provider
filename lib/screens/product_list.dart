import 'package:flutter/material.dart';
import 'package:fruits_provider/screens/cartProvider.dart';
import 'package:provider/provider.dart';
import 'package:badges/badges.dart' as badges;
import 'cart.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  List<String> ProductName = [
    'Apple',
    'Mango',
    'Banana',
    'Grapes',
    'Watermelon',
    'Kivi',
    'Orange'
  ];

  List<String> ProductWeight = ['Kg', 'Doz', 'Doz', 'Kg', 'Kg', 'Pc', 'Doz'];

  List<String> ProductPrice = ['100', '100', '150', '120', '30', '200', '110'];

  List<String> ProductImages = [
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRdnlsncXm-IPn6h6P0E4hwPFg4RyFF9A17Aw&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ8OdF8KvgvksFVMdkPzrVZIDZXvme1maA0ig&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRZWfDy8Sim_edvBBamEmKYfy0_DGE4cpBZlQ&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR83zQMXwMS3ormYNUpdmYWlBn_Ks7O3clczA&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTHNXHJ0ALau4F9SrHn-FxYEzpoUtpHrh7pZw&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSWNN8JIli0PpbTsDiPAUbuYsiGM835OhM8vg&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTfzj2GnKV980b_ldLenIVmUiU_9O9Hs7AgTg&usqp=CAU'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: const Center(
            child: Text('Product  List',
                style: TextStyle(fontWeight: FontWeight.bold))),
        actions: [
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: badges.Badge(
                badgeContent:
                    Text(context.watch<CartProvider>().cart.length.toString()),
                child: IconButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Cart()));
                    },
                    icon: const Icon(Icons.shopping_cart))),
          ),
        ],
      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Expanded(
          child: ListView.builder(
            itemCount: ProductName.length,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Image(
                              height: 120,
                              width: 120,
                              image: NetworkImage(
                                  ProductImages[index].toString())),
                          const SizedBox(
                            width: 10,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(ProductName[index].toString(),
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold)),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                ProductWeight[index].toString() +
                                    r'$' +
                                    ProductPrice[index].toString(),
                                style: const TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: ElevatedButton(
                                onPressed: () {
                                  context.read<CartProvider>().addCart(
                                      context,
                                      ProductImages[index].toString(),
                                      ProductName[index].toString(),
                                      ProductPrice[index].toString(),
                                      ProductWeight[index].toString());
                                },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        Colors.black87 // Background color
                                    ),
                                child: const Text(
                                  'Add to cart',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                )),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        )
      ]),
    );
  }
}

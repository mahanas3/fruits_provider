import 'package:flutter/material.dart';
import 'package:fruits_provider/screens/cart.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
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

  List<int> ProductPrice = [100, 100, 50, 70, 30, 200, 50];

  List<String> ProductImages = [
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS6EDX1rf6co7ibu2jBqWrW9EXsb8dG51VCwA&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ8OdF8KvgvksFVMdkPzrVZIDZXvme1maA0ig&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRZWfDy8Sim_edvBBamEmKYfy0_DGE4cpBZlQ&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR83zQMXwMS3ormYNUpdmYWlBn_Ks7O3clczA&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTHNXHJ0ALau4F9SrHn-FxYEzpoUtpHrh7pZw&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSrEBkGmw7Ryxq6Ww2Uvpu5hsHSll818_AGmA&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSRC57mYmnDYx_FpmGdtJWlJREJnOGWkWnz3A&usqp=CAU'
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
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Cart()));
              },
              icon: const Icon(Icons.shopping_cart))
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
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => const Cart()));
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

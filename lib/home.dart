import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_catalogo/auth/auth_service.dart';
import 'package:web_catalogo/cart_service.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context, listen: false);
    final cartHelper = Provider.of<CartService>(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('HOME SCREEN'),
        leading: IconButton(
          onPressed: () {
            authService.logout();
            Navigator.pushReplacementNamed(context, 'login');
          },
          icon: const Icon(Icons.login_outlined),
        ),
        elevation: 0,
        actions: [
          Stack(
            children: [
              Center(
                child: IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, 'cart',
                          arguments: cartHelper.showList);
                    },
                    icon: const Icon(Icons.shopping_cart_outlined)),
              ),
              Positioned(
                  bottom: 2,
                  child: Text(
                    cartHelper.showList.length.toString(),
                  ))
            ],
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: const [
                  RowProducts(category: "Zapatillas"),
                  RowProducts(category: "Poleras"),
                  RowProducts(category: "Polos"),
                  RowProducts(category: "Buzos"),
                  RowProducts(category: "Artefactos de cocina"),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class RowProducts extends StatelessWidget {
  const RowProducts({super.key, required this.category});

  final String category;

  @override
  Widget build(BuildContext context) {
    final List<int> items = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: Text(
              category,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 15),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(children: [
                for (int i = 0; i < items.length; i++)
                  Products(
                    itemIndex: i,
                    category: category,
                  )
              ]),
            ),
          ),
        ],
      ),
    );
  }
}

class Products extends StatelessWidget {
  Products({
    super.key,
    required this.itemIndex,
    required this.category,
  });

  int itemIndex;
  String category;
  String name = "Nombre de producto";
  String description = "Descripción";
  int price = Random().nextInt(500);
  String units = "Cantidad *";

  @override
  Widget build(BuildContext context) {
    TextStyle myStyle = const TextStyle(color: Colors.white);

    Item itemSelected;
    final cartHelper = Provider.of<CartService>(context, listen: false);

    return InkWell(
      onTap: () {
        print(
            "Categoría de producto: $category - Indice de Producto: $itemIndex");
      },
      child: Stack(
        children: [
          Container(
            margin: const EdgeInsets.only(right: 10),
            decoration: const BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.all(Radius.circular(8))),
            width: 200,
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  child: Text(name, style: myStyle),
                ),
                Container(
                  padding: const EdgeInsets.all(15),
                  child: Text(description, style: myStyle),
                ),
                const Image(
                    image: AssetImage('assets/no-image-gallery.png'),
                    fit: BoxFit.cover),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text("S/. $price", style: myStyle),
                ),
                Container(
                  padding: const EdgeInsets.all(5),
                  child: Text(units, style: myStyle),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 20,
            right: 15,
            child: FloatingActionButton.small(
              child: const Icon(Icons.shopping_bag_rounded),
              onPressed: () {
                itemSelected = Item(
                    nameProduct: name,
                    priceProduct: price.toString(),
                    units: units);

                cartHelper.addCArt = itemSelected;
                print(cartHelper.showList);
              },
            ),
          )
        ],
      ),
    );
  }
}

class CustomScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}

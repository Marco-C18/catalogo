import 'package:flutter/material.dart';
import 'package:web_catalogo/cart_service.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    // print(ModalRoute.of(context)?.settings.arguments);
    final arguments = ModalRoute.of(context)?.settings.arguments;
    List<Item> listProducts;

    if (arguments != null) {
      listProducts = arguments as List<Item>;
    } else {
      listProducts = [];
    }

    //     [Item(nameProduct: "nameProduct", priceProduct: "", units: "units")];
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: const Text("CARRITO DE COMPRAS"),
      ),
      body: Container(
          child: listProducts.isEmpty
              ? const Center(
                  child: Text("Lista vacía"),
                )
              : ListView.builder(
                  itemCount: listProducts.length,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: const EdgeInsets.all(15),
                      child: Row(
                        children: [
                          Container(
                            height: 150,
                            width: 150,
                            color: Colors.grey,
                            margin: const EdgeInsets.only(right: 5),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(listProducts.elementAt(index).nameProduct,
                                  style: const TextStyle(fontSize: 30)),
                              Text(listProducts.elementAt(index).priceProduct,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  )),
                              Text(listProducts.elementAt(index).units),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                )),
      floatingActionButton: FloatingActionButton(
        elevation: 0,
        onPressed: listProducts.isEmpty
            ? null
            : () {
                print("Finalizar compra");
              },
        child: const Icon(Icons.attach_money),
      ),
    );
  }
}

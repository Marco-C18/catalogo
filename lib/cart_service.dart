import 'package:flutter/material.dart';

class Item {
  Item(
      {required this.nameProduct,
      required this.priceProduct,
      required this.units});

  String nameProduct = '';
  String priceProduct = '';
  String units = '';
}

class CartService extends ChangeNotifier {
  List<Item> cartItemsList = [];

  List<Item> get showList {
    return cartItemsList;
  }

  set addCArt(Item selectedItem) {
    cartItemsList.add(selectedItem);
    notifyListeners();
  }
}

import 'package:flutter/material.dart';
import '../models/cart.dart';

class CartProvider with ChangeNotifier{
  Map<int, CartItem> _items = {};

  Map<int, CartItem> get items => _items;

  void addCart(int productId, String name, double price, int qty, String kategori) {
    if( _items.containsKey(productId)) {
      _items.update(
        productId, 
        (value) => CartItem(
          id: value.id, 
          name: value.name, 
          price: value.price, 
          qty: value.qty! + qty,
          kategori: value.kategori,
        )
      );
    } else {
      _items.putIfAbsent(
        productId, 
        () => CartItem(
          id: DateTime.now().second.toInt(), 
          name: name, 
          price: price, 
          qty: qty,
          kategori: kategori
        )
      );
    }
    notifyListeners();
  }
}
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './providers/cart_provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    final items = cart.items;

    return Scaffold(
      appBar: AppBar(
        title: const Text('List Cart Item'),
      ),
      body: Text('${items[3]!.kategori}'),
    );
  }
}
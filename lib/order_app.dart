import 'package:flutter/material.dart';
import 'package:learningflutter_threemusketeers_ifcsore/cart_page.dart';
import 'package:learningflutter_threemusketeers_ifcsore/theme/colors.dart';
import 'package:learningflutter_threemusketeers_ifcsore/theme/typography.dart';
import 'package:provider/provider.dart';
import './widget/item_list.dart';
import '../providers/menu_provider.dart';

class OrderApp extends StatelessWidget {
  const OrderApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List Menu'),
        backgroundColor: $primary500,
        centerTitle: true,
      ), 
      body: FutureBuilder(
        future: context.read<MenuProvider>().getAndSetData(context),
        builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            }
          final allMenuMakanan = context.read<MenuProvider>().listMenu.where((element) => element.kategori == "makanan").toList();
          final allMenuMinuman = context.read<MenuProvider>().listMenu.where((element) => element.kategori == "minuman").toList();
          return Padding(
            padding: const EdgeInsets.all(10),
            child: Column(children: [
              const Align(
                alignment: Alignment.centerLeft, 
                child: Text('Makanan', style: $heading5Bold,),
              ),
              const Divider(),
              ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: allMenuMakanan.length,
                itemBuilder: (context, index) => ChangeNotifierProvider.value(
                  value: allMenuMakanan[index],
                  child: const ItemList(),
                ),
              ),
              const Align(
                alignment: Alignment.centerLeft, 
                child: Text('Minuman', style: $heading5Bold,),
              ),
              const Divider(),
              ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: allMenuMinuman.length,
                itemBuilder: (context, index) => ChangeNotifierProvider.value(
                  value: allMenuMinuman[index],
                  child: const ItemList(),
                ),
              ),
            ],),
          );
        },
      ),
      floatingActionButton: IconButton(
        onPressed: () {
          Route route = MaterialPageRoute(builder: (context) => const CartPage());
          Navigator.push(context, route);
        }, 
        icon: const Icon(Icons.add_shopping_cart)
      ),
    );
  }
}
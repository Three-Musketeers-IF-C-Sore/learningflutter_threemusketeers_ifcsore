import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../models/menu.dart';
import 'package:intl/intl.dart';
import '../providers/cart_provider.dart';

class ItemList extends StatefulWidget {
  const ItemList({super.key});

  @override
  State<ItemList> createState() => _ItemListState();
}

class _ItemListState extends State<ItemList> {
  TextEditingController qtyCtrl = TextEditingController();

  bool? isQtyEmpty;

  @override
  void initState() {
    qtyCtrl.text = "";
    isQtyEmpty = false;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final menuData = Provider.of<Menu>(context);
    final cart = Provider.of<CartProvider>(context);

    return Container(
      color: const Color.fromARGB(255, 123, 48, 243),
      margin: const EdgeInsets.only(bottom: 5),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
          Flexible(
            flex: 5,
            child: Text("${menuData.name!} ${menuData.kategori}", style: const TextStyle(color: Colors.white),),
          ),
          Flexible(
            flex: 2,
            child:
              Row(
                children: [
                  Text(NumberFormat.compactSimpleCurrency(locale: 'id-ID').format(menuData.price), style: const TextStyle(color: Colors.white),),
                  const Padding(padding: EdgeInsets.only(right: 20)),
                  Flexible(
                    child: TextField(
                      controller: qtyCtrl,
                      style: const TextStyle( fontSize: 16, height: 2.0, color: Colors.white ),
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly
                      ],
                      decoration: InputDecoration(
                        enabledBorder: const UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                        focusedBorder: const UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                        hintText: 'Qty',
                        hintStyle: const TextStyle(color: Colors.white),
                        contentPadding: const EdgeInsets.symmetric(horizontal: 3),
                        errorText: isQtyEmpty == true ? 'Qty is required' : null
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      if(qtyCtrl.text.isEmpty){
                        setState(() {
                          isQtyEmpty = true;
                        });
                      } else {
                        setState(() {
                          isQtyEmpty = false;
                          cart.addCart(menuData.id!, menuData.name!, menuData.price!, int.parse(qtyCtrl.text), menuData.kategori!);
                        });
                      }
                    }, 
                    icon: const Icon(Icons.add_box_outlined, color: Colors.white,))
                ],
              ),
          ),
        ]),
      ),
    );
  }
}
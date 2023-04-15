import 'package:flutter/material.dart';
import 'package:learningflutter_threemusketeers_ifcsore/confirm_order_page.dart';
import 'package:learningflutter_threemusketeers_ifcsore/order_app.dart';
import 'package:learningflutter_threemusketeers_ifcsore/service/navigate.dart';
import 'package:learningflutter_threemusketeers_ifcsore/theme/colors.dart';
import 'package:provider/provider.dart';
import './providers/cart_provider.dart';
import 'package:intl/intl.dart';
import 'package:learningflutter_threemusketeers_ifcsore/theme/typography.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  bool _enableRemove = false;
  bool _cultery = false;
  String _delivery = 'regular';

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final cart = Provider.of<CartProvider>(context, listen: false);
      cart.items.forEach((key, value) {
        value.isChecked = false;
      });
    });
  }
  
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Cart'),
        backgroundColor: $primary500,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              if(cart.items.values.toList().isNotEmpty) ...[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [ 
                    Row(
                    children: [
                      ChoiceChip(
                        label: Text("Select", style: _enableRemove ? const TextStyle(color: Colors.white) : const TextStyle(color: Colors.black)), 
                        selected: _enableRemove,
                        selectedColor: $primary500,
                        onSelected: (value) {
                          setState(() {
                            _enableRemove = value;
                          });
                        },
                      ),
                      if(_enableRemove) ...[
                        const Padding(padding: EdgeInsets.only(left: 5)),
                        ElevatedButton(    
                          style: ElevatedButton.styleFrom(
                            backgroundColor: $primary500,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                          ),       
                          onPressed: () {
                            setState(() {
                              cart.items.removeWhere((key, cartItem) {
                                return cartItem.isChecked == true;
                              });
                              _enableRemove = false;
                            });
                          }, 
                          child: const Text('Remove'))
                        ],
                      ]
                    ),
                    ElevatedButton(    
                      style: ElevatedButton.styleFrom(
                        backgroundColor: $primary500,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                      ),       
                      onPressed: () {
                        Route route = MaterialPageRoute(builder: (context) => const OrderApp());
                        Navigator.push(context, route);
                      }, 
                      child: const Text('Add Items')),
                  ]
                ),
                const Padding(padding: EdgeInsets.only(bottom: 5)),
                ListView.separated(
                separatorBuilder: (context, index) {
                  return const Padding(padding: EdgeInsets.all(3));
                },
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                padding: const EdgeInsets.only(bottom: 3),
                itemCount: cart.items.length,
                itemBuilder:(context, index) {
                  return ListTile(
                    tileColor: $primary500,
                    title: Text(cart.items.values.toList()[index].name as String, style: const TextStyle(color: Colors.white)),
                    subtitle: Text("Quantity: ${cart.items.values.toList()[index].qty}", style: const TextStyle(color: Colors.white),),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                          Text(NumberFormat.compactSimpleCurrency(locale: 'id-ID').format(cart.items.values.toList()[index].price), style: const TextStyle(color: Colors.white)),
                          if(_enableRemove) ...[
                            Checkbox(
                              value: cart.items.values.toList()[index].isChecked, 
                              onChanged: (value) {
                                setState(() {
                                  cart.items.values.toList()[index].isChecked = value;
                                });
                              })
                          ]
                        ]
                    ),
                  );
                }
              ),
              const Padding(padding: EdgeInsets.only(bottom: 20)),
              const Align(
                alignment: Alignment.centerLeft, 
                child: Text('Additional', style: $heading5Bold,),
              ),
              Container(
                color: $primary500,
                child: CheckboxListTile(
                  title: const Text('Request Cultery', style: TextStyle(color: Colors.white)),
                  subtitle: Text( _cultery ? 'Resto will provide if available!' : 'Tick only if needed!', style: const TextStyle(fontSize: 13, color: Color.fromARGB(199, 255, 255, 255)),),
                  value: _cultery,
                  onChanged: (value) {
                    setState(() {
                      _cultery = value!;
                    });
                  },
                ),
              ),
              const Padding(padding: EdgeInsets.only(bottom: 5)),
              const Align(
                alignment: Alignment.centerLeft, 
                child: Text('Delivery', style: $heading5Bold,),
              ),
              Container(
                color: $primary500,
                child: Column(children: [
                  RadioListTile(
                    value: 'instant', 
                    title: const Text('Instant', style: TextStyle(color: Colors.white),),
                    groupValue: _delivery,
                    onChanged: (value) {
                      setState(() {
                        _delivery = 'instant';
                      });
                    },
                    controlAffinity: ListTileControlAffinity.trailing,
                  ),
                  RadioListTile(
                    value: 'regular', 
                    title: const Text('Regular', style: TextStyle(color: Colors.white)),
                    groupValue: _delivery, 
                    onChanged: (value) {
                      setState(() {
                        _delivery = 'regular';
                      });
                    },
                    controlAffinity: ListTileControlAffinity.trailing,
                  ),
                ]),
              ),
              const Padding(padding: EdgeInsets.only(bottom: 10)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                const Align(
                  alignment: Alignment.centerLeft, 
                  child: Text('Total', style: $heading5Bold,),
                ),
                Text(NumberFormat.simpleCurrency(locale: 'id-ID').format(cart.totalHarga), style: $heading5Bold,),
              ]),
              const Padding(padding: EdgeInsets.only(bottom: 20)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                SizedBox(
                  width: 152,
                  height: 30,
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: $primary500),
                    ),
                    onPressed: () {
                      Navigator.of(context).popUntil((route) => route.isFirst);
                    }, 
                    child: const Text('Back to Home', style: TextStyle(color: Colors.black),),
                  ),
                ),
                const Padding(padding: EdgeInsets.only(left: 5)),
                SizedBox(
                  width: 152,
                  height: 30,
                  child: ElevatedButton(    
                    style: ElevatedButton.styleFrom(
                      backgroundColor: $primary500,
                    ),       
                    onPressed: () {                    
                      setState(() {
                        cart.items.clear();
                      });
                      navigate(context, const OrderConfirm());
                    }, 
                    child: const Text('Order')),
                )
              ],)
            ] else ...[
              Column(children: [
                Container(
                  color: $primary500,
                  width: 500,
                  padding: const EdgeInsets.all(10),
                  child: const Text('No item in your cart!', style: TextStyle(color: Colors.white),),
                ),
                const Padding(padding: EdgeInsets.only(top: 10)),
                ElevatedButton(    
                  style: ElevatedButton.styleFrom(
                    backgroundColor: $primary500,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  ),       
                  onPressed: () {
                    Route route = MaterialPageRoute(builder: (context) => const OrderApp());
                    Navigator.push(context, route);
                  }, 
                  child: const Text('Add Items'))
              ],)
            ]
          ]),
        ),
      ), 
    );
  }
}
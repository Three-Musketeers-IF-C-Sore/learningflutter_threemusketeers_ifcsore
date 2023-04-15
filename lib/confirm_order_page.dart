import 'package:flutter/material.dart';
import 'package:learningflutter_threemusketeers_ifcsore/theme/colors.dart';
import 'package:learningflutter_threemusketeers_ifcsore/theme/typography.dart';

class OrderConfirm extends StatelessWidget {
  const OrderConfirm({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Order Confirmed'),
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: $primary500,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset('assets/images/Logo_Centang.png', width: 350,),
              const Text('Order successful!', style: $heading6Bold,),
              const Text('We will immediately deliver', style: $heading6Bold,),
              const Text('your order...', style: $heading6Bold,),
          ]),
        ),
      ),
      floatingActionButton: ElevatedButton(    
        style: ElevatedButton.styleFrom(
          backgroundColor: $primary500,
        ),       
        onPressed: () {
          Navigator.of(context).popUntil((route) => route.isFirst);
        }, 
        child: const Text('Back to Home Page')),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
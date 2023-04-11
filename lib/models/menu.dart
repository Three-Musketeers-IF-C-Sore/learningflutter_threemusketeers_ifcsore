import 'package:flutter/material.dart';

class Menu extends ChangeNotifier{
  final int? id;
  final String? name;
  final double? price;
  final String? kategori;

  Menu({
    required this.id, 
    required this.name, 
    required this.price,
    required this.kategori});
}
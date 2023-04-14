import 'dart:convert';
import 'package:flutter/material.dart';
import '../models/menu.dart';

class MenuProvider with ChangeNotifier {
  List<Menu> _listMenu = [];

  List<Menu> get listMenu => _listMenu;

  Future<void> getAndSetData (context) async{
    try {
      final response = await DefaultAssetBundle.of(context).loadString('assets/json/menu.json');
      final data = jsonDecode(response) as List;

      List<Menu> fetched = [];
      
      for(int i=0; i<data.length; i++) {
        fetched.add(Menu(id: data[i]['id'], name: data[i]['name'], price: data[i]['price'], kategori: data[i]['kategori']));
      }

      _listMenu = fetched;
      notifyListeners();
    } catch (err) {
      rethrow;
    }
  }
}
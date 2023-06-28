import 'package:flutter/material.dart';

class Mail extends ChangeNotifier {
  int? id;
  String? subject;
  String? recipient;
  String? body;
  bool? isChecked;
  bool? isFavorite;

  Mail({
    this.id, 
    required this.subject, 
    required this.recipient, 
    required this.body,
    required this.isChecked,
    required this.isFavorite
  });
}
import 'package:flutter/material.dart';

class Mail extends ChangeNotifier {
  int? id;
  String? subject;
  String? recipient;
  String? body;

  Mail({
    required this.id, 
    required this.subject, 
    required this.recipient, 
    required this.body,
  });
}
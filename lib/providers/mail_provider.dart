import 'package:flutter/material.dart';
import '../models/mail.dart';

class MailProvider with ChangeNotifier {
  final Map<int, Mail> _items = {};

  Map<int, Mail> get items => _items;

  void addMail(int mailId, subject, String recipient, String body, bool isChecked, bool isFavorite){
    if( _items.containsKey(mailId)) {
      _items.update(
        mailId, 
        (value) => Mail(
          id: mailId, 
          subject: value.subject,
          recipient: value.recipient,
          body: value.body,
          isChecked: value.isChecked,
          isFavorite: value.isFavorite,
        )
      );
    } else {
      var g = DateTime.now().second.toInt();
      _items.putIfAbsent(
        g, 
        () => Mail(
          id: g, 
          subject: subject,
          recipient: recipient,
          body: body,
          isChecked: isChecked,
          isFavorite: isFavorite,
        )
      );
    }
    notifyListeners();
  }
}
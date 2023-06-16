import 'package:flutter/material.dart';
import '../models/mail.dart';

class MailProvider with ChangeNotifier {
  final Map<int, Mail> _items = {};

  Map<int, Mail> get items => _items;

  void addMail(int mailId, String subject, String recipient, String body) {
    if( _items.containsKey(mailId)) {
      _items.update(
        mailId, 
        (value) => Mail(
          id: value.id, 
          subject: value.subject,
          recipient: value.recipient,
          body: value.body,
        )
      );
    } else {
      _items.putIfAbsent(
        mailId, 
        () => Mail(
          id: DateTime.now().second.toInt(), 
          subject: subject,
          recipient: recipient,
          body: body,
        )
      );
    }
    notifyListeners();
  }
}
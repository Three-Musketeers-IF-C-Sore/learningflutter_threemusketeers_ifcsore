import 'package:flutter/material.dart';

void navigate(BuildContext context, page) {
  Route route = MaterialPageRoute(
    builder: (context) => page,
  );
  Navigator.push(context, route);
}
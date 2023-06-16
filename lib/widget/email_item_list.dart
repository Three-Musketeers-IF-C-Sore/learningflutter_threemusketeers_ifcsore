import 'package:flutter/material.dart';
import 'package:learningflutter_threemusketeers_ifcsore/models/mail.dart';
import 'package:learningflutter_threemusketeers_ifcsore/theme/colors.dart';
import 'package:provider/provider.dart';

class EmailItemList extends StatefulWidget {
  const EmailItemList({super.key});

  @override
  State<EmailItemList> createState() => _EmailItemListState();
}

class _EmailItemListState extends State<EmailItemList> {

  bool? isLiked;
  bool? isChecked;
  Widget? likeIcon;

  @override
  void initState() {
    isLiked = false;
    isChecked = false;
    likeIcon = Icon(Icons.star_outline);

    super.initState();
  }

  void _onIsCheckedChanged(bool ?newValue) => setState(() {
    isChecked = newValue;
  });

  void _onIsLikedChanged() => setState(() {
    isLiked = !isLiked!;

    if (isLiked!) {
      likeIcon = Icon(Icons.star);
    } else {
      likeIcon = Icon(Icons.star_outline);
    }
  });

  @override
  Widget build(BuildContext context) {
    final mailData = Provider.of<Mail>(context);

    return Container(
      color: $primary500,
      margin: const EdgeInsets.only(bottom: 5),
      
      child: Padding(
        
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Checkbox(
              value: isChecked,
              onChanged: _onIsCheckedChanged
            ),
            IconButton(
              onPressed: _onIsLikedChanged, 
              icon: likeIcon!,
            ),
            Text(mailData.subject!), 
            // Text(mailData.body!), 
          ]
        ),
      ),
    );
  }
}
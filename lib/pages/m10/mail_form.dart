import 'package:flutter/material.dart';

class MailForm extends StatefulWidget {
  const MailForm({super.key});

  @override
  State<MailForm> createState() => _MailFormState();
}

class _MailFormState extends State<MailForm> {

  @override
  Widget build(BuildContext context) {

    const AlertDialog(
      title: Text("Success"),
        content: Text("Save successfully"),
    );

  Future<void> dialogBuilder(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: const Text(
            'Are you sure to send this mail?',
          ),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Yes'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('No'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const TextField(
              decoration: InputDecoration(
                hintText: "Recipients",
                hintStyle: TextStyle(
                  fontSize: 14,
                )
              ),
            ),
            const TextField(
              decoration: InputDecoration(
                hintText: "Subject",
                hintStyle: TextStyle(
                  fontSize: 14,
                )
              ),
            ),
            TextFormField(
              maxLines: 8,
              decoration: const InputDecoration(
                hintText: "Body",
                hintStyle: TextStyle(
                  fontSize: 14,
                )
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: SizedBox(
        width: 100,
        height: 36,
        child: ElevatedButton(
          onPressed: () => {
            dialogBuilder(context),
          }, 
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            )
          ),
          child: const Text(
            "Send",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}

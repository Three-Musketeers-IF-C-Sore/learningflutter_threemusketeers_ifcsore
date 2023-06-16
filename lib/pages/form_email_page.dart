import 'package:flutter/material.dart';
import 'package:learningflutter_threemusketeers_ifcsore/main.dart';
import 'package:learningflutter_threemusketeers_ifcsore/pages/w9.dart';
import 'package:learningflutter_threemusketeers_ifcsore/providers/mail_provider.dart';
import 'package:learningflutter_threemusketeers_ifcsore/widget/globals.dart';
import 'package:provider/provider.dart';

class FormEmail extends StatefulWidget {
  const FormEmail({super.key});

  @override
  State<FormEmail> createState() => _FormEmailState();
}

class _FormEmailState extends State<FormEmail> {
  TextEditingController recipient = TextEditingController();
  TextEditingController subject = TextEditingController();
  TextEditingController body = TextEditingController();

  List errorMessage = [];

  bool isError = false;

  @override
  Widget build(BuildContext context) {
    final mail = Provider.of<MailProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Create Email"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          child: Column(
            children: [
              TextField(
                controller: recipient,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  hintText: "Recipients",
                ),
              ),
              TextField(
                controller: subject,
                decoration: const InputDecoration(
                  hintText: "Subject",
                ),
              ),
              TextField(
                controller: body,
                keyboardType: TextInputType.multiline,
                maxLines: 10,
                decoration: const InputDecoration(
                  enabledBorder: InputBorder.none,
                  hintText: "Body",
                  focusedBorder: InputBorder.none
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: ElevatedButton(     
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30)
          )
        ),      
        onPressed: () {
          ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
          setState(() {
            errorMessage = [];
            isError = false;
          });
          if(recipient.text.isEmpty) {
            setState(() {
              errorMessage.add("Email is required");
              isError = true;
            });
          }
          if(subject.text.isEmpty) {
            setState(() {
              errorMessage.add("Subject is required");
              isError = true;
            });
          }
          if(body.text.isEmpty) {
            setState(() {
              errorMessage.add("Body is required");
              isError = true;
            });
          }
          if(isError) {
            ScaffoldMessenger.of(context).showMaterialBanner(
              MaterialBanner(
                content: ListView.separated(
                  shrinkWrap: true,
                  itemCount: errorMessage.length,
                  separatorBuilder: (context, index) {
                    return const Padding(padding: EdgeInsets.only(bottom: 5));
                  },
                  itemBuilder: (context, index) {
                    return ListTile(
                      visualDensity: const VisualDensity(horizontal: 0, vertical: -4),
                      title: Text(errorMessage[index]),
                      textColor: Colors.red,
                      leading: const Icon(Icons.warning_amber, color: Colors.red,),
                    );
                  }
                ), 
                backgroundColor: const Color.fromARGB(245, 245, 245, 245),
                actions: [
                  TextButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
                    }, 
                    child: const Text('Close'),
                  ),
                ])
            );
          } else {
            showDialog(
              context: context, 
              builder:(context) {
                return AlertDialog(
                  content: const Text("Are you sure to send this mail?"),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      }, 
                      child: const Text('No', style: TextStyle(color: Colors.black),),
                    ),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          mail.addMail(6, subject.text, recipient.text, body.text);
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                            content: Text("Added to cart successfully"),
                            duration: Duration(milliseconds: 500),
                          ));
                        });
                        Navigator.pop(context);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: const Text('Mail send!'),
                            action: SnackBarAction(
                              label: 'Ok', 
                              onPressed: () {
                                Route route = MaterialPageRoute(builder: (context) => const Email());
                                navigatorKey.currentState?.push(route);
                              }
                            ),
                          )
                        );
                      }, 
                      child: const Text('Yes', style: TextStyle(color: Colors.black)),
                    ),
                  ],
                );
              },
            );
          }
        }, 
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Text('Send')
        )
      ),
    );
  }
}
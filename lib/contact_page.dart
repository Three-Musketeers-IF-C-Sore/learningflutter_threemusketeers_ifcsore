import 'package:flutter/material.dart';
import 'package:learningflutter_threemusketeers_ifcsore/pages/form_contact_page.dart';
import 'package:learningflutter_threemusketeers_ifcsore/service/navigate.dart';
import 'package:circular_profile_avatar/circular_profile_avatar.dart';


class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  late TabController _controller;

  @override
  void initState() {
    super.initState();
  }
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  List errorMessage = [];

  bool isError = false;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("Contact Page"),
        centerTitle: true,
        actions: [
          PopupMenuButton(
            icon: const Icon(
              Icons.more_vert,
              color: Colors.white,
            ),
            itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem(
                  value: "add",
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    child: Row(children: const [
                      Icon(
                        Icons.person_add_alt_1,
                        color: Colors.black,
                      ),
                      Padding(padding: EdgeInsets.only(left: 10)),
                      Text('New Contact'),
                    ]),
                  ),
                )
              ];
            },
            onSelected: (value) {
              if (value == "add") {
                navigate(context, const FormContact());
              }
            },
          )
        ],
      ),
      body: ListView.separated(
        itemCount: 3,
        separatorBuilder: (context, index) {
          return const Divider();
        },
        itemBuilder: (context, index) {
          return Column(
              children: [
                ListTile(
                  leading: IconButton(
                    onPressed: () => {},
                    icon: CircularProfileAvatar(
                      "",
                      backgroundColor: const Color.fromRGBO(217, 217, 217, 1),
                      radius: 50,
                      child: const Icon(Icons.person),
                    ),
                  ),
                  title: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Name Name',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        '+6286435427552',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  trailing: IconButton(
                    onPressed: () {}, 
                    icon: const Icon(Icons.phone),
                  ),
                )
              ],
            );
        },
      )
    );
  }
}
import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:learningflutter_threemusketeers_ifcsore/providers/mail_provider.dart';
import 'package:learningflutter_threemusketeers_ifcsore/theme/colors.dart';
import 'package:provider/provider.dart';

class Email extends StatefulWidget {
  const Email({super.key});

  @override
  State<Email> createState() => _EmailState();
}

class _EmailState extends State<Email> with TickerProviderStateMixin, ChangeNotifier {
  late TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 3, vsync: this); 

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final mail = Provider.of<MailProvider>(context, listen: false);
      mail.items.forEach((key, value) {
        // value.isChecked = false;
      });
    });
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
    final mail = Provider.of<MailProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Email"),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            showModalBottomSheet(
              context: context,
              builder: (BuildContext bc){
                return Wrap(
                  children: <Widget>[
                    ListTile(
                      leading: const Icon(Icons.person),
                      title: const Text('User123'),
                      onTap: () => {}          
                    ),
                    ListTile(
                      leading: const Icon(Icons.person),
                      title: const Text('Bot924'),
                      onTap: () => {},          
                    ),
                    ListTile(
                      leading: const Icon(Icons.person),
                      title: const Text('Ros019'),
                      onTap: () => {},          
                    ),
                  ],
                );
              }
            );
          },
          icon: CircularProfileAvatar(
            "",
            backgroundColor: const Color.fromRGBO(79, 55, 139, 1),
            radius: 50,
          ),
        ),
        bottom: TabBar(
          controller: _controller,
          isScrollable: true,
          tabs: const <Tab>[
            Tab(
              icon: Icon(Icons.inbox),
              child: Text('Primary'),
            ),
            Tab(
              icon: Icon(Icons.label_important_outline),
              child: Text('Promotion'),
            ),
            Tab(
              icon: Icon(Icons.people_alt_outlined),
              child: Text('Social'),
            ),
          ],
        ),
      ),
      endDrawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Compose'),
            ),
            ListTile(
              leading: const Icon(
                Icons.move_to_inbox_outlined,
              ),
              title: const Text('All Inboxes'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.archive_outlined,
              ),
              title: const Text('Archived'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.send_outlined,
              ),
              title: const Text('Sent'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              if(mail.items.values.toList().isNotEmpty) ...[

                const Padding(padding: EdgeInsets.only(bottom: 5)),
                ListView.separated(
                separatorBuilder: (context, index) {
                  return const Padding(padding: EdgeInsets.all(3));
                },
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                // padding: const EdgeInsets.only(bottom: 3),
                itemCount: mail.items.length,
                itemBuilder:(context, index) {
                  return Container(
                    color: $primary500,
                    margin: const EdgeInsets.only(bottom: 5),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                      child: Row(
                        children: [
                          Checkbox(
                            value: false,
                            onChanged: (a) => {}
                          ),
                          IconButton(
                            onPressed: () => {}, 
                            icon: const Icon(Icons.star_outline),
                          ),
                          Text(mail.items.values.toList()[index].subject!), 
                          // Text(mailData.body!), 
                        ]
                      ),
                    ),
                  );
                }
              ),
            ] else ...[
              Column(children: [
                Container(
                  color: $primary500,
                  width: 500,
                  padding: const EdgeInsets.all(10),
                  child: const Text('No item in your mail!', style: TextStyle(color: Colors.white),),
                ),
                const Padding(padding: EdgeInsets.only(top: 10)),
              ],)
            ]
          ]),
        ),
      ), 
    );
  }
}
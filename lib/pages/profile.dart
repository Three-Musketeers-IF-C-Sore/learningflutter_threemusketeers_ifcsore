import 'package:flutter/material.dart';
import 'package:indexed/indexed.dart';
import 'package:learningflutter_threemusketeers_ifcsore/theme/typography.dart';
import '../theme/colors.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  bool _isEditing = false;
  String _textName = "Name, Age";
  String _textAbout =
      "I am an experienced lawyer dedicated to advocating for my clients. With 3 years of practice, I handle cases in heritages. My approach is professional, ethical, and empathetic. I believe in open communication, keeping my clients informed, and protecting their rights and interests. I am actively involved in my community and stay updated with the latest legal developments. Contact me for a confidential consultation to discuss your legal needs."; // Initial text value

// Widget for the pencil icon and text
  Widget nameEditText() {
    return Padding(
        padding: const EdgeInsets.only(left: 50),
        child: SizedBox(
          width: 250,
          child: Row(
            children: [
              Expanded(
                child: _isEditing
                    ? TextFormField(
                        textAlignVertical: TextAlignVertical.center,
                        initialValue: _textName,
                        onFieldSubmitted: (value) {
                          setState(() {
                            _textName =
                                value; // Update _textName with the edited value
                            _isEditing =
                                false; // Set _isEditing to false after editing is complete
                          });
                        },
                      )
                    : Text(
                        _textName,
                        textAlign: TextAlign.center,
                        style: $heading3Bold,
                      ), // Display text if not editing
              ),
              IconButton(
                icon: const Icon(Icons.edit),
                onPressed: () {
                  setState(() {
                    _isEditing = true; // Set _isEditing to true on button press
                  });
                },
              ),
            ],
          ),
        ));
  }

  Widget aboutEditText() {
    double screenWidth = MediaQuery.of(context).size.width;
    return Padding(
        padding: const EdgeInsets.all(40),
        child: SizedBox(
            width: 250,
            child: Column(
              children: [
                Row(
                  children: [
                    const Text(
                      'About',
                      style: $heading5Bold,
                    ),
                    IconButton(
                      icon: const Icon(Icons.edit),
                      onPressed: () {
                        setState(() {
                          _isEditing =
                              true; // Set _isEditing to true on button press
                        });
                      },
                    ),
                  ],
                ),
                Row(
                  children: [
                    SizedBox(
                      width: screenWidth * 0.75,
                      child: _isEditing
                          ? TextFormField(
                              textAlign: TextAlign.justify,
                              initialValue: _textAbout,
                              onFieldSubmitted: (value) {
                                setState(() {
                                  _textAbout = value;
                                  _isEditing = false;
                                });
                              },
                            )
                          : Text(
                              _textAbout,
                              textAlign: TextAlign.justify,
                              style: $caption2Light,
                            ),
                    ),
                  ],
                ),
              ],
            )));
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: $white,
        body: SingleChildScrollView(
          child: Column(children: [
            Indexer(
              children: [
                Indexed(
                  index: 0,
                  child: Center(
                    child: SizedBox(
                      width: screenWidth * 1,
                      height: 355,
                      child: const ColoredBox(
                          color: Color.fromRGBO(67, 55, 55, 100)),
                    ),
                  ),
                ),
                const Indexed(
                    index: 5,
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.only(top: 283),
                        child: ClipOval(
                            child: SizedBox(
                          width: 144,
                          height: 144,
                          child: ColoredBox(
                              color: Color.fromRGBO(217, 217, 217, 1)),
                        )),
                      ),
                    )),
                Indexed(
                    index: 0,
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 432),
                        child: nameEditText(),
                      ),
                    )),
                Indexed(
                  index: 0,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 470),
                    child: aboutEditText(),
                  ),
                )
              ],
            )
          ]),
        ));
  }
}

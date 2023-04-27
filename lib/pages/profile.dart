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
  String _textName = "Peter, 25";
  String _textAbout =
      "I am an experienced lawyer dedicated to advocating for my clients. With 3 years of practice, I handle cases in heritages. My approach is professional, ethical, and empathetic. I believe in open communication, keeping my clients informed, and protecting their rights and interests. I am actively involved in my community and stay updated with the latest legal developments. Contact me for a confidential consultation to discuss your legal needs."; // Initial text value

  final TextEditingController _aboutController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  void initState() {
    super.initState();
    _nameController.text = _textName;
    _aboutController.text = _textAbout;
  }

  Widget nameEditText() {
    return Padding(
        padding: const EdgeInsets.only(left: 0),
        child: SizedBox(
          width: 150,
          child: Row(
            children: [
              Expanded(
                child: _isEditing
                    ? TextFormField(
                        textAlign: TextAlign.center,
                        controller: _nameController,
                        onFieldSubmitted: (value) {
                          setState(() {
                            _textName = value;
                            _isEditing = false;
                          });
                        },
                      )
                    : Center(
                        child: Text(
                        _textName,
                        textAlign: TextAlign.justify,
                        style: $heading3Regular,
                      )),
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
            width: screenWidth * 1,
            child: Column(
              children: [
                Row(
                  children: [
                    const Text(
                      'About',
                      style: $heading5Regular,
                    ),
                  ],
                ),
                Row(
                  children: [
                    SizedBox(
                      width: screenWidth * 0.8,
                      child: _isEditing
                          ? TextFormField(
                              textAlign: TextAlign.justify,
                              controller: _aboutController,
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
                    height: 335,
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
                        child:
                            ColoredBox(color: Color.fromRGBO(217, 217, 217, 1)),
                      )),
                    ),
                  )),
              Indexed(
                  index: 0,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 420),
                      child: nameEditText(),
                    ),
                  )),
              Indexed(
                index: 0,
                child: Padding(
                  padding: const EdgeInsets.only(top: 430),
                  child: aboutEditText(),
                ),
              )
            ],
          ),
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromRGBO(91, 80, 216, 0.8),
        onPressed: () {
          setState(() {
            if (_isEditing) {
              _textAbout = _aboutController.text;
              _textName = _nameController.text; // Save the new value
              _isEditing = false; // Disable editing mode
            } else {
              _isEditing = true; // Enable editing mode
            }
          });
        },
        child: _isEditing ? const Icon(Icons.check) : const Icon(Icons.edit),
      ),
    );
  }
}

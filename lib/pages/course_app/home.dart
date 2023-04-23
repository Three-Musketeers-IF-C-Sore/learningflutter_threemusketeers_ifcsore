import 'package:flutter/material.dart';
import 'package:learningflutter_threemusketeers_ifcsore/theme/typography.dart';

class CourseAppHome extends StatefulWidget {
  const CourseAppHome({super.key});

  @override
  State<CourseAppHome> createState() => _CourseAppHomeState();
}

class _CourseAppHomeState extends State<CourseAppHome> {

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 24),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 24.0),
            child: Column(
              children: [
                const Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Popular Courses",
                    style: $heading5Bold,
                    textAlign: TextAlign.left,
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.only(top: 8),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: SizedBox(
                            width: 176,
                            child: Column(
                              children: [
                                SizedBox(
                                  width: 176,
                                  // height: 88,
                                  child: Image.asset("assets/images/intro.jpeg"),
                                ),
                                Align(
                                  child: Text(
                                    "Data Structure and Algorithm",
                                    style: $body2Regular,
                                  ),
                                  alignment: Alignment.topLeft,
                                ),
                                Align(
                                  child: Text(
                                    "University of Waterloo",
                                    style: $caption1Regular,
                                  ),
                                  alignment: Alignment.topLeft,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: SizedBox(
                            width: 176,
                            child: Column(
                              children: [
                                SizedBox(
                                  width: 176,
                                  // height: 88,
                                  child: Image.asset("assets/images/intro.jpeg"),
                                ),
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    "Data Structure and Algorithm",
                                    style: $body2Regular,
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    "University of Waterloo",
                                    style: $caption1Regular,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

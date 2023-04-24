import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:learningflutter_threemusketeers_ifcsore/pages/course_app/card.dart';
import 'package:learningflutter_threemusketeers_ifcsore/theme/typography.dart';

class CourseAppHome extends StatefulWidget {
  const CourseAppHome({super.key});

  @override
  State<CourseAppHome> createState() => _CourseAppHomeState();
}

class _CourseAppHomeState extends State<CourseAppHome> {
   List popularCourses = [];
   List forYouCourses = [];
   List lastStudiedCourses = [];
   bool loaded = false;

  Future<void> readJson() async {
    final String response = await rootBundle.loadString('assets/json/home.json');
    final data = await json.decode(response);
    setState(() {
      popularCourses = data["popular_courses"];
      forYouCourses = data["for_you_courses"];
      lastStudiedCourses = data["last_studied_courses"];
      loaded = true;
    });
  }


  @override
  Widget build(BuildContext context) {
    readJson();

    return SingleChildScrollView(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 24),
      child: Column(
        children: [
          Image.asset("assets/images/intro.jpeg"),
          Padding(
            padding: const EdgeInsets.only(top: 24.0),
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
                        if (loaded) 
                          for (var item in popularCourses)
                            CourseCard(courseTitle: item["name"], courseImage: item["image"], courseDesc: item["desc"])
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 24.0),
            child: Column(
              children: [
                const Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "For You",
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
                        if (loaded) 
                          for (var item in forYouCourses)
                            CourseCard(courseTitle: item["name"], courseImage: item["image"], courseDesc: item["desc"])
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 24.0),
            child: Column(
              children: [
                const Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Last Studied",
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
                        if (loaded) 
                          for (var item in lastStudiedCourses)
                            CourseCard(courseTitle: item["name"], courseImage: item["image"], courseDesc: item["desc"])
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

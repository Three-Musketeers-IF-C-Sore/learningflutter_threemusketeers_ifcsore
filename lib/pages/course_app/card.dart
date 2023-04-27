import 'package:flutter/material.dart';
import 'package:learningflutter_threemusketeers_ifcsore/theme/typography.dart';

class CourseCard extends StatefulWidget {
  const CourseCard({super.key,
      required this.courseTitle,
      required this.courseImage,
      required this.courseDesc});
    
    final String courseTitle;
    final String courseImage;
    final String courseDesc;

  @override
  State<CourseCard> createState() => _CourseCardState();
}

class _CourseCardState extends State<CourseCard> {


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: SizedBox(
        width: 176,
        child: Column(
          children: [
            SizedBox(
              width: 176,
              // height: 88,
              child: Image.asset("assets/images/" + widget.courseImage),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                style: $body2Regular,
                widget.courseTitle,
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                widget.courseDesc,
                style: $caption1Regular,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
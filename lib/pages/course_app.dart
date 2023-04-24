import 'package:flutter/material.dart';
import 'package:learningflutter_threemusketeers_ifcsore/pages/course_app/home.dart';
import 'package:learningflutter_threemusketeers_ifcsore/pages/discover_page.dart';
import 'package:learningflutter_threemusketeers_ifcsore/theme/colors.dart';
import 'package:learningflutter_threemusketeers_ifcsore/theme/typography.dart';
import 'package:learningflutter_threemusketeers_ifcsore/widgets/main/appbar.dart';

class CourseApp extends StatefulWidget {
  const CourseApp({super.key});

  @override
  State<CourseApp> createState() => _CourseAppState();
}

class _CourseAppState extends State<CourseApp> {

  int _currentIndex = 0;

  final tabs = [
    const CourseAppHome(),
    const DiscoverPage(),
    Center(child: Text('c'),),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const MainAppBar(title: "W7"),
      body: tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: $black,
        unselectedLabelStyle: $body2Regular,
        selectedLabelStyle: $body2Bold,
        unselectedIconTheme: const IconThemeData(
          color: $black
        ),
        selectedIconTheme: const IconThemeData(
          color: $black,
        ),
        showUnselectedLabels: true,
        fixedColor: $black,
        backgroundColor: $white,
        currentIndex: _currentIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ), 
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Discover',
          ), 
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
            backgroundColor: $primary500
          ), 
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}

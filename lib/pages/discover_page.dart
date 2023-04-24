import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DiscoverPage extends StatefulWidget {
  const DiscoverPage({super.key});

  @override
  State<DiscoverPage> createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage> {
  List allcourses = [];
  List courses = [];
  List related = [];
  List recommend = [];
  String key = "";

  Future<void> readJson() async {
    final String response = await rootBundle.loadString("assets/json/course.json");
    final data = json.decode(response) as List;
    setState(() {
      allcourses = data;
      courses = allcourses;
      List tempShuffle = allcourses.toList()..shuffle(Random());
      related = tempShuffle.sublist(0,2);
      List shuffled = allcourses.toList()..shuffle(Random());
      recommend = shuffled.sublist(0,4);
    });
  }

  @override
  void initState() {
    super.initState();
    readJson();
  }

  void updateDataByKeyword(String keyword) {
    setState(() {
      courses = allcourses.where((element) => element["title"].toLowerCase().contains(keyword.toLowerCase()) || element["university"].toLowerCase().contains(keyword.toLowerCase()) || element["instructor"].toLowerCase().contains(keyword.toLowerCase())).toList();
      key = keyword;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Discover"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                onChanged: (keyword) {
                  updateDataByKeyword(keyword);
                },
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: Colors.grey,
                  border: OutlineInputBorder(),
                  hintText: "Search courses, university, instructor",
                  prefixIcon: Icon(Icons.search, size: 30,),
                ),
              ),
              const Padding(padding: EdgeInsets.only(bottom: 10)),
              if(key == '') ...[
                const Text(
                  'Recommended Courses',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const Padding(padding: EdgeInsets.only(bottom: 10)),
                ListView.separated(
                  shrinkWrap: true,
                  itemCount: recommend.length,
                  separatorBuilder: (context, index) {
                    return const Padding(padding: EdgeInsets.only(top: 10));
                  },
                  itemBuilder: (context, index) {
                    return Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset('assets/images/${recommend[index]["image"]}', width: 100,),
                        const Padding(padding: EdgeInsets.only(left: 10)),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: currentWidth*0.5,
                              child: FittedBox(child: Text(recommend[index]["title"], style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),))
                            ),
                            Text(recommend[index]["university"], style: const TextStyle(color: Colors.grey, fontSize: 15, fontWeight: FontWeight.w400),),
                            Text(recommend[index]["instructor"], style: const TextStyle(color: Colors.grey, fontSize: 15, fontWeight: FontWeight.w400),),
                            Row(children: [
                              if((recommend[index]["rating"]).round() == recommend[index]["rating"])...[
                                for(int i=0; i<recommend[index]["rating"]; i++) ...[
                                  const Icon(Icons.star_rate_rounded, color: Colors.yellow,)
                                ],
                                for(int i=0; i<5-recommend[index]["rating"]; i++) ...[
                                  const Icon(Icons.star_outline_rounded, color: Colors.yellow,)
                                ],
                              ] else if((recommend[index]["rating"]).round() > (recommend[index]["rating"])) ... [
                                for(int i=0; i<(recommend[index]["rating"]).floor(); i++) ...[
                                  const Icon(Icons.star_rate_rounded, color: Colors.yellow,)
                                ],
                                const Icon(Icons.star_half_rounded, color: Colors.yellow,),
                                for(int i=0; i<5-(recommend[index]["rating"]).round(); i++) ...[
                                  const Icon(Icons.star_outline_rounded, color: Colors.yellow,)
                                ],
                              ] else if((recommend[index]["rating"]).round() < (recommend[index]["rating"]))...[
                                for(int i=0; i<(recommend[index]["rating"]).floor(); i++) ...[
                                  const Icon(Icons.star_rate_rounded, color: Colors.yellow,)
                                ],
                                for(int i=0; i<5-(recommend[index]["rating"]).floor(); i++) ...[
                                  const Icon(Icons.star_outline_rounded, color: Colors.yellow,)
                                ],
                              ],                  
                              Text("(${recommend[index]['rating']})"),
                            ],),
                          ],
                        )
                      ],
                    );
                  },
                )
              ] else if(courses.isNotEmpty) ...[
                Text(
                  "Search Results for '$key'",
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const Padding(padding: EdgeInsets.only(bottom: 10)),
                ListView.separated(
                  shrinkWrap: true,
                  itemCount: courses.length,
                  separatorBuilder: (context, index) {
                    return const Padding(padding: EdgeInsets.only(top: 10));
                  },
                  itemBuilder: (context, index) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset('assets/images/${courses[index]["image"]}', width: 100,),
                        const Padding(padding: EdgeInsets.only(left: 10)),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: currentWidth*0.5,
                              child: FittedBox(child: Text(courses[index]["title"], style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),)
                            ),  
                            Text(courses[index]["university"], style: const TextStyle(color: Colors.grey, fontSize: 15, fontWeight: FontWeight.w400),),
                            Text(courses[index]["instructor"], style: const TextStyle(color: Colors.grey, fontSize: 15, fontWeight: FontWeight.w400),),
                          ],
                        )
                      ],
                    );
                  },
                )
              ] else if (courses.isEmpty) ... [
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("No Result for '$key'", style: const TextStyle(fontSize: 18)),
                      const Padding(padding: EdgeInsets.only(bottom: 5)),
                      Image.asset('assets/images/undraw_Empty.png'),
                      const Padding(padding: EdgeInsets.only(bottom: 75)),
                    ],
                  ),
                ),
              ],

              if(key != '') ...[
                const Padding(padding: EdgeInsets.only(top: 25)),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                    'Related Courses',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const Padding(padding: EdgeInsets.only(top: 10)),
                    ListView.separated(
                      shrinkWrap: true,
                      itemCount: related.length,
                      separatorBuilder: (context, index) {
                        return const Padding(padding: EdgeInsets.only(top: 10));
                      },
                      itemBuilder: (context, index) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset('assets/images/${related[index]["image"]}', width: 100,),
                            const Padding(padding: EdgeInsets.only(left: 10)),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: currentWidth*0.5,
                                  child: FittedBox(child: Text(related[index]["title"], style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),)
                                ), 
                                Text(related[index]["university"], style: const TextStyle(color: Colors.grey, fontSize: 15, fontWeight: FontWeight.w400),),
                                Text(related[index]["instructor"], style: const TextStyle(color: Colors.grey, fontSize: 15, fontWeight: FontWeight.w400),),
                              ],
                            )
                          ],
                        );
                      },
                    )
                ],),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
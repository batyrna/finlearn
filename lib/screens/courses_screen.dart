import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:tradenewsapp/screens/courses_view_screen.dart';
import 'package:tradenewsapp/utils/globals.dart';
import 'package:http/http.dart' as http;

class CoursesScreen extends StatefulWidget {
  const CoursesScreen({Key? key}) : super(key: key);

  @override
  State<CoursesScreen> createState() => _CoursesScreenState();
}

class _CoursesScreenState extends State<CoursesScreen>
    with AutomaticKeepAliveClientMixin<CoursesScreen> {
  bool isLoading = true;
  @override
  void initState() {
    super.initState();
    Global.courses.clear(); //
    Timer.run(() async {
      final response = await http.get(Uri.parse(
          "https://www.googleapis.com/youtube/v3/playlistItems?part=snippet&maxResults=50&playlistId=PLT6_Bt_TKitIUCEsI-3SGCrVHCy0g_5jd&key=AIzaSyBrDiyo1e-l9yqhIOr48ZFn4nIdEzy5jh8"));
      dynamic data = jsonDecode(utf8.decode(response.bodyBytes));
      int i = 1;
      for (dynamic item in data["items"]) {
        Global.courses.add({
          "unit": "Video #" + i.toString(),
          "course": item["snippet"]["title"],
          "details_top": item["snippet"]["description"]
              .toString()
              .split("👇 SUBSCRIBE TO RAYNER'S")
              .first
              .split("SUBSCRIBE TO RAYNER'S")
              .first,
          "image": item["snippet"]["thumbnails"]["maxres"]["url"],
          "video": item["snippet"]["resourceId"]["videoId"],
          "details_bottom": item["snippet"]["description"]
              .toString()
              .split("👇 SUBSCRIBE TO RAYNER'S")
              .first
              .split("SUBSCRIBE TO RAYNER'S")
              .first,
        });
        i++;
      }
      isLoading = false;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        shadowColor: Colors.white,
        foregroundColor: const Color(0xFFC4C4C4),
        elevation: 1,
        title: const Text(
          "COURSES",
          style: TextStyle(color: Color(0xFFC4C4C4), fontSize: 25),
        ),
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListView.builder(
                      itemCount: Global.courses.length,
                      itemBuilder: (lvContext, index) {
                        return Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Container(
                            clipBehavior: Clip.hardEdge,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => CourseViewScreen(
                                      courseIndex: index,
                                    ),
                                  ),
                                );
                              },
                              child: Ink(
                                decoration: BoxDecoration(
                                  gradient: const LinearGradient(
                                    colors: [
                                      Color(0xFF212121),
                                      Color(0xFF5A5A5A),
                                    ],
                                    begin: Alignment.bottomLeft,
                                    end: Alignment.topRight,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Row(
                                  // crossAxisAlignment:
                                  //     CrossAxisAlignment.stretch,
                                  children: [
                                    Expanded(
                                      flex: 5,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const SizedBox(
                                              height: 20,
                                            ),
                                            Text(
                                              Global.courses[index]["unit"]!,
                                              softWrap: true,
                                              style: const TextStyle(
                                                color: Color(0xFFC4C4C4),
                                                fontSize: 10,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              Global.courses[index]["course"]!,
                                              softWrap: true,
                                              maxLines: 2,
                                              style: const TextStyle(
                                                color: Color(0xFFC4C4C4),
                                                fontSize: 16,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 20,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Opacity(
                                      opacity: 0,
                                      child: Container(
                                        width: 1,
                                        clipBehavior: Clip.antiAlias,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: Hero(
                                          tag: "CourseImage$index",
                                          child: Image.network(
                                            Global.courses[index]["image"]!,
                                          ),
                                        ),
                                      ),
                                    ),
                                    const Expanded(
                                      flex: 1,
                                      child: CircleAvatar(
                                          backgroundColor: Colors.black,
                                          radius: 13,
                                          child: Icon(
                                            Icons.arrow_right,
                                            color: Color(0xFFC4C4C4),
                                          )),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

// for (int i = 0; i < 30; i++) {
//   Global.courses.add({
//     "unit": "Urok 1",
//     "course": "What is Trading?",
//     "details_top":
//         "<p>To put it simply, trading is the buying and selling of financial assets. However, actually trading yourself isn’t quite as straightforward. </p></p>There’s a lot to learn and we want to make things as simple as possible for you. That’s why we’ve created guides covering the most important things to know as a new trader. Don’t worry, you’ll find no overcomplicated jargon here. Just easy-to-understand explanations you’ll get your head around in no time.</p><p>Before you get started, you need to be aware of the different ways you can trade, the markets, and the various terms and concepts you’ll come across as you start your trading journey.</p>",
//     "image": "assets/economictrade.png",
//     "details_bottom": "Learn about the different ways you can trade",
//   });
// }
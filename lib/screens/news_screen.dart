import 'dart:async';
import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:tradenewsapp/screens/news_view_screen.dart';
import 'package:tradenewsapp/utils/globals.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({Key? key}) : super(key: key);

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen>
    with AutomaticKeepAliveClientMixin<NewsScreen> {
  String generalSection =
      "https://newsapi.org/v2/top-headlines?country=us&category=general&apiKey=7746758115e44daabc9271be257b93d8";
  String businessSection =
      "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=7746758115e44daabc9271be257b93d8";
  String technologySection =
      "https://newsapi.org/v2/top-headlines?country=us&category=technology&apiKey=7746758115e44daabc9271be257b93d8";
  String scienceSection =
      "https://newsapi.org/v2/top-headlines?country=us&category=science&apiKey=7746758115e44daabc9271be257b93d8";

  String currentSection = "";

  @override
  void initState() {
    super.initState();
    currentSection = generalSection;
    Timer.run(() async {
      await loadData();
    });
  }

  Future loadData() async {
    try {
      isLoading = true;
      setState(() {});
      Global.news = await loadFromServer();
      isLoading = false;
      setState(() {});
    } catch (_) {}
  }

  bool isLoading = true;
  Future<dynamic> loadFromServer() async {
    final response = await http.get(Uri.parse(currentSection));
    if (response.statusCode == 200 && response.body.trim() != "") {
      return jsonDecode(utf8.decode(response.bodyBytes));
    } else {
      return "";
    }
  }

  ScrollController memuScroll = ScrollController();

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
          "NEWS",
          style: TextStyle(color: Color(0xFFC4C4C4), fontSize: 25),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: const EdgeInsets.all(5),
            color: const Color(0xFF000000),
            child: SingleChildScrollView(
              controller: memuScroll,
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      currentSection = businessSection;
                      loadData();
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width / 2 - 80,
                      height: 70,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: const DecorationImage(
                          image: AssetImage('assets/newsdata.jfif'),
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                      child: const Center(
                        child: Text(
                          "General",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            shadows: [
                              Shadow(
                                color: Colors.black,
                                offset: Offset(0, 0),
                                blurRadius: 12,
                              ),
                              Shadow(
                                color: Colors.black,
                                offset: Offset(0, 0),
                                blurRadius: 12,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      currentSection = businessSection;
                      loadData();
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width / 2 - 80,
                      height: 70,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: const DecorationImage(
                          image: AssetImage('assets/newsdata.jfif'),
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                      child: const Center(
                        child: Text(
                          "Business",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            shadows: [
                              Shadow(
                                color: Colors.black,
                                offset: Offset(0, 0),
                                blurRadius: 12,
                              ),
                              Shadow(
                                color: Colors.black,
                                offset: Offset(0, 0),
                                blurRadius: 12,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      currentSection = technologySection;
                      loadData();
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width / 2 - 80,
                      height: 70,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: const DecorationImage(
                          image: AssetImage('assets/dreams.jpeg'),
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                      child: const Center(
                        child: Text(
                          "Technology",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            shadows: [
                              Shadow(
                                color: Colors.black,
                                offset: Offset(0, 0),
                                blurRadius: 12,
                              ),
                              Shadow(
                                color: Colors.black,
                                offset: Offset(0, 0),
                                blurRadius: 12,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      currentSection = scienceSection;
                      loadData();
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width / 2 - 80,
                      height: 70,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: const DecorationImage(
                          image: AssetImage('assets/dreams.jpeg'),
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                      child: const Center(
                        child: Text(
                          "Science",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            shadows: [
                              Shadow(
                                color: Colors.black,
                                offset: Offset(0, 0),
                                blurRadius: 12,
                              ),
                              Shadow(
                                color: Colors.black,
                                offset: Offset(0, 0),
                                blurRadius: 12,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: isLoading
                ? const Center(child: CircularProgressIndicator())
                : Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: RefreshIndicator(
                      displacement: 10,
                      triggerMode: RefreshIndicatorTriggerMode.anywhere,
                      onRefresh: () async {
                        loadData();
                      },
                      child: ListView.builder(
                        itemCount: Global.news == ""
                            ? 0
                            : Global.news["articles"].length,
                        itemBuilder: (lvContext, index) {
                          return Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Container(
                              clipBehavior: Clip.hardEdge,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => NewViewScreen(
                                        newsIndex: index,
                                      ),
                                    ),
                                  );
                                },
                                child: Ink(
                                  decoration: BoxDecoration(
                                    color: const Color(0xFF2C2C2E),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Global.news["articles"][index]
                                                    ["urlToImage"] !=
                                                null
                                            ? Hero(
                                                tag: "NewsImage$index",
                                                child: CachedNetworkImage(
                                                  imageUrl:
                                                      Global.news["articles"]
                                                          [index]["urlToImage"],
                                                  fit: BoxFit.cover,
                                                  // height: 90,
                                                ),
                                              )
                                            : Container(),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          Global.news["articles"][index]
                                              ["title"],
                                          softWrap: true,
                                          maxLines: 2,
                                          style: const TextStyle(
                                            color: Color(0xFFC4C4C4),
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          DateFormat().add_MMMMd().format(
                                              DateTime.parse(
                                                  Global.news["articles"][index]
                                                      ["publishedAt"])),
                                          softWrap: true,
                                          style: const TextStyle(
                                            color: Color(0xFFC4C4C4),
                                            fontSize: 10,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
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

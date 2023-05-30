import 'package:flutter/material.dart';
import 'package:tradenewsapp/screens/courses_screen.dart';
import 'package:tradenewsapp/screens/dictionary_screen.dart';
import 'package:tradenewsapp/screens/news_screen.dart';
import 'package:tradenewsapp/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FinLearn',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: const SplashScreen(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        bottomNavigationBar: Container(
          clipBehavior: Clip.antiAlias,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: BottomAppBar(
            color: const Color(0xFF2C2C2E),
            child: TabBar(
              labelColor: const Color(0xffC4C4C4),
              tabs: [
                Tab(
                  text: "News",
                  icon: Image.asset(
                    "assets/newspaper-folded.png",
                    width: 30,
                    color: const Color(0xffC4C4C4),
                  ),
                ),
                Tab(
                  text: "Courses",
                  icon: Image.asset(
                    "assets/book.png",
                    width: 30,
                    color: const Color(0xffC4C4C4),
                  ),
                ),
                Tab(
                  text: "Dictionary",
                  icon: Image.asset(
                    "assets/dictionary.png",
                    width: 30,
                    color: const Color(0xffC4C4C4),
                  ),
                ),
              ],
            ),
          ),
        ),
        backgroundColor: const Color(0xFF000000),
        body: const TabBarView(children: [
          NewsScreen(),
          CoursesScreen(),
          DictionaryScreen(),
        ]),
      ),
    );
  }
}

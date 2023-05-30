import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:tradenewsapp/utils/globals.dart';

class DictionaryViewScreen extends StatefulWidget {
  const DictionaryViewScreen({Key? key, required this.newsIndex})
      : super(key: key);
  final int newsIndex;
  @override
  State<DictionaryViewScreen> createState() => _DictionaryViewScreenState();
}

class _DictionaryViewScreenState extends State<DictionaryViewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        foregroundColor: const Color(0xFFC4C4C4),
        backgroundColor: Colors.black,
        shadowColor: Colors.white,
        elevation: 1,
        title: const Text(
          "DICTIONARY",
          style: TextStyle(color: Color(0xFFC4C4C4), fontSize: 25),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(22),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  Global.dictionaryTemp[widget.newsIndex]["word"]!,
                  textAlign: TextAlign.left,
                  softWrap: true,
                  style: const TextStyle(
                    color: Color(0xFFC4C4C4),
                    fontSize: 30,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Html(
                data: Global.dictionaryTemp[widget.newsIndex]["details"],
                style: {
                  "body": Style(
                    fontSize: FontSize.larger,
                    color: const Color(0xFFC4C4C4),
                  ),
                  "ol": Style(
                    color: const Color(0xFFC4C4C4),
                    // color: Colors.red,
                  ),
                  "li": Style(
                    color: const Color(0xFFC4C4C4),
                  ),
                },
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

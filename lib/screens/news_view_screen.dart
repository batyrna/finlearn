import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:tradenewsapp/utils/globals.dart';

class NewViewScreen extends StatefulWidget {
  const NewViewScreen({Key? key, required this.newsIndex}) : super(key: key);
  final int newsIndex;
  @override
  State<NewViewScreen> createState() => _NewViewScreenState();
}

class _NewViewScreenState extends State<NewViewScreen> {
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
          "NEWS",
          style: TextStyle(color: Color(0xFFC4C4C4), fontSize: 25),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(22),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Hero(
                  tag: "NewsImage${widget.newsIndex}",
                  child: Container(
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Global.news["articles"][widget.newsIndex]
                                ["urlToImage"] !=
                            null
                        ? CachedNetworkImage(
                            imageUrl: Global.news["articles"][widget.newsIndex]
                                ["urlToImage"],
                          )
                        : Container(),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: const BoxDecoration(
                    border: Border(
                      left: BorderSide(width: 2.0, color: Color(0xFFC4C4C4)),
                    ),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    Global.news["articles"][widget.newsIndex]["title"],
                    softWrap: true,
                    style: const TextStyle(
                      color: Color(0xFFC4C4C4),
                      fontSize: 25,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              // Text(
              //   Global.news["articles"][widget.newsIndex]["description"],
              //   softWrap: true,
              //   style: const TextStyle(
              //     color: Color(0xFFC4C4C4),
              //     fontSize: 17,
              //     fontWeight: FontWeight.w400,
              //   ),
              // ),
              Html(
                data: Global.news["articles"][widget.newsIndex]["description"],
                // data: "<ul><li>First</li><li>Second</li></ul>",
                style: {
                  "body": Style(
                    fontSize: FontSize.larger,
                    color: const Color(0xFFC4C4C4),
                  ),
                  "li": Style(
                    color: const Color(0xFFC4C4C4),
                    listStyleType: ListStyleType.fromWidget(
                      const Icon(
                        Icons.circle,
                        size: 10,
                        color: Color(0xFFC4C4C4),
                      ),
                    ),
                  ),
                  "li:before": Style(
                    color: const Color(0xFFC4C4C4),
                  ),
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

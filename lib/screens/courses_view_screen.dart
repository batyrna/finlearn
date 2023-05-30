import 'package:flutter/material.dart';
import 'package:tradenewsapp/utils/globals.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class CourseViewScreen extends StatefulWidget {
  const CourseViewScreen({Key? key, required this.courseIndex})
      : super(key: key);
  final int courseIndex;
  @override
  State<CourseViewScreen> createState() => _CourseViewScreenState();
}

class _CourseViewScreenState extends State<CourseViewScreen> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: Global.courses[widget.courseIndex]["video"]!,
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
      ),
    );
  }

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
          "COURSES",
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
                  Global.courses[widget.courseIndex]["course"]!,
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
              YoutubePlayer(
                controller: _controller,
                showVideoProgressIndicator: true,
                progressIndicatorColor: Colors.amber,
                progressColors: const ProgressBarColors(
                  playedColor: Colors.amber,
                  handleColor: Colors.amberAccent,
                ),
                bottomActions: [
                  CurrentPosition(),
                  ProgressBar(isExpanded: true),
                  // TotalDuration(),
                ],
                onReady: () {
                  // _controller.addListener(listener);
                },
              ),
              const SizedBox(
                height: 20,
              ),
              // Html(
              //   data: Global.courses[widget.courseIndex]["details_top"],
              //   style: {
              //     "body": Style(
              //       fontSize: FontSize.larger,
              //       color: const Color(0xFFC4C4C4),
              //     ),
              //     "ol": Style(
              //       color: const Color(0xFFC4C4C4),
              //       // color: Colors.red,
              //     ),
              //     "li": Style(
              //       color: const Color(0xFFC4C4C4),
              //     ),
              //   },
              // ),
              // Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: Hero(
              //     tag: "NewsImage${widget.courseIndex}",
              //     child: Image.network(
              //       Global.courses[widget.courseIndex]["image"]!,
              //     ),
              //   ),
              // ),
              // const SizedBox(
              //   height: 20,
              // ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  Global.courses[widget.courseIndex]["details_bottom"]!,
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
            ],
          ),
        ),
      ),
    );
  }
}

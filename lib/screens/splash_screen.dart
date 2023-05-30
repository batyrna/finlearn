import 'package:flutter/material.dart';
import 'package:tradenewsapp/main.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 15, 15, 15),
      body: Stack(
        children: [
          Column(
            children: [
              ClipPath(
                clipper: SlantedBgClipper(),
                child: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.grey, Colors.grey],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                ),
              ),
              Expanded(
                child: Container(),
              )
            ],
          ),
          Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              Center(
                child: Container(
                  alignment: Alignment.topCenter,
                  padding: const EdgeInsets.all(80.0),
                  child: Image.asset(
                    "assets/logo.png",
                    width: 250,
                  ),
                ),
              ),
            ],
          ),
          Column(
            children: [
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const MyHomePage()));
                    },
                    style: ElevatedButton.styleFrom(
                      primary: const Color(0xffC4C4C4),
                      onPrimary: const Color(0xff161618),
                      shadowColor: const Color(0xffC4C4C4),
                      elevation: 7,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(35.0)),
                      minimumSize: const Size(80, 40), /////// HERE
                    ),
                    child: const SizedBox(
                      width: 240,
                      height: 60,
                      child: Center(
                        child: Text(
                          "START NOW",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 100,
              )
            ],
          ),
        ],
      ),
    );
  }
}

class SlantedBgClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    // path.moveTo(0, size.height / 2);
    path.lineTo(0, size.height * 0.6);
    path.quadraticBezierTo(
        size.width * 0.65, size.height * 0.35, size.width, size.height * 0.6);
    // path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}

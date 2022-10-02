import 'package:flutter/material.dart';
import 'package:freebie_nex/login_page.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  navHome() async {
    await Future.delayed(Duration(milliseconds: 1500));
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => LoginPage()),
      (Route<dynamic> route) => false,
    );
  }

  @override
  void initState() {
    navHome();
    super.initState();
  }

  final Shader linearGradient = LinearGradient(
    colors: [
      Color.fromRGBO(55, 111, 255, 1),
      Color.fromRGBO(24, 49, 206, 1),
    ],
  ).createShader(Rect.fromLTWH(0.0, 100.0, 200.0, 100.0));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(3, 3, 14, 1),
      body: Center(
        child: RichText(
          text: TextSpan(
              text: 'F',
              style: TextStyle(
                  letterSpacing: 21.5,
                  color: Colors.white,
                  fontSize: 25,
                  fontFamily: 'Anurati',
                  fontWeight: FontWeight.w500),
              children: <TextSpan>[
                TextSpan(
                    text: 'NEX',
                    style: TextStyle(
                        letterSpacing: 21.5,
                        foreground: Paint()..shader = linearGradient,
                        fontSize: 25,
                        fontFamily: 'Anurati',
                        fontWeight: FontWeight.w500))
              ]),
        ),
      ),
    );
  }
}

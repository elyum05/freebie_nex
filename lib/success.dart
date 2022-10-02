import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:freebie_nex/body.dart';

class Success extends StatefulWidget {
  Success({Key? key}) : super(key: key);

  @override
  State<Success> createState() => _SuccessState();
}

class _SuccessState extends State<Success> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
        Color.fromRGBO(33, 33, 47, 1),
        Color.fromRGBO(2, 2, 14, 1)
      ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text('Success!',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 21,
                      fontWeight: FontWeight.w500)),
            ),
            SizedBox(
              height: 52,
            ),
            Stack(
              alignment: Alignment.center,
              children: [
                Image.asset('assets/robot.png', height: 287),
                Padding(
                  padding: EdgeInsets.all(85),
                  child: Container(
                    child: Icon(CupertinoIcons.checkmark_alt,
                        size: 58, color: Colors.white),
                    alignment: Alignment.center,
                    width: 125,
                    height: 125,
                    decoration: BoxDecoration(
                        color:
                            Color.fromARGB(255, 16, 56, 255).withOpacity(0.75),
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0, 0),
                            blurRadius: 15,
                            color: Color.fromARGB(255, 16, 56, 255),
                          )
                        ],
                        borderRadius: BorderRadius.circular(150)),
                  ),
                )
              ],
            ),
            Text('You hired a robot!',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white.withOpacity(0.75),
                    fontSize: 18,
                    fontWeight: FontWeight.w500)),
            SizedBox(
              height: 45,
            ),
            InkWell(
              borderRadius: BorderRadius.circular(15),
              onTap: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => Body()),
                  (Route<dynamic> route) => false,
                );
              },
              child: Container(
                child: Text('Good!',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500)),
                padding: EdgeInsets.all(21),
                width: 185,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    Color.fromARGB(255, 35, 55, 241),
                    Color.fromARGB(255, 11, 11, 199)
                  ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(0, 1),
                        blurRadius: 12,
                        color:
                            Color.fromARGB(255, 11, 11, 199).withOpacity(0.62))
                  ],
                  border: Border.all(
                    color: Color.fromARGB(255, 52, 56, 252),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

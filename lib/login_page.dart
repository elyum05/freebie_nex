import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:freebie_nex/body.dart';
import 'package:freebie_nex/firebase_services.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final Shader linearGradient = LinearGradient(
    colors: [
      Color.fromRGBO(55, 111, 255, 1),
      Color.fromRGBO(24, 49, 206, 1),
    ],
  ).createShader(Rect.fromLTWH(0.0, 100.0, 200.0, 100.0));
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
          children: [
            Stack(
              alignment: AlignmentDirectional.topCenter,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 35, top: 58),
                      child: Text('Freebie',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 21,
                              fontWeight: FontWeight.w400)),
                    ),
                    Spacer(),
                    Image.asset('assets/back.png')
                  ],
                ),
                Positioned(
                    top: 100,
                    child: Image.asset('assets/robot.png', height: 358))
              ],
              clipBehavior: Clip.none,
            ),
            SizedBox(
              height: 310,
            ),
            RichText(
              text: TextSpan(
                  text: 'Freebie ',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 45,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500),
                  children: <TextSpan>[
                    TextSpan(
                        text: 'NEX',
                        style: TextStyle(
                            foreground: Paint()..shader = linearGradient,
                            fontSize: 45,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w700))
                  ]),
            ),
            Text('Free crypto by Freebie.',
                style: TextStyle(
                    color: Colors.white.withOpacity(0.45),
                    fontSize: 18,
                    fontWeight: FontWeight.w400)),
            Spacer(),
            Row(
              children: [
                Spacer(),
                InkWell(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(45)),
                  onTap: () async {
                    await FirebaseServices().signInWithGoogle();
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Body()));
                    var db = FirebaseFirestore.instance.collection(
                        '${FirebaseAuth.instance.currentUser!.email}');
                    db.doc('${FirebaseAuth.instance.currentUser!.uid}').set({
                      'fnex': FieldValue.increment(0),
                      'nex': FieldValue.increment(0),
                      'ricky': FieldValue.increment(0),
                      'jack': FieldValue.increment(0),
                      'petro': FieldValue.increment(0),
                      'date': FieldValue.increment(0),
                      'adDate': FieldValue.increment(0),
                    }, SetOptions(merge: true));
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 45, vertical: 25),
                    alignment: Alignment.center,
                    child: Row(
                      children: [
                        Icon(CupertinoIcons.arrow_down_circle,
                            color: Colors.white),
                        SizedBox(
                          width: 7,
                        ),
                        Text('Sign in',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w500))
                      ],
                    ),
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Color.fromRGBO(34, 92, 240, 1),
                              Color.fromRGBO(18, 22, 123, 1)
                            ]),
                        borderRadius:
                            BorderRadius.only(topLeft: Radius.circular(45))),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

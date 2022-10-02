import 'dart:math';
import 'dart:ui';

import 'package:argon_buttons_flutter/argon_buttons_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:freebie_nex/body.dart';
import 'package:url_launcher/url_launcher.dart';

class Ad extends StatefulWidget {
  Ad({Key? key}) : super(key: key);

  @override
  State<Ad> createState() => _AdState();
}

class _AdState extends State<Ad> {
  final Stream<QuerySnapshot> ad =
      FirebaseFirestore.instance.collection('ad').snapshots();

  final Stream<QuerySnapshot> user = FirebaseFirestore.instance
      .collection('${FirebaseAuth.instance.currentUser!.email}')
      .snapshots();

  Random random = Random();

  bool viewed = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
            Color.fromRGBO(28, 28, 68, 1),
            Color.fromRGBO(1, 1, 16, 1)
          ])),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Column(
              children: [
                StreamBuilder<QuerySnapshot>(
                  stream: ad,
                  builder: (context, snapshots) {
                    return (snapshots.connectionState ==
                            ConnectionState.waiting)
                        ? Center(
                            child:
                                CircularProgressIndicator(color: Colors.white))
                        : ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: snapshots.data!.docs.length,
                            itemBuilder: (context, index) {
                              var data = snapshots.data!.docs[index].data()
                                  as Map<String, dynamic>;
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 28, vertical: 25),
                                    child: Text(data['title'],
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 30,
                                            fontWeight: FontWeight.w700)),
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 25),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(30),
                                      child: BackdropFilter(
                                        filter: ImageFilter.blur(
                                            sigmaX: 7, sigmaY: 7),
                                        child: Container(
                                          width: double.infinity,
                                          padding: EdgeInsets.all(7),
                                          child: Container(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  30),
                                                          topRight:
                                                              Radius.circular(
                                                                  30)),
                                                  child: Image.network(
                                                      data['image'],
                                                      fit: BoxFit.cover),
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.all(21),
                                                  child: Text(data['desc'],
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.w500)),
                                                )
                                              ],
                                            ),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(30),
                                                color: Color.fromRGBO(
                                                    51, 54, 85, 0.35)),
                                          ),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                              gradient: LinearGradient(
                                                  begin: Alignment.topCenter,
                                                  end: Alignment.bottomCenter,
                                                  colors: [
                                                    Color.fromRGBO(
                                                        144, 151, 221, 0.35),
                                                    Color.fromRGBO(
                                                        73, 78, 118, 0)
                                                  ])),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 30, vertical: 7),
                                    child: InkWell(
                                      borderRadius: BorderRadius.circular(16),
                                      onTap: () {
                                        launch(data['link']);
                                        setState(() {
                                          viewed = true;
                                        });
                                      },
                                      child: Container(
                                        height: 71,
                                        padding: EdgeInsets.all(16),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Icon(
                                              CupertinoIcons.rocket,
                                              color: Colors.white,
                                            ),
                                            SizedBox(width: 7),
                                            Text('Go!',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 16,
                                                    fontFamily: 'Poppins',
                                                    fontWeight:
                                                        FontWeight.w500)),
                                          ],
                                        ),
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(16),
                                            gradient: LinearGradient(
                                                begin: Alignment.topCenter,
                                                end: Alignment.bottomCenter,
                                                colors: [
                                                  Color.fromRGBO(
                                                      34, 74, 215, 1),
                                                  Color.fromRGBO(18, 37, 138, 1)
                                                ]),
                                            boxShadow: [
                                              BoxShadow(
                                                  offset: Offset(0, 1),
                                                  blurRadius: 5,
                                                  color: Color.fromRGBO(
                                                      11, 33, 232, 0.45))
                                            ]),
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            });
                  },
                ),
                StreamBuilder<QuerySnapshot>(
                  stream: user,
                  builder: (context, snapshots) {
                    return (snapshots.connectionState ==
                            ConnectionState.waiting)
                        ? Center(child: Container())
                        : ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: snapshots.data!.docs.length,
                            itemBuilder: (context, index) {
                              var data = snapshots.data!.docs[index].data()
                                  as Map<String, dynamic>;
                              bool _shouldIgnore = false;
                              if (DateTime.now().day > data['adDate']) {
                                _shouldIgnore = false;
                              } else if (DateTime.now().day == data['adDate']) {
                                _shouldIgnore = true;
                              } else if (data['adDate'] == 0) {
                                _shouldIgnore = false;
                              }
                              return Padding(
                                padding: EdgeInsets.symmetric(horizontal: 30),
                                child: IgnorePointer(
                                  ignoring: _shouldIgnore,
                                  child: InkWell(
                                    borderRadius: BorderRadius.circular(16),
                                    onTap: () {
                                      if (viewed == true) {
                                        int reward = random.nextInt(10);
                                        showAnimatedDialog(
                                          context: context,
                                          barrierDismissible: false,
                                          builder: (BuildContext context) {
                                            return WillPopScope(
                                              onWillPop: () async => false,
                                              child: AlertDialog(
                                                  alignment: Alignment.center,
                                                  shape: RoundedRectangleBorder(
                                                    side: BorderSide(
                                                        color: Color.fromARGB(
                                                            255, 34, 215, 134)),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            25),
                                                  ),
                                                  titleTextStyle: TextStyle(
                                                      color: Colors.white,
                                                      fontFamily: 'Poppins',
                                                      fontSize: 21,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                  backgroundColor:
                                                      Color.fromARGB(
                                                              255, 15, 23, 20)
                                                          .withOpacity(0.95),
                                                  contentTextStyle: TextStyle(
                                                      color: Color.fromRGBO(
                                                          181, 181, 181, 1),
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                  title: Center(
                                                      child: Text(
                                                          "Congratulations!")),
                                                  content: Container(
                                                    height: 294,
                                                    child: Column(
                                                      children: [
                                                        Container(
                                                          decoration: BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          150),
                                                              boxShadow: [
                                                                BoxShadow(
                                                                    offset:
                                                                        Offset(2,
                                                                            -3),
                                                                    blurRadius:
                                                                        15,
                                                                    color: Color
                                                                        .fromARGB(
                                                                            110,
                                                                            0,
                                                                            17,
                                                                            255))
                                                              ]),
                                                          child: Image.asset(
                                                              'assets/fnex.png',
                                                              height: 80),
                                                        ),
                                                        SizedBox(
                                                          height: 25,
                                                        ),
                                                        RichText(
                                                          text: TextSpan(
                                                              text:
                                                                  '+${reward.toString()} ',
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize: 21,
                                                                  fontFamily:
                                                                      'Poppins',
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500),
                                                              children: <
                                                                  TextSpan>[
                                                                TextSpan(
                                                                    text:
                                                                        'FNEX',
                                                                    style: TextStyle(
                                                                        color: Color.fromARGB(
                                                                            255,
                                                                            34,
                                                                            215,
                                                                            134),
                                                                        fontSize:
                                                                            21,
                                                                        fontFamily:
                                                                            'Poppins',
                                                                        fontWeight:
                                                                            FontWeight.w700))
                                                              ]),
                                                        ),
                                                        SizedBox(
                                                          height: 12,
                                                        ),
                                                        Text(
                                                            'Next reward will be available in 24 hours.',
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white
                                                                    .withOpacity(
                                                                        0.58),
                                                                fontSize: 14,
                                                                fontFamily:
                                                                    'Poppins',
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500)),
                                                        Padding(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  21),
                                                          child: InkWell(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        150),
                                                            onTap: () {
                                                              Navigator.pop(
                                                                  context);
                                                              Navigator
                                                                  .pushAndRemoveUntil(
                                                                context,
                                                                MaterialPageRoute(
                                                                    builder:
                                                                        (context) =>
                                                                            Body()),
                                                                (Route<dynamic>
                                                                        route) =>
                                                                    false,
                                                              );
                                                            },
                                                            child: Container(
                                                              alignment:
                                                                  Alignment
                                                                      .center,
                                                              child: Text('OK',
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .white,
                                                                      fontSize:
                                                                          18,
                                                                      fontFamily:
                                                                          'Poppins',
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500)),
                                                              width: 62,
                                                              height: 62,
                                                              decoration:
                                                                  BoxDecoration(
                                                                      color: Color.fromARGB(
                                                                          255,
                                                                          34,
                                                                          215,
                                                                          134),
                                                                      boxShadow: [
                                                                        BoxShadow(
                                                                            offset: Offset(
                                                                                0, 0),
                                                                            blurRadius:
                                                                                15,
                                                                            color: Color.fromARGB(
                                                                                255,
                                                                                34,
                                                                                215,
                                                                                134))
                                                                      ],
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              150)),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  )),
                                            );
                                          },
                                          animationType:
                                              DialogTransitionType.scale,
                                          curve: Curves.bounceIn,
                                          duration: Duration(seconds: 1),
                                        );
                                        var db = FirebaseFirestore.instance
                                            .collection(
                                                '${FirebaseAuth.instance.currentUser!.email}');
                                        db
                                            .doc(
                                                '${FirebaseAuth.instance.currentUser!.uid}')
                                            .set({
                                          'fnex': FieldValue.increment(reward),
                                          'adDate': DateTime.now().day,
                                        }, SetOptions(merge: true));
                                      } else if (viewed == false) {
                                        showAnimatedDialog(
                                          context: context,
                                          barrierDismissible: true,
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                                alignment: Alignment.center,
                                                shape: RoundedRectangleBorder(
                                                  side: BorderSide(
                                                      color: Color.fromRGBO(
                                                          248, 75, 60, 1)),
                                                  borderRadius:
                                                      BorderRadius.circular(25),
                                                ),
                                                titleTextStyle: TextStyle(
                                                    color: Colors.white,
                                                    fontFamily: 'Poppins',
                                                    fontSize: 21,
                                                    fontWeight:
                                                        FontWeight.w500),
                                                backgroundColor: Color.fromARGB(
                                                        255, 44, 27, 27)
                                                    .withOpacity(0.95),
                                                contentTextStyle: TextStyle(
                                                    color: Color.fromRGBO(
                                                        181, 181, 181, 1),
                                                    fontSize: 18,
                                                    fontWeight:
                                                        FontWeight.w400),
                                                title: Center(
                                                    child: Text("Oops!")),
                                                content: Container(
                                                  height: 207,
                                                  child: Column(
                                                    children: [
                                                      Text(
                                                          "You can't claim the reward, because you didn't click 'Go' button. Please, click 'Go' button and try again.",
                                                          style: TextStyle(
                                                              color: Colors
                                                                  .white
                                                                  .withOpacity(
                                                                      0.62),
                                                              fontSize: 16,
                                                              fontFamily:
                                                                  'Poppins',
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400)),
                                                      SizedBox(
                                                        height: 21,
                                                      ),
                                                      InkWell(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(150),
                                                        onTap: () {
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        child: Container(
                                                          alignment:
                                                              Alignment.center,
                                                          child: Text('OK',
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize: 18,
                                                                  fontFamily:
                                                                      'Poppins',
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500)),
                                                          width: 62,
                                                          height: 62,
                                                          decoration:
                                                              BoxDecoration(
                                                                  color: Color
                                                                      .fromRGBO(
                                                                          245,
                                                                          75,
                                                                          60,
                                                                          1),
                                                                  boxShadow: [
                                                                    BoxShadow(
                                                                        offset: Offset(
                                                                            0,
                                                                            0),
                                                                        blurRadius:
                                                                            15,
                                                                        color: Color.fromRGBO(
                                                                            245,
                                                                            75,
                                                                            60,
                                                                            1))
                                                                  ],
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              150)),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ));
                                          },
                                          animationType:
                                              DialogTransitionType.scale,
                                          curve: Curves.bounceIn,
                                          duration: Duration(seconds: 1),
                                        );
                                      }
                                    },
                                    child: Container(
                                      height: 71,
                                      padding: EdgeInsets.all(16),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            CupertinoIcons.gift_alt_fill,
                                            color: Colors.black,
                                          ),
                                          SizedBox(width: 7),
                                          Text('Claim!',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 16,
                                                  fontFamily: 'Poppins',
                                                  fontWeight: FontWeight.w500)),
                                        ],
                                      ),
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(16),
                                          gradient: LinearGradient(
                                              begin: Alignment.topCenter,
                                              end: Alignment.bottomCenter,
                                              colors: [
                                                Color.fromARGB(
                                                    255, 34, 215, 134),
                                                Color.fromARGB(255, 18, 138, 82)
                                              ]),
                                          boxShadow: [
                                            BoxShadow(
                                                offset: Offset(0, 1),
                                                blurRadius: 5,
                                                color: Color.fromARGB(
                                                    113, 11, 232, 114))
                                          ]),
                                    ),
                                  ),
                                ),
                              );
                            });
                  },
                ),
                SizedBox(
                  height: 16,
                )
              ],
            ),
          )),
    );
  }
}

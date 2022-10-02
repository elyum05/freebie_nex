import 'dart:io';

import 'package:argon_buttons_flutter/argon_buttons_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:freebie_nex/firebase_services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:timer_button/timer_button.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final Stream<QuerySnapshot> user = FirebaseFirestore.instance
      .collection('${FirebaseAuth.instance.currentUser!.email}')
      .snapshots();

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
              SizedBox(
                height: 16,
              ),
              Padding(
                padding:
                    EdgeInsets.only(left: 28, right: 28, top: 45, bottom: 30),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            'Hey, ${FirebaseAuth.instance.currentUser!.displayName}.',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.w500)),
                        Text('Have a good day.',
                            style: TextStyle(
                                color: Colors.white.withOpacity(0.45),
                                fontSize: 18,
                                fontWeight: FontWeight.w400))
                      ],
                    ),
                    Spacer(),
                    InkWell(
                      borderRadius: BorderRadius.circular(150),
                      onTap: () {
                        showAnimatedDialog(
                          context: context,
                          barrierDismissible: true,
                          builder: (BuildContext context) {
                            return AlertDialog(
                                alignment: Alignment.bottomCenter,
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                      color: Color.fromRGBO(33, 92, 248, 1)),
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                backgroundColor:
                                    Color.fromARGB(255, 15, 15, 23),
                                titleTextStyle: TextStyle(
                                    color: Colors.white,
                                    fontSize: 21,
                                    fontWeight: FontWeight.w700),
                                contentTextStyle: TextStyle(
                                    color: Color.fromRGBO(181, 181, 181, 1),
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400),
                                title: Row(
                                  children: [
                                    Container(
                                      width: 52,
                                      height: 52,
                                      child: CircleAvatar(
                                        radius: 21,
                                        backgroundImage: NetworkImage(
                                            '${FirebaseAuth.instance.currentUser!.photoURL}'),
                                      ),
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          color: Color.fromRGBO(3, 3, 3, 0.62),
                                          borderRadius:
                                              BorderRadius.circular(150),
                                          border: Border.all(
                                              color: Color.fromRGBO(
                                                  35, 35, 35, 1))),
                                    ),
                                    SizedBox(
                                      width: 12,
                                    ),
                                    Text(
                                        '${FirebaseAuth.instance.currentUser!.displayName}',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: 'Poppins',
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500)),
                                  ],
                                ),
                                content: Container(
                                  height: 162,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 12),
                                        child: Text(
                                            '${FirebaseAuth.instance.currentUser!.email}',
                                            style: TextStyle(
                                                color: Colors.white
                                                    .withOpacity(0.75),
                                                fontSize: 12,
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.w500)),
                                        height: 52,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          color:
                                              Color.fromARGB(255, 60, 60, 79),
                                        ),
                                      ),
                                      Spacer(),
                                      InkWell(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          onTap: () async {
                                            await FirebaseServices()
                                                .googleSignOut();
                                            exit(0);
                                          },
                                          child: Container(
                                              width: 178,
                                              padding: EdgeInsets.all(16),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Icon(Icons.logout,
                                                      color: Colors.white),
                                                  SizedBox(width: 10),
                                                  Text('Logout',
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontFamily:
                                                              'Poppins'))
                                                ],
                                              ),
                                              alignment: Alignment.center,
                                              decoration: BoxDecoration(
                                                color: Color.fromRGBO(
                                                    3, 3, 3, 0.03),
                                                border: Border.all(
                                                    color: Color.fromRGBO(
                                                        255, 60, 60, 1)),
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                              ))),
                                    ],
                                  ),
                                ));
                          },
                          animationType: DialogTransitionType.scale,
                          curve: Curves.fastOutSlowIn,
                          duration: Duration(seconds: 1),
                        );
                      },
                      child: Container(
                        width: 52,
                        height: 52,
                        child: CircleAvatar(
                          radius: 21,
                          backgroundImage: NetworkImage(
                              '${FirebaseAuth.instance.currentUser!.photoURL}'),
                        ),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(150),
                            border: Border.all(
                                color: Color.fromRGBO(33, 92, 245, 1))),
                      ),
                    ),
                  ],
                ),
              ),
              StreamBuilder<QuerySnapshot>(
                stream: user,
                builder: (context, snapshots) {
                  return (snapshots.connectionState == ConnectionState.waiting)
                      ? Center(
                          child: CircularProgressIndicator(color: Colors.white))
                      : ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: snapshots.data!.docs.length,
                          itemBuilder: (context, index) {
                            var data = snapshots.data!.docs[index].data()
                                as Map<String, dynamic>;
                            bool _shouldIgnore = false;
                            var db = FirebaseFirestore.instance.collection(
                                '${FirebaseAuth.instance.currentUser!.email}');
                            if (DateTime.now().day > data['date']) {
                              _shouldIgnore = false;
                            } else if (DateTime.now().day == data['date']) {
                              _shouldIgnore = true;
                            } else if (data['date'] == 0) {
                              _shouldIgnore = false;
                            }
                            if (data['nex'] == 1) {
                              return Column(
                                children: [
                                  Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      Image.asset('assets/robot.png',
                                          height: 315),
                                      Positioned(
                                        top: 195,
                                        child: Container(
                                          width: 145,
                                          alignment: Alignment.center,
                                          padding: EdgeInsets.all(16),
                                          child: RichText(
                                            text: TextSpan(
                                                text: 'Nex | ',
                                                style: TextStyle(
                                                    color: Color.fromRGBO(
                                                        18, 19, 30, 1),
                                                    fontSize: 14,
                                                    fontFamily: 'Poppins',
                                                    fontWeight:
                                                        FontWeight.w500),
                                                children: <TextSpan>[
                                                  TextSpan(
                                                      text: 'Common',
                                                      style: TextStyle(
                                                          color: Color.fromRGBO(
                                                              18, 19, 30, 1),
                                                          fontSize: 14,
                                                          fontFamily: 'Poppins',
                                                          fontWeight:
                                                              FontWeight.w400))
                                                ]),
                                          ),
                                          decoration: BoxDecoration(
                                              color:
                                                  Color.fromRGBO(67, 68, 87, 1),
                                              borderRadius:
                                                  BorderRadius.circular(15)),
                                        ),
                                      )
                                    ],
                                  ),
                                  IgnorePointer(
                                    ignoring: _shouldIgnore,
                                    child: InkWell(
                                      borderRadius: BorderRadius.circular(15),
                                      onTap: () {
                                        showAnimatedDialog(
                                          context: context,
                                          barrierDismissible: true,
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                                alignment: Alignment.center,
                                                shape: RoundedRectangleBorder(
                                                  side: BorderSide(
                                                      color: Color.fromRGBO(
                                                          75, 74, 95, 1)),
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
                                                    255, 15, 15, 23),
                                                contentTextStyle: TextStyle(
                                                    color: Color.fromRGBO(
                                                        181, 181, 181, 1),
                                                    fontSize: 18,
                                                    fontWeight:
                                                        FontWeight.w400),
                                                title: Center(
                                                    child: Text(
                                                        "Nex have a gift for you!")),
                                                content: Container(
                                                  height: 282,
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
                                                                  offset: Offset(
                                                                      2, -3),
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
                                                            text: '+15 ',
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
                                                                  text: 'FNEX',
                                                                  style: TextStyle(
                                                                      color: Color.fromARGB(
                                                                          255,
                                                                          23,
                                                                          88,
                                                                          228),
                                                                      fontSize:
                                                                          21,
                                                                      fontFamily:
                                                                          'Poppins',
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w700))
                                                            ]),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsets.all(21),
                                                        child: InkWell(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      150),
                                                          onTap: () {
                                                            Navigator.pop(
                                                                context);
                                                          },
                                                          child: Container(
                                                            alignment: Alignment
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
                                                                    color: Color
                                                                        .fromRGBO(
                                                                            0,
                                                                            41,
                                                                            255,
                                                                            0.87),
                                                                    boxShadow: [
                                                                      BoxShadow(
                                                                          offset: Offset(0,
                                                                              0),
                                                                          blurRadius:
                                                                              15,
                                                                          color: Color.fromRGBO(
                                                                              0,
                                                                              41,
                                                                              255,
                                                                              0.87))
                                                                    ],
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            150)),
                                                          ),
                                                        ),
                                                      ),
                                                      Text(
                                                          'Next reward will be available in 24 hours.',
                                                          textAlign:
                                                              TextAlign.center,
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
                                                                      .w500))
                                                    ],
                                                  ),
                                                ));
                                          },
                                          animationType:
                                              DialogTransitionType.scale,
                                          curve: Curves.bounceIn,
                                          duration: Duration(seconds: 1),
                                        );

                                        db
                                            .doc(
                                                '${FirebaseAuth.instance.currentUser!.uid}')
                                            .set({
                                          'fnex': FieldValue.increment(15),
                                          'date': DateTime.now().day
                                        }, SetOptions(merge: true));
                                      },
                                      child: Container(
                                          height: 71,
                                          width: 152,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Icon(CupertinoIcons.gift_fill,
                                                  color: Colors.white),
                                              SizedBox(
                                                width: 7,
                                              ),
                                              Text(
                                                'Claim',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 16,
                                                    fontFamily: 'Poppins',
                                                    fontWeight:
                                                        FontWeight.w500),
                                              )
                                            ],
                                          ),
                                          decoration: BoxDecoration(
                                              color: Color.fromARGB(
                                                  255, 0, 77, 255),
                                              borderRadius:
                                                  BorderRadius.circular(15))),
                                    ),
                                  )
                                ],
                              );
                            } else if (data['jack'] == 1) {
                              return Column(
                                children: [
                                  Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      Image.asset('assets/jack.png',
                                          height: 315),
                                      Positioned(
                                        top: 195,
                                        child: Container(
                                          width: 145,
                                          alignment: Alignment.center,
                                          padding: EdgeInsets.all(16),
                                          child: RichText(
                                            text: TextSpan(
                                                text: 'Jack | ',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 14,
                                                    fontFamily: 'Poppins',
                                                    fontWeight:
                                                        FontWeight.w500),
                                                children: <TextSpan>[
                                                  TextSpan(
                                                      text: 'Epic',
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 14,
                                                          fontFamily: 'Poppins',
                                                          fontWeight:
                                                              FontWeight.w400))
                                                ]),
                                          ),
                                          decoration: BoxDecoration(
                                              color: Color.fromRGBO(
                                                  224, 25, 248, 1),
                                              borderRadius:
                                                  BorderRadius.circular(15)),
                                        ),
                                      )
                                    ],
                                  ),
                                  IgnorePointer(
                                    ignoring: _shouldIgnore,
                                    child: InkWell(
                                      borderRadius: BorderRadius.circular(15),
                                      onTap: () {
                                        showAnimatedDialog(
                                          context: context,
                                          barrierDismissible: true,
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                                alignment: Alignment.center,
                                                shape: RoundedRectangleBorder(
                                                  side: BorderSide(
                                                      color: Color.fromRGBO(
                                                          75, 74, 95, 1)),
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
                                                    255, 15, 15, 23),
                                                contentTextStyle: TextStyle(
                                                    color: Color.fromRGBO(
                                                        181, 181, 181, 1),
                                                    fontSize: 18,
                                                    fontWeight:
                                                        FontWeight.w400),
                                                title: Center(
                                                    child: Text(
                                                        "Jack have a gift for you!")),
                                                content: Container(
                                                  height: 282,
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
                                                                  offset: Offset(
                                                                      2, -3),
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
                                                            text: '+35 ',
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
                                                                  text: 'FNEX',
                                                                  style: TextStyle(
                                                                      color: Color.fromRGBO(
                                                                          224,
                                                                          25,
                                                                          248,
                                                                          1),
                                                                      fontSize:
                                                                          21,
                                                                      fontFamily:
                                                                          'Poppins',
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w700))
                                                            ]),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsets.all(21),
                                                        child: InkWell(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      150),
                                                          onTap: () {
                                                            Navigator.pop(
                                                                context);
                                                          },
                                                          child: Container(
                                                            alignment: Alignment
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
                                                                    color: Color
                                                                        .fromRGBO(
                                                                            225,
                                                                            25,
                                                                            248,
                                                                            0.87),
                                                                    boxShadow: [
                                                                      BoxShadow(
                                                                          offset: Offset(0,
                                                                              0),
                                                                          blurRadius:
                                                                              15,
                                                                          color: Color.fromRGBO(
                                                                              224,
                                                                              25,
                                                                              248,
                                                                              0.87))
                                                                    ],
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            150)),
                                                          ),
                                                        ),
                                                      ),
                                                      Text(
                                                          'Next reward will be available in 24 hours.',
                                                          textAlign:
                                                              TextAlign.center,
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
                                                                      .w500))
                                                    ],
                                                  ),
                                                ));
                                          },
                                          animationType:
                                              DialogTransitionType.scale,
                                          curve: Curves.bounceIn,
                                          duration: Duration(seconds: 1),
                                        );

                                        db
                                            .doc(
                                                '${FirebaseAuth.instance.currentUser!.uid}')
                                            .set({
                                          'fnex': FieldValue.increment(35),
                                          'date': DateTime.now().day
                                        }, SetOptions(merge: true));
                                      },
                                      child: Container(
                                          height: 71,
                                          width: 152,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Icon(CupertinoIcons.gift_fill,
                                                  color: Colors.white),
                                              SizedBox(
                                                width: 7,
                                              ),
                                              Text(
                                                'Claim',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 16,
                                                    fontFamily: 'Poppins',
                                                    fontWeight:
                                                        FontWeight.w500),
                                              )
                                            ],
                                          ),
                                          decoration: BoxDecoration(
                                              color: Color.fromRGBO(
                                                  224, 25, 248, 1),
                                              borderRadius:
                                                  BorderRadius.circular(15))),
                                    ),
                                  )
                                ],
                              );
                            } else if (data['ricky'] == 1) {
                              return Column(
                                children: [
                                  Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      Image.asset('assets/ricky.png',
                                          height: 315),
                                      Positioned(
                                        top: 195,
                                        child: Container(
                                          width: 145,
                                          alignment: Alignment.center,
                                          padding: EdgeInsets.all(16),
                                          child: RichText(
                                            text: TextSpan(
                                                text: 'Ricky | ',
                                                style: TextStyle(
                                                    color: Color.fromRGBO(
                                                        18, 19, 30, 1),
                                                    fontSize: 14,
                                                    fontFamily: 'Poppins',
                                                    fontWeight:
                                                        FontWeight.w500),
                                                children: <TextSpan>[
                                                  TextSpan(
                                                      text: 'Rare',
                                                      style: TextStyle(
                                                          color: Color.fromRGBO(
                                                              18, 19, 30, 1),
                                                          fontSize: 14,
                                                          fontFamily: 'Poppins',
                                                          fontWeight:
                                                              FontWeight.w400))
                                                ]),
                                          ),
                                          decoration: BoxDecoration(
                                              color: Color.fromRGBO(
                                                  255, 210, 0, 1),
                                              borderRadius:
                                                  BorderRadius.circular(15)),
                                        ),
                                      )
                                    ],
                                  ),
                                  IgnorePointer(
                                    ignoring: _shouldIgnore,
                                    child: InkWell(
                                      borderRadius: BorderRadius.circular(15),
                                      onTap: () {
                                        showAnimatedDialog(
                                          context: context,
                                          barrierDismissible: true,
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                                alignment: Alignment.center,
                                                shape: RoundedRectangleBorder(
                                                  side: BorderSide(
                                                      color: Color.fromRGBO(
                                                          75, 74, 95, 1)),
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
                                                    255, 15, 15, 23),
                                                contentTextStyle: TextStyle(
                                                    color: Color.fromRGBO(
                                                        181, 181, 181, 1),
                                                    fontSize: 18,
                                                    fontWeight:
                                                        FontWeight.w400),
                                                title: Center(
                                                    child: Text(
                                                        "Ricky have a gift for you!")),
                                                content: Container(
                                                  height: 282,
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
                                                                  offset: Offset(
                                                                      2, -3),
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
                                                            text: '+25 ',
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
                                                                  text: 'FNEX',
                                                                  style: TextStyle(
                                                                      color: Color
                                                                          .fromRGBO(
                                                                              255,
                                                                              210,
                                                                              0,
                                                                              1),
                                                                      fontSize:
                                                                          21,
                                                                      fontFamily:
                                                                          'Poppins',
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w700))
                                                            ]),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsets.all(21),
                                                        child: InkWell(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      150),
                                                          onTap: () {
                                                            Navigator.pop(
                                                                context);
                                                          },
                                                          child: Container(
                                                            alignment: Alignment
                                                                .center,
                                                            child: Text('OK',
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .black
                                                                        .withOpacity(
                                                                            0.95),
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
                                                                    color: Color
                                                                        .fromRGBO(
                                                                            255,
                                                                            210,
                                                                            0,
                                                                            0.87),
                                                                    boxShadow: [
                                                                      BoxShadow(
                                                                          offset: Offset(0,
                                                                              0),
                                                                          blurRadius:
                                                                              15,
                                                                          color: Color.fromRGBO(
                                                                              255,
                                                                              210,
                                                                              0,
                                                                              0.87))
                                                                    ],
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            150)),
                                                          ),
                                                        ),
                                                      ),
                                                      Text(
                                                          'Next reward will be available in 24 hours.',
                                                          textAlign:
                                                              TextAlign.center,
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
                                                                      .w500))
                                                    ],
                                                  ),
                                                ));
                                          },
                                          animationType:
                                              DialogTransitionType.scale,
                                          curve: Curves.bounceIn,
                                          duration: Duration(seconds: 1),
                                        );

                                        db
                                            .doc(
                                                '${FirebaseAuth.instance.currentUser!.uid}')
                                            .set({
                                          'fnex': FieldValue.increment(25),
                                          'date': DateTime.now().day
                                        }, SetOptions(merge: true));
                                      },
                                      child: Container(
                                          height: 71,
                                          width: 152,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Icon(CupertinoIcons.gift_fill,
                                                  color: Colors.black
                                                      .withOpacity(0.95)),
                                              SizedBox(
                                                width: 7,
                                              ),
                                              Text(
                                                'Claim',
                                                style: TextStyle(
                                                    color: Colors.black
                                                        .withOpacity(0.95),
                                                    fontSize: 16,
                                                    fontFamily: 'Poppins',
                                                    fontWeight:
                                                        FontWeight.w500),
                                              )
                                            ],
                                          ),
                                          decoration: BoxDecoration(
                                              color: Color.fromRGBO(
                                                  255, 210, 0, 1),
                                              borderRadius:
                                                  BorderRadius.circular(15))),
                                    ),
                                  )
                                ],
                              );
                            } else if (data['petro'] == 1) {
                              return Column(
                                children: [
                                  Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      Image.asset('assets/petro.png',
                                          height: 315),
                                      Positioned(
                                        top: 195,
                                        child: Container(
                                          width: 177,
                                          alignment: Alignment.center,
                                          padding: EdgeInsets.all(16),
                                          child: RichText(
                                            text: TextSpan(
                                                text: 'Petro | ',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 14,
                                                    fontFamily: 'Poppins',
                                                    fontWeight:
                                                        FontWeight.w500),
                                                children: <TextSpan>[
                                                  TextSpan(
                                                      text: 'Legendary',
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 14,
                                                          fontFamily: 'Poppins',
                                                          fontWeight:
                                                              FontWeight.w400))
                                                ]),
                                          ),
                                          decoration: BoxDecoration(
                                              color: Color.fromRGBO(
                                                  255, 25, 40, 1),
                                              borderRadius:
                                                  BorderRadius.circular(15)),
                                        ),
                                      )
                                    ],
                                  ),
                                  IgnorePointer(
                                    ignoring: _shouldIgnore,
                                    child: InkWell(
                                      borderRadius: BorderRadius.circular(15),
                                      onTap: () {
                                        showAnimatedDialog(
                                          context: context,
                                          barrierDismissible: true,
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                                alignment: Alignment.center,
                                                shape: RoundedRectangleBorder(
                                                  side: BorderSide(
                                                      color: Color.fromRGBO(
                                                          75, 74, 95, 1)),
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
                                                    255, 15, 15, 23),
                                                contentTextStyle: TextStyle(
                                                    color: Color.fromRGBO(
                                                        181, 181, 181, 1),
                                                    fontSize: 18,
                                                    fontWeight:
                                                        FontWeight.w400),
                                                title: Center(
                                                    child: Text(
                                                        "Petro have a gift for you!")),
                                                content: Container(
                                                  height: 282,
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
                                                                  offset: Offset(
                                                                      2, -3),
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
                                                            text: '+50 ',
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
                                                                  text: 'FNEX',
                                                                  style: TextStyle(
                                                                      color: Color
                                                                          .fromRGBO(
                                                                              255,
                                                                              25,
                                                                              40,
                                                                              1),
                                                                      fontSize:
                                                                          21,
                                                                      fontFamily:
                                                                          'Poppins',
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w700))
                                                            ]),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsets.all(21),
                                                        child: InkWell(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      150),
                                                          onTap: () {
                                                            Navigator.pop(
                                                                context);
                                                          },
                                                          child: Container(
                                                            alignment: Alignment
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
                                                                    color: Color
                                                                        .fromRGBO(
                                                                            255,
                                                                            25,
                                                                            40,
                                                                            0.87),
                                                                    boxShadow: [
                                                                      BoxShadow(
                                                                          offset: Offset(0,
                                                                              0),
                                                                          blurRadius:
                                                                              15,
                                                                          color: Color.fromRGBO(
                                                                              255,
                                                                              25,
                                                                              40,
                                                                              0.87))
                                                                    ],
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            150)),
                                                          ),
                                                        ),
                                                      ),
                                                      Text(
                                                          'Next reward will be available in 24 hours.',
                                                          textAlign:
                                                              TextAlign.center,
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
                                                                      .w500))
                                                    ],
                                                  ),
                                                ));
                                          },
                                          animationType:
                                              DialogTransitionType.scale,
                                          curve: Curves.bounceIn,
                                          duration: Duration(seconds: 1),
                                        );

                                        db
                                            .doc(
                                                '${FirebaseAuth.instance.currentUser!.uid}')
                                            .set({
                                          'fnex': FieldValue.increment(50),
                                          'date': DateTime.now().day
                                        }, SetOptions(merge: true));
                                      },
                                      child: Container(
                                          height: 71,
                                          width: 152,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Icon(CupertinoIcons.gift_fill,
                                                  color: Colors.white),
                                              SizedBox(
                                                width: 7,
                                              ),
                                              Text(
                                                'Claim',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 16,
                                                    fontFamily: 'Poppins',
                                                    fontWeight:
                                                        FontWeight.w500),
                                              )
                                            ],
                                          ),
                                          decoration: BoxDecoration(
                                              color: Color.fromRGBO(
                                                  255, 25, 40, 1),
                                              borderRadius:
                                                  BorderRadius.circular(15))),
                                    ),
                                  )
                                ],
                              );
                            }
                            return Column(
                              children: [
                                Stack(
                                  clipBehavior: Clip.none,
                                  alignment: Alignment.center,
                                  children: [
                                    Image.asset('assets/dhave.png',
                                        height: 315),
                                    Positioned(
                                      top: 195,
                                      child: Container(
                                        width: 215,
                                        alignment: Alignment.center,
                                        padding: EdgeInsets.all(16),
                                        child: Text("You don't have a robot (",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500)),
                                        decoration: BoxDecoration(
                                            color: Color.fromRGBO(
                                                67, 68, 87, 0.65),
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 16,
                                ),
                                RichText(
                                  text: TextSpan(
                                      text: 'You can hire his in ',
                                      style: TextStyle(
                                          color: Colors.white.withOpacity(0.77),
                                          fontSize: 18,
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w400),
                                      children: <TextSpan>[
                                        TextSpan(
                                            text: 'Robohire.',
                                            style: TextStyle(
                                                color: Colors.white
                                                    .withOpacity(0.87),
                                                fontSize: 18,
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.w500))
                                      ]),
                                )
                              ],
                            );
                          });
                },
              ),
            ],
          ),
        ));
  }
}

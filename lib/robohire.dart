import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:freebie_nex/success.dart';

class Robohire extends StatefulWidget {
  Robohire({Key? key}) : super(key: key);

  @override
  State<Robohire> createState() => _RobohireState();
}

class _RobohireState extends State<Robohire> {
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
          children: [
            Padding(
              padding:
                  EdgeInsets.only(left: 28, right: 28, top: 45, bottom: 16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('Robohire',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.w500)),
                  SizedBox(
                    width: 12,
                  ),
                  Icon(FontAwesomeIcons.robot, color: Colors.white),
                  Spacer(),
                ],
              ),
            ),
            StreamBuilder<QuerySnapshot>(
              stream: user,
              builder: (context, snapshots) {
                return (snapshots.connectionState == ConnectionState.waiting)
                    ? Center(
                        child: CircularProgressIndicator(color: Colors.white))
                    : Expanded(
                        child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: snapshots.data!.docs.length,
                            itemBuilder: (context, index) {
                              var data = snapshots.data!.docs[index].data()
                                  as Map<String, dynamic>;
                              return Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 28, vertical: 21),
                                    child: Container(
                                      padding: EdgeInsets.only(
                                          left: 3, right: 3, top: 0, bottom: 3),
                                      child: Container(
                                        width: double.infinity,
                                        padding: EdgeInsets.only(
                                            left: 8,
                                            right: 8,
                                            top: 25,
                                            bottom: 8),
                                        child: Stack(
                                          alignment: Alignment.bottomCenter,
                                          children: [
                                            Image.asset('assets/robot.png',
                                                height: 195),
                                            ClipRRect(
                                              borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(15),
                                                  topRight: Radius.circular(19),
                                                  bottomLeft:
                                                      Radius.circular(30),
                                                  bottomRight:
                                                      Radius.circular(30)),
                                              child: BackdropFilter(
                                                filter: ImageFilter.blur(
                                                  sigmaX: 7,
                                                  sigmaY: 7,
                                                ),
                                                child: Container(
                                                  padding: EdgeInsets.only(
                                                      left: 16,
                                                      right: 7,
                                                      top: 16,
                                                      bottom: 7),
                                                  width: double.infinity,
                                                  child: Column(
                                                    children: [
                                                      Row(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text('Nex',
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .white,
                                                                      fontSize:
                                                                          18,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500)),
                                                              Text(
                                                                  'The youngest bot.',
                                                                  style: TextStyle(
                                                                      color: Color.fromRGBO(
                                                                          134,
                                                                          133,
                                                                          180,
                                                                          1),
                                                                      fontSize:
                                                                          14,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w400))
                                                            ],
                                                          ),
                                                          Spacer(),
                                                          Text('Common',
                                                              style: TextStyle(
                                                                  color: Color
                                                                      .fromRGBO(
                                                                          25,
                                                                          137,
                                                                          248,
                                                                          1),
                                                                  fontSize: 16,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500)),
                                                          SizedBox(width: 12)
                                                        ],
                                                      ),
                                                      Row(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .end,
                                                        children: [
                                                          Icon(
                                                              FontAwesomeIcons
                                                                  .boltLightning,
                                                              color: Color
                                                                  .fromRGBO(
                                                                      33,
                                                                      92,
                                                                      245,
                                                                      1)),
                                                          SizedBox(
                                                            width: 7,
                                                          ),
                                                          RichText(
                                                            text: TextSpan(
                                                                text: '15 ',
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize:
                                                                        16,
                                                                    fontFamily:
                                                                        'Poppins',
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400),
                                                                children: <
                                                                    TextSpan>[
                                                                  TextSpan(
                                                                    text:
                                                                        'FNEX ',
                                                                    style: TextStyle(
                                                                        color: Color.fromRGBO(
                                                                            33,
                                                                            92,
                                                                            245,
                                                                            1),
                                                                        fontSize:
                                                                            16,
                                                                        fontFamily:
                                                                            'Poppins',
                                                                        fontWeight:
                                                                            FontWeight.w500),
                                                                  ),
                                                                  TextSpan(
                                                                      text:
                                                                          'per day',
                                                                      style: TextStyle(
                                                                          color: Colors
                                                                              .white,
                                                                          fontSize:
                                                                              16,
                                                                          fontFamily:
                                                                              'Poppins',
                                                                          fontWeight:
                                                                              FontWeight.w400)),
                                                                ]),
                                                          ),
                                                          Spacer(),
                                                          InkWell(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        30),
                                                            onTap: () {
                                                              if (data['nex'] ==
                                                                  1) {
                                                                showAnimatedDialog(
                                                                  context:
                                                                      context,
                                                                  barrierDismissible:
                                                                      true,
                                                                  builder:
                                                                      (BuildContext
                                                                          context) {
                                                                    return AlertDialog(
                                                                        alignment:
                                                                            Alignment
                                                                                .center,
                                                                        shape:
                                                                            RoundedRectangleBorder(
                                                                          side:
                                                                              BorderSide(color: Color.fromARGB(255, 54, 66, 230)),
                                                                          borderRadius:
                                                                              BorderRadius.circular(25),
                                                                        ),
                                                                        backgroundColor: Color.fromARGB(
                                                                            255,
                                                                            21,
                                                                            21,
                                                                            35),
                                                                        title:
                                                                            Center(
                                                                          child:
                                                                              RichText(
                                                                            textAlign:
                                                                                TextAlign.center,
                                                                            text:
                                                                                TextSpan(
                                                                              text: "You've already hired this robot.",
                                                                              style: TextStyle(color: Colors.white, fontSize: 19, fontFamily: 'Poppins', fontWeight: FontWeight.w500),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        content:
                                                                            Container(
                                                                          height:
                                                                              187,
                                                                          child:
                                                                              Column(
                                                                            children: [
                                                                              RichText(
                                                                                textAlign: TextAlign.center,
                                                                                text: TextSpan(text: "You can't hire ", style: TextStyle(color: Colors.white.withOpacity(0.58), fontSize: 14, fontFamily: 'Poppins', fontWeight: FontWeight.w400), children: <TextSpan>[
                                                                                  TextSpan(text: 'Nex', style: TextStyle(color: Color.fromRGBO(33, 92, 245, 1), fontSize: 14, fontFamily: 'Poppins', fontWeight: FontWeight.w700)),
                                                                                  TextSpan(text: ", because you've alredy hired his.", style: TextStyle(color: Colors.white.withOpacity(0.58), fontSize: 14, fontFamily: 'Poppins', fontWeight: FontWeight.w400))
                                                                                ]),
                                                                              ),
                                                                              Spacer(),
                                                                              InkWell(
                                                                                borderRadius: BorderRadius.circular(30),
                                                                                onTap: () {
                                                                                  Navigator.pop(context);
                                                                                },
                                                                                child: Container(
                                                                                  padding: EdgeInsets.all(21),
                                                                                  child: Text('OK', style: TextStyle(color: Colors.white, fontSize: 18, fontFamily: 'Poppins', fontWeight: FontWeight.w500)),
                                                                                  alignment: Alignment.center,
                                                                                  decoration: BoxDecoration(color: Color.fromARGB(255, 46, 35, 248), borderRadius: BorderRadius.circular(30)),
                                                                                ),
                                                                              )
                                                                            ],
                                                                          ),
                                                                        ));
                                                                  },
                                                                  animationType:
                                                                      DialogTransitionType
                                                                          .scale,
                                                                  curve: Curves
                                                                      .bounceIn,
                                                                  duration:
                                                                      Duration(
                                                                          seconds:
                                                                              1),
                                                                );
                                                              } else if (data[
                                                                      'nex'] ==
                                                                  2) {
                                                                showAnimatedDialog(
                                                                  context:
                                                                      context,
                                                                  barrierDismissible:
                                                                      true,
                                                                  builder:
                                                                      (BuildContext
                                                                          context) {
                                                                    return AlertDialog(
                                                                        alignment:
                                                                            Alignment
                                                                                .bottomCenter,
                                                                        shape:
                                                                            RoundedRectangleBorder(
                                                                          side:
                                                                              BorderSide(color: Color.fromRGBO(75, 74, 95, 1)),
                                                                          borderRadius:
                                                                              BorderRadius.circular(25),
                                                                        ),
                                                                        backgroundColor: Color.fromRGBO(
                                                                            21,
                                                                            21,
                                                                            35,
                                                                            1),
                                                                        title:
                                                                            Center(
                                                                          child:
                                                                              RichText(
                                                                            textAlign:
                                                                                TextAlign.center,
                                                                            text:
                                                                                TextSpan(text: 'Do you want to hire a ', style: TextStyle(color: Colors.white, fontSize: 19, fontFamily: 'Poppins', fontWeight: FontWeight.w500), children: <TextSpan>[
                                                                              TextSpan(text: 'NEX', style: TextStyle(color: Color.fromRGBO(33, 92, 245, 1), fontSize: 21, fontFamily: 'Poppins', fontWeight: FontWeight.w500)),
                                                                              TextSpan(text: '?', style: TextStyle(color: Colors.white, fontSize: 19, fontFamily: 'Poppins', fontWeight: FontWeight.w500))
                                                                            ]),
                                                                          ),
                                                                        ),
                                                                        content:
                                                                            Container(
                                                                          height:
                                                                              187,
                                                                          child:
                                                                              Column(
                                                                            children: [
                                                                              RichText(
                                                                                textAlign: TextAlign.center,
                                                                                text: TextSpan(text: 'You should to pay ', style: TextStyle(color: Colors.white.withOpacity(0.58), fontSize: 14, fontFamily: 'Poppins', fontWeight: FontWeight.w400), children: <TextSpan>[
                                                                                  TextSpan(text: '115 ', style: TextStyle(color: Colors.white, fontSize: 14, fontFamily: 'Poppins', fontWeight: FontWeight.w500)),
                                                                                  TextSpan(text: 'FNEX', style: TextStyle(color: Color.fromRGBO(33, 92, 245, 1), fontSize: 14, fontFamily: 'Poppins', fontWeight: FontWeight.w700)),
                                                                                  TextSpan(text: ' for hiring this robot.', style: TextStyle(color: Colors.white.withOpacity(0.58), fontSize: 14, fontFamily: 'Poppins', fontWeight: FontWeight.w400))
                                                                                ]),
                                                                              ),
                                                                              Spacer(),
                                                                              InkWell(
                                                                                borderRadius: BorderRadius.circular(30),
                                                                                onTap: () {
                                                                                  if (data['fnex'] >= 115) {
                                                                                    var db = FirebaseFirestore.instance.collection('${FirebaseAuth.instance.currentUser!.email}');
                                                                                    db.doc('${FirebaseAuth.instance.currentUser!.uid}').set({
                                                                                      'nex': 1,
                                                                                      'ricky': 2,
                                                                                      'jack': 2,
                                                                                      'petro': 2,
                                                                                      'fnex': FieldValue.increment(-115)
                                                                                    }, SetOptions(merge: true));
                                                                                    Navigator.push(context, MaterialPageRoute(builder: (context) => Success()));
                                                                                  } else {
                                                                                    showAnimatedDialog(
                                                                                      context: context,
                                                                                      barrierDismissible: true,
                                                                                      builder: (BuildContext context) {
                                                                                        return AlertDialog(
                                                                                            alignment: Alignment.center,
                                                                                            shape: RoundedRectangleBorder(
                                                                                              side: BorderSide(color: Color.fromARGB(255, 230, 54, 54)),
                                                                                              borderRadius: BorderRadius.circular(25),
                                                                                            ),
                                                                                            backgroundColor: Color.fromARGB(255, 35, 21, 21),
                                                                                            title: Center(
                                                                                              child: RichText(
                                                                                                textAlign: TextAlign.center,
                                                                                                text: TextSpan(text: "You can't hire a ", style: TextStyle(color: Colors.white, fontSize: 19, fontFamily: 'Poppins', fontWeight: FontWeight.w500), children: <TextSpan>[
                                                                                                  TextSpan(text: 'NEX', style: TextStyle(color: Color.fromRGBO(33, 92, 245, 1), fontSize: 21, fontFamily: 'Poppins', fontWeight: FontWeight.w500)),
                                                                                                ]),
                                                                                              ),
                                                                                            ),
                                                                                            content: Container(
                                                                                              height: 187,
                                                                                              child: Column(
                                                                                                children: [
                                                                                                  RichText(
                                                                                                    textAlign: TextAlign.center,
                                                                                                    text: TextSpan(text: 'Your balance is insufficient ', style: TextStyle(color: Colors.white.withOpacity(0.58), fontSize: 14, fontFamily: 'Poppins', fontWeight: FontWeight.w400), children: <TextSpan>[
                                                                                                      TextSpan(text: 'FNEX', style: TextStyle(color: Color.fromRGBO(33, 92, 245, 1), fontSize: 14, fontFamily: 'Poppins', fontWeight: FontWeight.w700)),
                                                                                                      TextSpan(text: ' for hiring this robot.', style: TextStyle(color: Colors.white.withOpacity(0.58), fontSize: 14, fontFamily: 'Poppins', fontWeight: FontWeight.w400))
                                                                                                    ]),
                                                                                                  ),
                                                                                                  Spacer(),
                                                                                                  InkWell(
                                                                                                    borderRadius: BorderRadius.circular(30),
                                                                                                    onTap: () {
                                                                                                      Navigator.pop(context);
                                                                                                    },
                                                                                                    child: Container(
                                                                                                      padding: EdgeInsets.all(21),
                                                                                                      child: RichText(
                                                                                                        textAlign: TextAlign.center,
                                                                                                        text: TextSpan(text: 'I will earn ', style: TextStyle(color: Colors.white, fontSize: 18, fontFamily: 'Poppins', fontWeight: FontWeight.w500), children: <TextSpan>[
                                                                                                          TextSpan(text: 'FNEX', style: TextStyle(color: Colors.white, fontSize: 18, fontFamily: 'Poppins', fontWeight: FontWeight.w500)),
                                                                                                        ]),
                                                                                                      ),
                                                                                                      alignment: Alignment.center,
                                                                                                      decoration: BoxDecoration(color: Color.fromARGB(255, 230, 54, 54), borderRadius: BorderRadius.circular(30)),
                                                                                                    ),
                                                                                                  )
                                                                                                ],
                                                                                              ),
                                                                                            ));
                                                                                      },
                                                                                      animationType: DialogTransitionType.scale,
                                                                                      curve: Curves.bounceIn,
                                                                                      duration: Duration(seconds: 1),
                                                                                    );
                                                                                  }
                                                                                },
                                                                                child: Container(
                                                                                  padding: EdgeInsets.all(21),
                                                                                  child: RichText(
                                                                                    textAlign: TextAlign.center,
                                                                                    text: TextSpan(text: 'Pay ', style: TextStyle(color: Colors.white, fontSize: 18, fontFamily: 'Poppins', fontWeight: FontWeight.w500), children: <TextSpan>[
                                                                                      TextSpan(text: '115 ', style: TextStyle(color: Colors.white, fontSize: 18, fontFamily: 'Poppins', fontWeight: FontWeight.w700)),
                                                                                      TextSpan(text: 'FNEX', style: TextStyle(color: Colors.white, fontSize: 18, fontFamily: 'Poppins', fontWeight: FontWeight.w500)),
                                                                                    ]),
                                                                                  ),
                                                                                  alignment: Alignment.center,
                                                                                  decoration: BoxDecoration(color: Color.fromRGBO(33, 58, 245, 1), borderRadius: BorderRadius.circular(30)),
                                                                                ),
                                                                              )
                                                                            ],
                                                                          ),
                                                                        ));
                                                                  },
                                                                  animationType:
                                                                      DialogTransitionType
                                                                          .scale,
                                                                  curve: Curves
                                                                      .bounceIn,
                                                                  duration:
                                                                      Duration(
                                                                          seconds:
                                                                              1),
                                                                );
                                                              } else if (data[
                                                                      'nex'] ==
                                                                  0) {
                                                                showAnimatedDialog(
                                                                  context:
                                                                      context,
                                                                  barrierDismissible:
                                                                      true,
                                                                  builder:
                                                                      (BuildContext
                                                                          context) {
                                                                    return AlertDialog(
                                                                        alignment:
                                                                            Alignment
                                                                                .bottomCenter,
                                                                        shape:
                                                                            RoundedRectangleBorder(
                                                                          side:
                                                                              BorderSide(color: Color.fromRGBO(75, 74, 95, 1)),
                                                                          borderRadius:
                                                                              BorderRadius.circular(25),
                                                                        ),
                                                                        backgroundColor: Color.fromRGBO(
                                                                            21,
                                                                            21,
                                                                            35,
                                                                            1),
                                                                        title:
                                                                            Center(
                                                                          child:
                                                                              RichText(
                                                                            textAlign:
                                                                                TextAlign.center,
                                                                            text:
                                                                                TextSpan(text: 'Do you want to hire a ', style: TextStyle(color: Colors.white, fontSize: 19, fontFamily: 'Poppins', fontWeight: FontWeight.w500), children: <TextSpan>[
                                                                              TextSpan(text: 'NEX', style: TextStyle(color: Color.fromRGBO(33, 92, 245, 1), fontSize: 21, fontFamily: 'Poppins', fontWeight: FontWeight.w500)),
                                                                              TextSpan(text: '?', style: TextStyle(color: Colors.white, fontSize: 19, fontFamily: 'Poppins', fontWeight: FontWeight.w500))
                                                                            ]),
                                                                          ),
                                                                        ),
                                                                        content:
                                                                            Container(
                                                                          height:
                                                                              187,
                                                                          child:
                                                                              Column(
                                                                            children: [
                                                                              RichText(
                                                                                textAlign: TextAlign.center,
                                                                                text: TextSpan(text: 'You should to pay ', style: TextStyle(color: Colors.white.withOpacity(0.58), fontSize: 14, fontFamily: 'Poppins', fontWeight: FontWeight.w400), children: <TextSpan>[
                                                                                  TextSpan(text: '115 ', style: TextStyle(color: Colors.white, fontSize: 14, fontFamily: 'Poppins', fontWeight: FontWeight.w500)),
                                                                                  TextSpan(text: 'FNEX', style: TextStyle(color: Color.fromRGBO(33, 92, 245, 1), fontSize: 14, fontFamily: 'Poppins', fontWeight: FontWeight.w700)),
                                                                                  TextSpan(text: ' for hiring this robot.', style: TextStyle(color: Colors.white.withOpacity(0.58), fontSize: 14, fontFamily: 'Poppins', fontWeight: FontWeight.w400))
                                                                                ]),
                                                                              ),
                                                                              Spacer(),
                                                                              InkWell(
                                                                                borderRadius: BorderRadius.circular(30),
                                                                                onTap: () {
                                                                                  if (data['fnex'] >= 115) {
                                                                                    var db = FirebaseFirestore.instance.collection('${FirebaseAuth.instance.currentUser!.email}');
                                                                                    db.doc('${FirebaseAuth.instance.currentUser!.uid}').set({
                                                                                      'nex': 1,
                                                                                      'ricky': 2,
                                                                                      'jack': 2,
                                                                                      'petro': 2,
                                                                                      'fnex': FieldValue.increment(-115)
                                                                                    }, SetOptions(merge: true));
                                                                                    Navigator.push(context, MaterialPageRoute(builder: (context) => Success()));
                                                                                  } else {
                                                                                    showAnimatedDialog(
                                                                                      context: context,
                                                                                      barrierDismissible: true,
                                                                                      builder: (BuildContext context) {
                                                                                        return AlertDialog(
                                                                                            alignment: Alignment.center,
                                                                                            shape: RoundedRectangleBorder(
                                                                                              side: BorderSide(color: Color.fromARGB(255, 230, 54, 54)),
                                                                                              borderRadius: BorderRadius.circular(25),
                                                                                            ),
                                                                                            backgroundColor: Color.fromARGB(255, 35, 21, 21),
                                                                                            title: Center(
                                                                                              child: RichText(
                                                                                                textAlign: TextAlign.center,
                                                                                                text: TextSpan(text: "You can't hire a ", style: TextStyle(color: Colors.white, fontSize: 19, fontFamily: 'Poppins', fontWeight: FontWeight.w500), children: <TextSpan>[
                                                                                                  TextSpan(text: 'NEX', style: TextStyle(color: Color.fromRGBO(33, 92, 245, 1), fontSize: 21, fontFamily: 'Poppins', fontWeight: FontWeight.w500)),
                                                                                                ]),
                                                                                              ),
                                                                                            ),
                                                                                            content: Container(
                                                                                              height: 187,
                                                                                              child: Column(
                                                                                                children: [
                                                                                                  RichText(
                                                                                                    textAlign: TextAlign.center,
                                                                                                    text: TextSpan(text: 'Your balance is insufficient ', style: TextStyle(color: Colors.white.withOpacity(0.58), fontSize: 14, fontFamily: 'Poppins', fontWeight: FontWeight.w400), children: <TextSpan>[
                                                                                                      TextSpan(text: 'FNEX', style: TextStyle(color: Color.fromRGBO(33, 92, 245, 1), fontSize: 14, fontFamily: 'Poppins', fontWeight: FontWeight.w700)),
                                                                                                      TextSpan(text: ' for hiring this robot.', style: TextStyle(color: Colors.white.withOpacity(0.58), fontSize: 14, fontFamily: 'Poppins', fontWeight: FontWeight.w400))
                                                                                                    ]),
                                                                                                  ),
                                                                                                  Spacer(),
                                                                                                  InkWell(
                                                                                                    borderRadius: BorderRadius.circular(30),
                                                                                                    onTap: () {
                                                                                                      Navigator.pop(context);
                                                                                                    },
                                                                                                    child: Container(
                                                                                                      padding: EdgeInsets.all(21),
                                                                                                      child: RichText(
                                                                                                        textAlign: TextAlign.center,
                                                                                                        text: TextSpan(text: 'I will earn ', style: TextStyle(color: Colors.white, fontSize: 18, fontFamily: 'Poppins', fontWeight: FontWeight.w500), children: <TextSpan>[
                                                                                                          TextSpan(text: 'FNEX', style: TextStyle(color: Colors.white, fontSize: 18, fontFamily: 'Poppins', fontWeight: FontWeight.w500)),
                                                                                                        ]),
                                                                                                      ),
                                                                                                      alignment: Alignment.center,
                                                                                                      decoration: BoxDecoration(color: Color.fromARGB(255, 230, 54, 54), borderRadius: BorderRadius.circular(30)),
                                                                                                    ),
                                                                                                  )
                                                                                                ],
                                                                                              ),
                                                                                            ));
                                                                                      },
                                                                                      animationType: DialogTransitionType.scale,
                                                                                      curve: Curves.bounceIn,
                                                                                      duration: Duration(seconds: 1),
                                                                                    );
                                                                                  }
                                                                                },
                                                                                child: Container(
                                                                                  padding: EdgeInsets.all(21),
                                                                                  child: RichText(
                                                                                    textAlign: TextAlign.center,
                                                                                    text: TextSpan(text: 'Pay ', style: TextStyle(color: Colors.white, fontSize: 18, fontFamily: 'Poppins', fontWeight: FontWeight.w500), children: <TextSpan>[
                                                                                      TextSpan(text: '115 ', style: TextStyle(color: Colors.white, fontSize: 18, fontFamily: 'Poppins', fontWeight: FontWeight.w700)),
                                                                                      TextSpan(text: 'FNEX', style: TextStyle(color: Colors.white, fontSize: 18, fontFamily: 'Poppins', fontWeight: FontWeight.w500)),
                                                                                    ]),
                                                                                  ),
                                                                                  alignment: Alignment.center,
                                                                                  decoration: BoxDecoration(color: Color.fromRGBO(33, 58, 245, 1), borderRadius: BorderRadius.circular(30)),
                                                                                ),
                                                                              )
                                                                            ],
                                                                          ),
                                                                        ));
                                                                  },
                                                                  animationType:
                                                                      DialogTransitionType
                                                                          .scale,
                                                                  curve: Curves
                                                                      .bounceIn,
                                                                  duration:
                                                                      Duration(
                                                                          seconds:
                                                                              1),
                                                                );
                                                              }
                                                            },
                                                            child: Container(
                                                              padding: EdgeInsets
                                                                  .symmetric(
                                                                      horizontal:
                                                                          25,
                                                                      vertical:
                                                                          16),
                                                              alignment:
                                                                  Alignment
                                                                      .center,
                                                              child: Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  Icon(
                                                                      FontAwesomeIcons
                                                                          .boltLightning,
                                                                      color: Colors
                                                                          .white),
                                                                  SizedBox(
                                                                      width: 5),
                                                                  Text('Hire',
                                                                      style: TextStyle(
                                                                          color: Colors
                                                                              .white,
                                                                          fontSize:
                                                                              18,
                                                                          fontWeight:
                                                                              FontWeight.w500))
                                                                ],
                                                              ),
                                                              decoration: BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              30),
                                                                  color: Color
                                                                      .fromRGBO(
                                                                          33,
                                                                          58,
                                                                          245,
                                                                          1)),
                                                            ),
                                                          )
                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                  decoration: BoxDecoration(
                                                      color: Color.fromRGBO(
                                                          88, 84, 117, 0.35),
                                                      borderRadius:
                                                          BorderRadius.only(
                                                              topLeft: Radius
                                                                  .circular(15),
                                                              topRight: Radius
                                                                  .circular(19),
                                                              bottomLeft: Radius
                                                                  .circular(30),
                                                              bottomRight: Radius
                                                                  .circular(
                                                                      30))),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(30),
                                            color: Color.fromRGBO(
                                                22, 22, 35, 0.75)),
                                      ),
                                      decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                              begin: Alignment.bottomCenter,
                                              end: Alignment.topCenter,
                                              colors: [
                                                Color.fromRGBO(63, 115, 250, 1),
                                                Colors.black.withOpacity(0)
                                              ]),
                                          borderRadius:
                                              BorderRadius.circular(30)),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 28, vertical: 21),
                                    child: Container(
                                      padding: EdgeInsets.only(
                                          left: 3, right: 3, top: 0, bottom: 3),
                                      child: Container(
                                        width: double.infinity,
                                        padding: EdgeInsets.only(
                                            left: 8,
                                            right: 8,
                                            top: 25,
                                            bottom: 8),
                                        child: Stack(
                                          alignment: Alignment.bottomCenter,
                                          children: [
                                            Image.asset('assets/ricky.png',
                                                height: 195),
                                            ClipRRect(
                                              borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(15),
                                                  topRight: Radius.circular(19),
                                                  bottomLeft:
                                                      Radius.circular(30),
                                                  bottomRight:
                                                      Radius.circular(30)),
                                              child: BackdropFilter(
                                                filter: ImageFilter.blur(
                                                  sigmaX: 7,
                                                  sigmaY: 7,
                                                ),
                                                child: Container(
                                                  padding: EdgeInsets.only(
                                                      left: 16,
                                                      right: 7,
                                                      top: 16,
                                                      bottom: 7),
                                                  width: double.infinity,
                                                  child: Column(
                                                    children: [
                                                      Row(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text('Ricky',
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .white,
                                                                      fontSize:
                                                                          18,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500)),
                                                              Text(
                                                                  'Ricky loves sun.',
                                                                  style: TextStyle(
                                                                      color: Color.fromRGBO(
                                                                          134,
                                                                          133,
                                                                          180,
                                                                          1),
                                                                      fontSize:
                                                                          14,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w400))
                                                            ],
                                                          ),
                                                          Spacer(),
                                                          Text('Rare',
                                                              style: TextStyle(
                                                                  color: Color
                                                                      .fromRGBO(
                                                                          255,
                                                                          229,
                                                                          0,
                                                                          1),
                                                                  fontSize: 16,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500)),
                                                          SizedBox(width: 12)
                                                        ],
                                                      ),
                                                      Row(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .end,
                                                        children: [
                                                          Icon(
                                                              FontAwesomeIcons
                                                                  .boltLightning,
                                                              color: Color
                                                                  .fromRGBO(
                                                                      225,
                                                                      229,
                                                                      0,
                                                                      1)),
                                                          SizedBox(
                                                            width: 7,
                                                          ),
                                                          RichText(
                                                            text: TextSpan(
                                                                text: '25 ',
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize:
                                                                        16,
                                                                    fontFamily:
                                                                        'Poppins',
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400),
                                                                children: <
                                                                    TextSpan>[
                                                                  TextSpan(
                                                                    text:
                                                                        'FNEX ',
                                                                    style: TextStyle(
                                                                        color: Color.fromRGBO(
                                                                            255,
                                                                            210,
                                                                            0,
                                                                            1),
                                                                        fontSize:
                                                                            16,
                                                                        fontFamily:
                                                                            'Poppins',
                                                                        fontWeight:
                                                                            FontWeight.w500),
                                                                  ),
                                                                  TextSpan(
                                                                      text:
                                                                          'per day',
                                                                      style: TextStyle(
                                                                          color: Colors
                                                                              .white,
                                                                          fontSize:
                                                                              16,
                                                                          fontFamily:
                                                                              'Poppins',
                                                                          fontWeight:
                                                                              FontWeight.w400)),
                                                                ]),
                                                          ),
                                                          Spacer(),
                                                          InkWell(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        30),
                                                            onTap: () {
                                                              if (data[
                                                                      'ricky'] ==
                                                                  1) {
                                                                showAnimatedDialog(
                                                                  context:
                                                                      context,
                                                                  barrierDismissible:
                                                                      true,
                                                                  builder:
                                                                      (BuildContext
                                                                          context) {
                                                                    return AlertDialog(
                                                                        alignment:
                                                                            Alignment
                                                                                .center,
                                                                        shape:
                                                                            RoundedRectangleBorder(
                                                                          side:
                                                                              BorderSide(color: Color.fromRGBO(255, 210, 0, 1)),
                                                                          borderRadius:
                                                                              BorderRadius.circular(25),
                                                                        ),
                                                                        backgroundColor: Color.fromARGB(
                                                                            255,
                                                                            21,
                                                                            21,
                                                                            35),
                                                                        title:
                                                                            Center(
                                                                          child:
                                                                              RichText(
                                                                            textAlign:
                                                                                TextAlign.center,
                                                                            text:
                                                                                TextSpan(
                                                                              text: "You've already hired this robot.",
                                                                              style: TextStyle(color: Colors.white, fontSize: 19, fontFamily: 'Poppins', fontWeight: FontWeight.w500),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        content:
                                                                            Container(
                                                                          height:
                                                                              187,
                                                                          child:
                                                                              Column(
                                                                            children: [
                                                                              RichText(
                                                                                textAlign: TextAlign.center,
                                                                                text: TextSpan(text: "You can't hire ", style: TextStyle(color: Colors.white.withOpacity(0.58), fontSize: 14, fontFamily: 'Poppins', fontWeight: FontWeight.w400), children: <TextSpan>[
                                                                                  TextSpan(text: 'Ricky', style: TextStyle(color: Color.fromRGBO(255, 210, 0, 1), fontSize: 14, fontFamily: 'Poppins', fontWeight: FontWeight.w700)),
                                                                                  TextSpan(text: ", because you've alredy hired his.", style: TextStyle(color: Colors.white.withOpacity(0.58), fontSize: 14, fontFamily: 'Poppins', fontWeight: FontWeight.w400))
                                                                                ]),
                                                                              ),
                                                                              Spacer(),
                                                                              InkWell(
                                                                                borderRadius: BorderRadius.circular(30),
                                                                                onTap: () {
                                                                                  Navigator.pop(context);
                                                                                },
                                                                                child: Container(
                                                                                  padding: EdgeInsets.all(21),
                                                                                  child: Text('OK', style: TextStyle(color: Color.fromRGBO(3, 3, 3, 1), fontSize: 18, fontFamily: 'Poppins', fontWeight: FontWeight.w500)),
                                                                                  alignment: Alignment.center,
                                                                                  decoration: BoxDecoration(color: Color.fromRGBO(255, 210, 0, 1), borderRadius: BorderRadius.circular(30)),
                                                                                ),
                                                                              )
                                                                            ],
                                                                          ),
                                                                        ));
                                                                  },
                                                                  animationType:
                                                                      DialogTransitionType
                                                                          .scale,
                                                                  curve: Curves
                                                                      .bounceIn,
                                                                  duration:
                                                                      Duration(
                                                                          seconds:
                                                                              1),
                                                                );
                                                              } else if (data[
                                                                      'ricky'] ==
                                                                  2) {
                                                                showAnimatedDialog(
                                                                  context:
                                                                      context,
                                                                  barrierDismissible:
                                                                      true,
                                                                  builder:
                                                                      (BuildContext
                                                                          context) {
                                                                    return AlertDialog(
                                                                        alignment:
                                                                            Alignment
                                                                                .bottomCenter,
                                                                        shape:
                                                                            RoundedRectangleBorder(
                                                                          side:
                                                                              BorderSide(color: Color.fromRGBO(75, 74, 95, 1)),
                                                                          borderRadius:
                                                                              BorderRadius.circular(25),
                                                                        ),
                                                                        backgroundColor: Color.fromRGBO(
                                                                            21,
                                                                            21,
                                                                            35,
                                                                            1),
                                                                        title:
                                                                            Center(
                                                                          child:
                                                                              RichText(
                                                                            textAlign:
                                                                                TextAlign.center,
                                                                            text:
                                                                                TextSpan(text: 'Do you want to hire a ', style: TextStyle(color: Colors.white, fontSize: 19, fontFamily: 'Poppins', fontWeight: FontWeight.w500), children: <TextSpan>[
                                                                              TextSpan(text: 'RICKY', style: TextStyle(color: Color.fromRGBO(255, 210, 0, 1), fontSize: 21, fontFamily: 'Poppins', fontWeight: FontWeight.w500)),
                                                                              TextSpan(text: '?', style: TextStyle(color: Colors.white, fontSize: 19, fontFamily: 'Poppins', fontWeight: FontWeight.w500))
                                                                            ]),
                                                                          ),
                                                                        ),
                                                                        content:
                                                                            Container(
                                                                          height:
                                                                              187,
                                                                          child:
                                                                              Column(
                                                                            children: [
                                                                              RichText(
                                                                                textAlign: TextAlign.center,
                                                                                text: TextSpan(text: 'You should to pay ', style: TextStyle(color: Colors.white.withOpacity(0.58), fontSize: 14, fontFamily: 'Poppins', fontWeight: FontWeight.w400), children: <TextSpan>[
                                                                                  TextSpan(text: '185 ', style: TextStyle(color: Colors.white, fontSize: 14, fontFamily: 'Poppins', fontWeight: FontWeight.w500)),
                                                                                  TextSpan(text: 'FNEX', style: TextStyle(color: Color.fromRGBO(255, 210, 0, 1), fontSize: 14, fontFamily: 'Poppins', fontWeight: FontWeight.w700)),
                                                                                  TextSpan(text: ' for hiring this robot.', style: TextStyle(color: Colors.white.withOpacity(0.58), fontSize: 14, fontFamily: 'Poppins', fontWeight: FontWeight.w400))
                                                                                ]),
                                                                              ),
                                                                              Spacer(),
                                                                              InkWell(
                                                                                borderRadius: BorderRadius.circular(30),
                                                                                onTap: () {
                                                                                  if (data['fnex'] >= 185) {
                                                                                    var db = FirebaseFirestore.instance.collection('${FirebaseAuth.instance.currentUser!.email}');
                                                                                    db.doc('${FirebaseAuth.instance.currentUser!.uid}').set({
                                                                                      'nex': 2,
                                                                                      'ricky': 1,
                                                                                      'jack': 2,
                                                                                      'petro': 2,
                                                                                      'fnex': FieldValue.increment(-185)
                                                                                    }, SetOptions(merge: true));
                                                                                    Navigator.push(context, MaterialPageRoute(builder: (context) => Success()));
                                                                                  } else {
                                                                                    showAnimatedDialog(
                                                                                      context: context,
                                                                                      barrierDismissible: true,
                                                                                      builder: (BuildContext context) {
                                                                                        return AlertDialog(
                                                                                            alignment: Alignment.center,
                                                                                            shape: RoundedRectangleBorder(
                                                                                              side: BorderSide(color: Color.fromARGB(255, 230, 54, 54)),
                                                                                              borderRadius: BorderRadius.circular(25),
                                                                                            ),
                                                                                            backgroundColor: Color.fromARGB(255, 35, 21, 21),
                                                                                            title: Center(
                                                                                              child: RichText(
                                                                                                textAlign: TextAlign.center,
                                                                                                text: TextSpan(text: "You can't hire a ", style: TextStyle(color: Colors.white, fontSize: 19, fontFamily: 'Poppins', fontWeight: FontWeight.w500), children: <TextSpan>[
                                                                                                  TextSpan(text: 'Ricky', style: TextStyle(color: Color.fromRGBO(255, 210, 0, 1), fontSize: 21, fontFamily: 'Poppins', fontWeight: FontWeight.w500)),
                                                                                                ]),
                                                                                              ),
                                                                                            ),
                                                                                            content: Container(
                                                                                              height: 187,
                                                                                              child: Column(
                                                                                                children: [
                                                                                                  RichText(
                                                                                                    textAlign: TextAlign.center,
                                                                                                    text: TextSpan(text: 'Your balance is insufficient ', style: TextStyle(color: Colors.white.withOpacity(0.58), fontSize: 14, fontFamily: 'Poppins', fontWeight: FontWeight.w400), children: <TextSpan>[
                                                                                                      TextSpan(text: 'FNEX', style: TextStyle(color: Color.fromRGBO(255, 210, 0, 1), fontSize: 14, fontFamily: 'Poppins', fontWeight: FontWeight.w700)),
                                                                                                      TextSpan(text: ' for hiring this robot.', style: TextStyle(color: Colors.white.withOpacity(0.58), fontSize: 14, fontFamily: 'Poppins', fontWeight: FontWeight.w400))
                                                                                                    ]),
                                                                                                  ),
                                                                                                  Spacer(),
                                                                                                  InkWell(
                                                                                                    borderRadius: BorderRadius.circular(30),
                                                                                                    onTap: () {
                                                                                                      Navigator.pop(context);
                                                                                                    },
                                                                                                    child: Container(
                                                                                                      padding: EdgeInsets.all(21),
                                                                                                      child: RichText(
                                                                                                        textAlign: TextAlign.center,
                                                                                                        text: TextSpan(text: 'I will earn ', style: TextStyle(color: Colors.white, fontSize: 18, fontFamily: 'Poppins', fontWeight: FontWeight.w500), children: <TextSpan>[
                                                                                                          TextSpan(text: 'FNEX', style: TextStyle(color: Colors.white, fontSize: 18, fontFamily: 'Poppins', fontWeight: FontWeight.w500)),
                                                                                                        ]),
                                                                                                      ),
                                                                                                      alignment: Alignment.center,
                                                                                                      decoration: BoxDecoration(color: Color.fromARGB(255, 230, 54, 54), borderRadius: BorderRadius.circular(30)),
                                                                                                    ),
                                                                                                  )
                                                                                                ],
                                                                                              ),
                                                                                            ));
                                                                                      },
                                                                                      animationType: DialogTransitionType.scale,
                                                                                      curve: Curves.bounceIn,
                                                                                      duration: Duration(seconds: 1),
                                                                                    );
                                                                                  }
                                                                                },
                                                                                child: Container(
                                                                                  padding: EdgeInsets.all(21),
                                                                                  child: RichText(
                                                                                    textAlign: TextAlign.center,
                                                                                    text: TextSpan(text: 'Pay ', style: TextStyle(color: Color.fromRGBO(3, 3, 3, 1), fontSize: 18, fontFamily: 'Poppins', fontWeight: FontWeight.w500), children: <TextSpan>[
                                                                                      TextSpan(text: '185 ', style: TextStyle(color: Color.fromRGBO(3, 3, 3, 1), fontSize: 18, fontFamily: 'Poppins', fontWeight: FontWeight.w700)),
                                                                                      TextSpan(text: 'FNEX', style: TextStyle(color: Color.fromRGBO(3, 3, 3, 1), fontSize: 18, fontFamily: 'Poppins', fontWeight: FontWeight.w500)),
                                                                                    ]),
                                                                                  ),
                                                                                  alignment: Alignment.center,
                                                                                  decoration: BoxDecoration(color: Color.fromRGBO(255, 210, 0, 1), borderRadius: BorderRadius.circular(30)),
                                                                                ),
                                                                              )
                                                                            ],
                                                                          ),
                                                                        ));
                                                                  },
                                                                  animationType:
                                                                      DialogTransitionType
                                                                          .scale,
                                                                  curve: Curves
                                                                      .bounceIn,
                                                                  duration:
                                                                      Duration(
                                                                          seconds:
                                                                              1),
                                                                );
                                                              } else if (data[
                                                                      'nex'] ==
                                                                  0) {
                                                                showAnimatedDialog(
                                                                  context:
                                                                      context,
                                                                  barrierDismissible:
                                                                      true,
                                                                  builder:
                                                                      (BuildContext
                                                                          context) {
                                                                    return AlertDialog(
                                                                        alignment:
                                                                            Alignment
                                                                                .bottomCenter,
                                                                        shape:
                                                                            RoundedRectangleBorder(
                                                                          side:
                                                                              BorderSide(color: Color.fromRGBO(75, 74, 95, 1)),
                                                                          borderRadius:
                                                                              BorderRadius.circular(25),
                                                                        ),
                                                                        backgroundColor: Color.fromRGBO(
                                                                            21,
                                                                            21,
                                                                            35,
                                                                            1),
                                                                        title:
                                                                            Center(
                                                                          child:
                                                                              RichText(
                                                                            textAlign:
                                                                                TextAlign.center,
                                                                            text:
                                                                                TextSpan(text: 'Do you want to hire a ', style: TextStyle(color: Colors.white, fontSize: 19, fontFamily: 'Poppins', fontWeight: FontWeight.w500), children: <TextSpan>[
                                                                              TextSpan(text: 'Ricky', style: TextStyle(color: Color.fromRGBO(255, 210, 0, 1), fontSize: 21, fontFamily: 'Poppins', fontWeight: FontWeight.w500)),
                                                                              TextSpan(text: '?', style: TextStyle(color: Colors.white, fontSize: 19, fontFamily: 'Poppins', fontWeight: FontWeight.w500))
                                                                            ]),
                                                                          ),
                                                                        ),
                                                                        content:
                                                                            Container(
                                                                          height:
                                                                              187,
                                                                          child:
                                                                              Column(
                                                                            children: [
                                                                              RichText(
                                                                                textAlign: TextAlign.center,
                                                                                text: TextSpan(text: 'You should to pay ', style: TextStyle(color: Colors.white.withOpacity(0.58), fontSize: 14, fontFamily: 'Poppins', fontWeight: FontWeight.w400), children: <TextSpan>[
                                                                                  TextSpan(text: '185 ', style: TextStyle(color: Colors.white, fontSize: 14, fontFamily: 'Poppins', fontWeight: FontWeight.w500)),
                                                                                  TextSpan(text: 'FNEX', style: TextStyle(color: Color.fromRGBO(255, 210, 0, 1), fontSize: 14, fontFamily: 'Poppins', fontWeight: FontWeight.w700)),
                                                                                  TextSpan(text: ' for hiring this robot.', style: TextStyle(color: Colors.white.withOpacity(0.58), fontSize: 14, fontFamily: 'Poppins', fontWeight: FontWeight.w400))
                                                                                ]),
                                                                              ),
                                                                              Spacer(),
                                                                              InkWell(
                                                                                borderRadius: BorderRadius.circular(30),
                                                                                onTap: () {
                                                                                  if (data['fnex'] >= 185) {
                                                                                    var db = FirebaseFirestore.instance.collection('${FirebaseAuth.instance.currentUser!.email}');
                                                                                    db.doc('${FirebaseAuth.instance.currentUser!.uid}').set({
                                                                                      'nex': 2,
                                                                                      'ricky': 1,
                                                                                      'jack': 2,
                                                                                      'petro': 2,
                                                                                      'fnex': FieldValue.increment(-185)
                                                                                    }, SetOptions(merge: true));
                                                                                    Navigator.push(context, MaterialPageRoute(builder: (context) => Success()));
                                                                                  } else {
                                                                                    showAnimatedDialog(
                                                                                      context: context,
                                                                                      barrierDismissible: true,
                                                                                      builder: (BuildContext context) {
                                                                                        return AlertDialog(
                                                                                            alignment: Alignment.center,
                                                                                            shape: RoundedRectangleBorder(
                                                                                              side: BorderSide(color: Color.fromARGB(255, 230, 54, 54)),
                                                                                              borderRadius: BorderRadius.circular(25),
                                                                                            ),
                                                                                            backgroundColor: Color.fromARGB(255, 35, 21, 21),
                                                                                            title: Center(
                                                                                              child: RichText(
                                                                                                textAlign: TextAlign.center,
                                                                                                text: TextSpan(text: "You can't hire a ", style: TextStyle(color: Colors.white, fontSize: 19, fontFamily: 'Poppins', fontWeight: FontWeight.w500), children: <TextSpan>[
                                                                                                  TextSpan(text: 'Ricky', style: TextStyle(color: Color.fromRGBO(255, 210, 0, 1), fontSize: 21, fontFamily: 'Poppins', fontWeight: FontWeight.w500)),
                                                                                                ]),
                                                                                              ),
                                                                                            ),
                                                                                            content: Container(
                                                                                              height: 187,
                                                                                              child: Column(
                                                                                                children: [
                                                                                                  RichText(
                                                                                                    textAlign: TextAlign.center,
                                                                                                    text: TextSpan(text: 'Your balance is insufficient ', style: TextStyle(color: Colors.white.withOpacity(0.58), fontSize: 14, fontFamily: 'Poppins', fontWeight: FontWeight.w400), children: <TextSpan>[
                                                                                                      TextSpan(text: 'FNEX', style: TextStyle(color: Color.fromRGBO(255, 210, 0, 1), fontSize: 14, fontFamily: 'Poppins', fontWeight: FontWeight.w700)),
                                                                                                      TextSpan(text: ' for hiring this robot.', style: TextStyle(color: Colors.white.withOpacity(0.58), fontSize: 14, fontFamily: 'Poppins', fontWeight: FontWeight.w400))
                                                                                                    ]),
                                                                                                  ),
                                                                                                  Spacer(),
                                                                                                  InkWell(
                                                                                                    borderRadius: BorderRadius.circular(30),
                                                                                                    onTap: () {
                                                                                                      Navigator.pop(context);
                                                                                                    },
                                                                                                    child: Container(
                                                                                                      padding: EdgeInsets.all(21),
                                                                                                      child: RichText(
                                                                                                        textAlign: TextAlign.center,
                                                                                                        text: TextSpan(text: 'I will earn ', style: TextStyle(color: Colors.white, fontSize: 18, fontFamily: 'Poppins', fontWeight: FontWeight.w500), children: <TextSpan>[
                                                                                                          TextSpan(text: 'FNEX', style: TextStyle(color: Colors.white, fontSize: 18, fontFamily: 'Poppins', fontWeight: FontWeight.w500)),
                                                                                                        ]),
                                                                                                      ),
                                                                                                      alignment: Alignment.center,
                                                                                                      decoration: BoxDecoration(color: Color.fromARGB(255, 230, 54, 54), borderRadius: BorderRadius.circular(30)),
                                                                                                    ),
                                                                                                  )
                                                                                                ],
                                                                                              ),
                                                                                            ));
                                                                                      },
                                                                                      animationType: DialogTransitionType.scale,
                                                                                      curve: Curves.bounceIn,
                                                                                      duration: Duration(seconds: 1),
                                                                                    );
                                                                                  }
                                                                                },
                                                                                child: Container(
                                                                                  padding: EdgeInsets.all(21),
                                                                                  child: RichText(
                                                                                    textAlign: TextAlign.center,
                                                                                    text: TextSpan(text: 'Pay ', style: TextStyle(color: Color.fromRGBO(3, 3, 3, 1), fontSize: 18, fontFamily: 'Poppins', fontWeight: FontWeight.w500), children: <TextSpan>[
                                                                                      TextSpan(text: '185 ', style: TextStyle(color: Color.fromRGBO(3, 3, 3, 1), fontSize: 18, fontFamily: 'Poppins', fontWeight: FontWeight.w700)),
                                                                                      TextSpan(text: 'FNEX', style: TextStyle(color: Color.fromRGBO(3, 3, 3, 1), fontSize: 18, fontFamily: 'Poppins', fontWeight: FontWeight.w500)),
                                                                                    ]),
                                                                                  ),
                                                                                  alignment: Alignment.center,
                                                                                  decoration: BoxDecoration(color: Color.fromRGBO(255, 210, 0, 1), borderRadius: BorderRadius.circular(30)),
                                                                                ),
                                                                              )
                                                                            ],
                                                                          ),
                                                                        ));
                                                                  },
                                                                  animationType:
                                                                      DialogTransitionType
                                                                          .scale,
                                                                  curve: Curves
                                                                      .bounceIn,
                                                                  duration:
                                                                      Duration(
                                                                          seconds:
                                                                              1),
                                                                );
                                                              }
                                                            },
                                                            child: Container(
                                                              padding: EdgeInsets
                                                                  .symmetric(
                                                                      horizontal:
                                                                          25,
                                                                      vertical:
                                                                          16),
                                                              alignment:
                                                                  Alignment
                                                                      .center,
                                                              child: Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  Icon(
                                                                      FontAwesomeIcons
                                                                          .boltLightning,
                                                                      color: Color
                                                                          .fromRGBO(
                                                                              3,
                                                                              3,
                                                                              3,
                                                                              1)),
                                                                  SizedBox(
                                                                      width: 5),
                                                                  Text('Hire',
                                                                      style: TextStyle(
                                                                          color: Color.fromRGBO(
                                                                              3,
                                                                              3,
                                                                              3,
                                                                              1),
                                                                          fontSize:
                                                                              18,
                                                                          fontWeight:
                                                                              FontWeight.w500))
                                                                ],
                                                              ),
                                                              decoration: BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              30),
                                                                  color: Color
                                                                      .fromRGBO(
                                                                          255,
                                                                          210,
                                                                          0,
                                                                          1)),
                                                            ),
                                                          )
                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                  decoration: BoxDecoration(
                                                      color: Color.fromRGBO(
                                                          88, 84, 117, 0.35),
                                                      borderRadius:
                                                          BorderRadius.only(
                                                              topLeft: Radius
                                                                  .circular(15),
                                                              topRight: Radius
                                                                  .circular(19),
                                                              bottomLeft: Radius
                                                                  .circular(30),
                                                              bottomRight: Radius
                                                                  .circular(
                                                                      30))),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(30),
                                            color: Color.fromRGBO(
                                                22, 22, 35, 0.75)),
                                      ),
                                      decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                              begin: Alignment.bottomCenter,
                                              end: Alignment.topCenter,
                                              colors: [
                                                Color.fromRGBO(255, 210, 0, 1),
                                                Colors.black.withOpacity(0)
                                              ]),
                                          borderRadius:
                                              BorderRadius.circular(30)),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 28, vertical: 21),
                                    child: Container(
                                      padding: EdgeInsets.only(
                                          left: 3, right: 3, top: 0, bottom: 3),
                                      child: Container(
                                        width: double.infinity,
                                        padding: EdgeInsets.only(
                                            left: 8,
                                            right: 8,
                                            top: 25,
                                            bottom: 8),
                                        child: Stack(
                                          alignment: Alignment.bottomCenter,
                                          children: [
                                            Image.asset('assets/jack.png',
                                                height: 195),
                                            ClipRRect(
                                              borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(15),
                                                  topRight: Radius.circular(19),
                                                  bottomLeft:
                                                      Radius.circular(30),
                                                  bottomRight:
                                                      Radius.circular(30)),
                                              child: BackdropFilter(
                                                filter: ImageFilter.blur(
                                                  sigmaX: 7,
                                                  sigmaY: 7,
                                                ),
                                                child: Container(
                                                  padding: EdgeInsets.only(
                                                      left: 16,
                                                      right: 7,
                                                      top: 16,
                                                      bottom: 7),
                                                  width: double.infinity,
                                                  child: Column(
                                                    children: [
                                                      Row(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text('Jack',
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .white,
                                                                      fontSize:
                                                                          18,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500)),
                                                              Text(
                                                                  'No pain - no gain.',
                                                                  style: TextStyle(
                                                                      color: Color.fromRGBO(
                                                                          134,
                                                                          133,
                                                                          180,
                                                                          1),
                                                                      fontSize:
                                                                          14,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w400))
                                                            ],
                                                          ),
                                                          Spacer(),
                                                          Text('Epic',
                                                              style: TextStyle(
                                                                  color: Color
                                                                      .fromRGBO(
                                                                          244,
                                                                          25,
                                                                          248,
                                                                          1),
                                                                  fontSize: 16,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500)),
                                                          SizedBox(width: 12)
                                                        ],
                                                      ),
                                                      Row(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .end,
                                                        children: [
                                                          Icon(
                                                              FontAwesomeIcons
                                                                  .boltLightning,
                                                              color: Color
                                                                  .fromRGBO(
                                                                      244,
                                                                      25,
                                                                      248,
                                                                      1)),
                                                          SizedBox(
                                                            width: 7,
                                                          ),
                                                          RichText(
                                                            text: TextSpan(
                                                                text: '35 ',
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize:
                                                                        16,
                                                                    fontFamily:
                                                                        'Poppins',
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400),
                                                                children: <
                                                                    TextSpan>[
                                                                  TextSpan(
                                                                    text:
                                                                        'FNEX ',
                                                                    style: TextStyle(
                                                                        color: Color.fromRGBO(
                                                                            244,
                                                                            24,
                                                                            248,
                                                                            1),
                                                                        fontSize:
                                                                            16,
                                                                        fontFamily:
                                                                            'Poppins',
                                                                        fontWeight:
                                                                            FontWeight.w500),
                                                                  ),
                                                                  TextSpan(
                                                                      text:
                                                                          'per day',
                                                                      style: TextStyle(
                                                                          color: Colors
                                                                              .white,
                                                                          fontSize:
                                                                              16,
                                                                          fontFamily:
                                                                              'Poppins',
                                                                          fontWeight:
                                                                              FontWeight.w400)),
                                                                ]),
                                                          ),
                                                          Spacer(),
                                                          InkWell(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        30),
                                                            onTap: () {
                                                              if (data[
                                                                      'jack'] ==
                                                                  1) {
                                                                showAnimatedDialog(
                                                                  context:
                                                                      context,
                                                                  barrierDismissible:
                                                                      true,
                                                                  builder:
                                                                      (BuildContext
                                                                          context) {
                                                                    return AlertDialog(
                                                                        alignment:
                                                                            Alignment
                                                                                .center,
                                                                        shape:
                                                                            RoundedRectangleBorder(
                                                                          side:
                                                                              BorderSide(color: Color.fromRGBO(244, 25, 248, 1)),
                                                                          borderRadius:
                                                                              BorderRadius.circular(25),
                                                                        ),
                                                                        backgroundColor: Color.fromARGB(
                                                                            255,
                                                                            21,
                                                                            21,
                                                                            35),
                                                                        title:
                                                                            Center(
                                                                          child:
                                                                              RichText(
                                                                            textAlign:
                                                                                TextAlign.center,
                                                                            text:
                                                                                TextSpan(
                                                                              text: "You've already hired this robot.",
                                                                              style: TextStyle(color: Colors.white, fontSize: 19, fontFamily: 'Poppins', fontWeight: FontWeight.w500),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        content:
                                                                            Container(
                                                                          height:
                                                                              187,
                                                                          child:
                                                                              Column(
                                                                            children: [
                                                                              RichText(
                                                                                textAlign: TextAlign.center,
                                                                                text: TextSpan(text: "You can't hire ", style: TextStyle(color: Colors.white.withOpacity(0.58), fontSize: 14, fontFamily: 'Poppins', fontWeight: FontWeight.w400), children: <TextSpan>[
                                                                                  TextSpan(text: 'Jack', style: TextStyle(color: Color.fromRGBO(244, 25, 248, 1), fontSize: 14, fontFamily: 'Poppins', fontWeight: FontWeight.w700)),
                                                                                  TextSpan(text: ", because you've alredy hired his.", style: TextStyle(color: Colors.white.withOpacity(0.58), fontSize: 14, fontFamily: 'Poppins', fontWeight: FontWeight.w400))
                                                                                ]),
                                                                              ),
                                                                              Spacer(),
                                                                              InkWell(
                                                                                borderRadius: BorderRadius.circular(30),
                                                                                onTap: () {
                                                                                  Navigator.pop(context);
                                                                                },
                                                                                child: Container(
                                                                                  padding: EdgeInsets.all(21),
                                                                                  child: Text('OK', style: TextStyle(color: Colors.white, fontSize: 18, fontFamily: 'Poppins', fontWeight: FontWeight.w500)),
                                                                                  alignment: Alignment.center,
                                                                                  decoration: BoxDecoration(color: Color.fromRGBO(244, 25, 248, 1), borderRadius: BorderRadius.circular(30)),
                                                                                ),
                                                                              )
                                                                            ],
                                                                          ),
                                                                        ));
                                                                  },
                                                                  animationType:
                                                                      DialogTransitionType
                                                                          .scale,
                                                                  curve: Curves
                                                                      .bounceIn,
                                                                  duration:
                                                                      Duration(
                                                                          seconds:
                                                                              1),
                                                                );
                                                              } else if (data[
                                                                      'jack'] ==
                                                                  2) {
                                                                showAnimatedDialog(
                                                                  context:
                                                                      context,
                                                                  barrierDismissible:
                                                                      true,
                                                                  builder:
                                                                      (BuildContext
                                                                          context) {
                                                                    return AlertDialog(
                                                                        alignment:
                                                                            Alignment
                                                                                .bottomCenter,
                                                                        shape:
                                                                            RoundedRectangleBorder(
                                                                          side:
                                                                              BorderSide(color: Color.fromRGBO(75, 74, 95, 1)),
                                                                          borderRadius:
                                                                              BorderRadius.circular(25),
                                                                        ),
                                                                        backgroundColor: Color.fromRGBO(
                                                                            21,
                                                                            21,
                                                                            35,
                                                                            1),
                                                                        title:
                                                                            Center(
                                                                          child:
                                                                              RichText(
                                                                            textAlign:
                                                                                TextAlign.center,
                                                                            text:
                                                                                TextSpan(text: 'Do you want to hire a ', style: TextStyle(color: Colors.white, fontSize: 19, fontFamily: 'Poppins', fontWeight: FontWeight.w500), children: <TextSpan>[
                                                                              TextSpan(text: 'JACK', style: TextStyle(color: Color.fromRGBO(244, 25, 248, 1), fontSize: 21, fontFamily: 'Poppins', fontWeight: FontWeight.w500)),
                                                                              TextSpan(text: '?', style: TextStyle(color: Colors.white, fontSize: 19, fontFamily: 'Poppins', fontWeight: FontWeight.w500))
                                                                            ]),
                                                                          ),
                                                                        ),
                                                                        content:
                                                                            Container(
                                                                          height:
                                                                              187,
                                                                          child:
                                                                              Column(
                                                                            children: [
                                                                              RichText(
                                                                                textAlign: TextAlign.center,
                                                                                text: TextSpan(text: 'You should to pay ', style: TextStyle(color: Colors.white.withOpacity(0.58), fontSize: 14, fontFamily: 'Poppins', fontWeight: FontWeight.w400), children: <TextSpan>[
                                                                                  TextSpan(text: '275 ', style: TextStyle(color: Colors.white, fontSize: 14, fontFamily: 'Poppins', fontWeight: FontWeight.w500)),
                                                                                  TextSpan(text: 'FNEX', style: TextStyle(color: Color.fromRGBO(244, 25, 248, 1), fontSize: 14, fontFamily: 'Poppins', fontWeight: FontWeight.w700)),
                                                                                  TextSpan(text: ' for hiring this robot.', style: TextStyle(color: Colors.white.withOpacity(0.58), fontSize: 14, fontFamily: 'Poppins', fontWeight: FontWeight.w400))
                                                                                ]),
                                                                              ),
                                                                              Spacer(),
                                                                              InkWell(
                                                                                borderRadius: BorderRadius.circular(30),
                                                                                onTap: () {
                                                                                  if (data['fnex'] >= 275) {
                                                                                    var db = FirebaseFirestore.instance.collection('${FirebaseAuth.instance.currentUser!.email}');
                                                                                    db.doc('${FirebaseAuth.instance.currentUser!.uid}').set({
                                                                                      'nex': 2,
                                                                                      'ricky': 2,
                                                                                      'jack': 1,
                                                                                      'petro': 2,
                                                                                      'fnex': FieldValue.increment(-275)
                                                                                    }, SetOptions(merge: true));
                                                                                    Navigator.push(context, MaterialPageRoute(builder: (context) => Success()));
                                                                                  } else {
                                                                                    showAnimatedDialog(
                                                                                      context: context,
                                                                                      barrierDismissible: true,
                                                                                      builder: (BuildContext context) {
                                                                                        return AlertDialog(
                                                                                            alignment: Alignment.center,
                                                                                            shape: RoundedRectangleBorder(
                                                                                              side: BorderSide(color: Color.fromARGB(255, 230, 54, 54)),
                                                                                              borderRadius: BorderRadius.circular(25),
                                                                                            ),
                                                                                            backgroundColor: Color.fromARGB(255, 35, 21, 21),
                                                                                            title: Center(
                                                                                              child: RichText(
                                                                                                textAlign: TextAlign.center,
                                                                                                text: TextSpan(text: "You can't hire a ", style: TextStyle(color: Colors.white, fontSize: 19, fontFamily: 'Poppins', fontWeight: FontWeight.w500), children: <TextSpan>[
                                                                                                  TextSpan(text: 'JACK', style: TextStyle(color: Color.fromRGBO(244, 25, 248, 1), fontSize: 21, fontFamily: 'Poppins', fontWeight: FontWeight.w500)),
                                                                                                ]),
                                                                                              ),
                                                                                            ),
                                                                                            content: Container(
                                                                                              height: 187,
                                                                                              child: Column(
                                                                                                children: [
                                                                                                  RichText(
                                                                                                    textAlign: TextAlign.center,
                                                                                                    text: TextSpan(text: 'Your balance is insufficient ', style: TextStyle(color: Colors.white.withOpacity(0.58), fontSize: 14, fontFamily: 'Poppins', fontWeight: FontWeight.w400), children: <TextSpan>[
                                                                                                      TextSpan(text: 'FNEX', style: TextStyle(color: Color.fromRGBO(244, 25, 248, 1), fontSize: 14, fontFamily: 'Poppins', fontWeight: FontWeight.w700)),
                                                                                                      TextSpan(text: ' for hiring this robot.', style: TextStyle(color: Colors.white.withOpacity(0.58), fontSize: 14, fontFamily: 'Poppins', fontWeight: FontWeight.w400))
                                                                                                    ]),
                                                                                                  ),
                                                                                                  Spacer(),
                                                                                                  InkWell(
                                                                                                    borderRadius: BorderRadius.circular(30),
                                                                                                    onTap: () {
                                                                                                      Navigator.pop(context);
                                                                                                    },
                                                                                                    child: Container(
                                                                                                      padding: EdgeInsets.all(21),
                                                                                                      child: RichText(
                                                                                                        textAlign: TextAlign.center,
                                                                                                        text: TextSpan(text: 'I will earn ', style: TextStyle(color: Colors.white, fontSize: 18, fontFamily: 'Poppins', fontWeight: FontWeight.w500), children: <TextSpan>[
                                                                                                          TextSpan(text: 'FNEX', style: TextStyle(color: Colors.white, fontSize: 18, fontFamily: 'Poppins', fontWeight: FontWeight.w500)),
                                                                                                        ]),
                                                                                                      ),
                                                                                                      alignment: Alignment.center,
                                                                                                      decoration: BoxDecoration(color: Color.fromARGB(255, 230, 54, 54), borderRadius: BorderRadius.circular(30)),
                                                                                                    ),
                                                                                                  )
                                                                                                ],
                                                                                              ),
                                                                                            ));
                                                                                      },
                                                                                      animationType: DialogTransitionType.scale,
                                                                                      curve: Curves.bounceIn,
                                                                                      duration: Duration(seconds: 1),
                                                                                    );
                                                                                  }
                                                                                },
                                                                                child: Container(
                                                                                  padding: EdgeInsets.all(21),
                                                                                  child: RichText(
                                                                                    textAlign: TextAlign.center,
                                                                                    text: TextSpan(text: 'Pay ', style: TextStyle(color: Colors.white, fontSize: 18, fontFamily: 'Poppins', fontWeight: FontWeight.w500), children: <TextSpan>[
                                                                                      TextSpan(text: '275 ', style: TextStyle(color: Colors.white, fontSize: 18, fontFamily: 'Poppins', fontWeight: FontWeight.w700)),
                                                                                      TextSpan(text: 'FNEX', style: TextStyle(color: Colors.white, fontSize: 18, fontFamily: 'Poppins', fontWeight: FontWeight.w500)),
                                                                                    ]),
                                                                                  ),
                                                                                  alignment: Alignment.center,
                                                                                  decoration: BoxDecoration(color: Color.fromRGBO(244, 25, 248, 1), borderRadius: BorderRadius.circular(30)),
                                                                                ),
                                                                              )
                                                                            ],
                                                                          ),
                                                                        ));
                                                                  },
                                                                  animationType:
                                                                      DialogTransitionType
                                                                          .scale,
                                                                  curve: Curves
                                                                      .bounceIn,
                                                                  duration:
                                                                      Duration(
                                                                          seconds:
                                                                              1),
                                                                );
                                                              } else if (data[
                                                                      'jack'] ==
                                                                  0) {
                                                                showAnimatedDialog(
                                                                  context:
                                                                      context,
                                                                  barrierDismissible:
                                                                      true,
                                                                  builder:
                                                                      (BuildContext
                                                                          context) {
                                                                    return AlertDialog(
                                                                        alignment:
                                                                            Alignment
                                                                                .bottomCenter,
                                                                        shape:
                                                                            RoundedRectangleBorder(
                                                                          side:
                                                                              BorderSide(color: Color.fromRGBO(75, 74, 95, 1)),
                                                                          borderRadius:
                                                                              BorderRadius.circular(25),
                                                                        ),
                                                                        backgroundColor: Color.fromRGBO(
                                                                            21,
                                                                            21,
                                                                            35,
                                                                            1),
                                                                        title:
                                                                            Center(
                                                                          child:
                                                                              RichText(
                                                                            textAlign:
                                                                                TextAlign.center,
                                                                            text:
                                                                                TextSpan(text: 'Do you want to hire a ', style: TextStyle(color: Colors.white, fontSize: 19, fontFamily: 'Poppins', fontWeight: FontWeight.w500), children: <TextSpan>[
                                                                              TextSpan(text: 'JACK', style: TextStyle(color: Color.fromRGBO(244, 25, 248, 1), fontSize: 21, fontFamily: 'Poppins', fontWeight: FontWeight.w500)),
                                                                              TextSpan(text: '?', style: TextStyle(color: Colors.white, fontSize: 19, fontFamily: 'Poppins', fontWeight: FontWeight.w500))
                                                                            ]),
                                                                          ),
                                                                        ),
                                                                        content:
                                                                            Container(
                                                                          height:
                                                                              187,
                                                                          child:
                                                                              Column(
                                                                            children: [
                                                                              RichText(
                                                                                textAlign: TextAlign.center,
                                                                                text: TextSpan(text: 'You should to pay ', style: TextStyle(color: Colors.white.withOpacity(0.58), fontSize: 14, fontFamily: 'Poppins', fontWeight: FontWeight.w400), children: <TextSpan>[
                                                                                  TextSpan(text: '275 ', style: TextStyle(color: Colors.white, fontSize: 14, fontFamily: 'Poppins', fontWeight: FontWeight.w500)),
                                                                                  TextSpan(text: 'FNEX', style: TextStyle(color: Color.fromRGBO(244, 25, 248, 1), fontSize: 14, fontFamily: 'Poppins', fontWeight: FontWeight.w700)),
                                                                                  TextSpan(text: ' for hiring this robot.', style: TextStyle(color: Colors.white.withOpacity(0.58), fontSize: 14, fontFamily: 'Poppins', fontWeight: FontWeight.w400))
                                                                                ]),
                                                                              ),
                                                                              Spacer(),
                                                                              InkWell(
                                                                                borderRadius: BorderRadius.circular(30),
                                                                                onTap: () {
                                                                                  if (data['fnex'] >= 275) {
                                                                                    var db = FirebaseFirestore.instance.collection('${FirebaseAuth.instance.currentUser!.email}');
                                                                                    db.doc('${FirebaseAuth.instance.currentUser!.uid}').set({
                                                                                      'nex': 2,
                                                                                      'ricky': 2,
                                                                                      'jack': 1,
                                                                                      'petro': 2,
                                                                                      'fnex': FieldValue.increment(-275)
                                                                                    }, SetOptions(merge: true));
                                                                                    Navigator.push(context, MaterialPageRoute(builder: (context) => Success()));
                                                                                  } else {
                                                                                    showAnimatedDialog(
                                                                                      context: context,
                                                                                      barrierDismissible: true,
                                                                                      builder: (BuildContext context) {
                                                                                        return AlertDialog(
                                                                                            alignment: Alignment.center,
                                                                                            shape: RoundedRectangleBorder(
                                                                                              side: BorderSide(color: Color.fromARGB(255, 230, 54, 54)),
                                                                                              borderRadius: BorderRadius.circular(25),
                                                                                            ),
                                                                                            backgroundColor: Color.fromARGB(255, 35, 21, 21),
                                                                                            title: Center(
                                                                                              child: RichText(
                                                                                                textAlign: TextAlign.center,
                                                                                                text: TextSpan(text: "You can't hire a ", style: TextStyle(color: Colors.white, fontSize: 19, fontFamily: 'Poppins', fontWeight: FontWeight.w500), children: <TextSpan>[
                                                                                                  TextSpan(text: 'JACK', style: TextStyle(color: Color.fromRGBO(244, 25, 248, 1), fontSize: 21, fontFamily: 'Poppins', fontWeight: FontWeight.w500)),
                                                                                                ]),
                                                                                              ),
                                                                                            ),
                                                                                            content: Container(
                                                                                              height: 187,
                                                                                              child: Column(
                                                                                                children: [
                                                                                                  RichText(
                                                                                                    textAlign: TextAlign.center,
                                                                                                    text: TextSpan(text: 'Your balance is insufficient ', style: TextStyle(color: Colors.white.withOpacity(0.58), fontSize: 14, fontFamily: 'Poppins', fontWeight: FontWeight.w400), children: <TextSpan>[
                                                                                                      TextSpan(text: 'FNEX', style: TextStyle(color: Color.fromRGBO(244, 25, 248, 1), fontSize: 14, fontFamily: 'Poppins', fontWeight: FontWeight.w700)),
                                                                                                      TextSpan(text: ' for hiring this robot.', style: TextStyle(color: Colors.white.withOpacity(0.58), fontSize: 14, fontFamily: 'Poppins', fontWeight: FontWeight.w400))
                                                                                                    ]),
                                                                                                  ),
                                                                                                  Spacer(),
                                                                                                  InkWell(
                                                                                                    borderRadius: BorderRadius.circular(30),
                                                                                                    onTap: () {
                                                                                                      Navigator.pop(context);
                                                                                                    },
                                                                                                    child: Container(
                                                                                                      padding: EdgeInsets.all(21),
                                                                                                      child: RichText(
                                                                                                        textAlign: TextAlign.center,
                                                                                                        text: TextSpan(text: 'I will earn ', style: TextStyle(color: Colors.white, fontSize: 18, fontFamily: 'Poppins', fontWeight: FontWeight.w500), children: <TextSpan>[
                                                                                                          TextSpan(text: 'FNEX', style: TextStyle(color: Colors.white, fontSize: 18, fontFamily: 'Poppins', fontWeight: FontWeight.w500)),
                                                                                                        ]),
                                                                                                      ),
                                                                                                      alignment: Alignment.center,
                                                                                                      decoration: BoxDecoration(color: Color.fromARGB(255, 230, 54, 54), borderRadius: BorderRadius.circular(30)),
                                                                                                    ),
                                                                                                  )
                                                                                                ],
                                                                                              ),
                                                                                            ));
                                                                                      },
                                                                                      animationType: DialogTransitionType.scale,
                                                                                      curve: Curves.bounceIn,
                                                                                      duration: Duration(seconds: 1),
                                                                                    );
                                                                                  }
                                                                                },
                                                                                child: Container(
                                                                                  padding: EdgeInsets.all(21),
                                                                                  child: RichText(
                                                                                    textAlign: TextAlign.center,
                                                                                    text: TextSpan(text: 'Pay ', style: TextStyle(color: Colors.white, fontSize: 18, fontFamily: 'Poppins', fontWeight: FontWeight.w500), children: <TextSpan>[
                                                                                      TextSpan(text: '275 ', style: TextStyle(color: Colors.white, fontSize: 18, fontFamily: 'Poppins', fontWeight: FontWeight.w700)),
                                                                                      TextSpan(text: 'FNEX', style: TextStyle(color: Colors.white, fontSize: 18, fontFamily: 'Poppins', fontWeight: FontWeight.w500)),
                                                                                    ]),
                                                                                  ),
                                                                                  alignment: Alignment.center,
                                                                                  decoration: BoxDecoration(color: Color.fromRGBO(244, 25, 248, 1), borderRadius: BorderRadius.circular(30)),
                                                                                ),
                                                                              )
                                                                            ],
                                                                          ),
                                                                        ));
                                                                  },
                                                                  animationType:
                                                                      DialogTransitionType
                                                                          .scale,
                                                                  curve: Curves
                                                                      .bounceIn,
                                                                  duration:
                                                                      Duration(
                                                                          seconds:
                                                                              1),
                                                                );
                                                              }
                                                            },
                                                            child: Container(
                                                              padding: EdgeInsets
                                                                  .symmetric(
                                                                      horizontal:
                                                                          25,
                                                                      vertical:
                                                                          16),
                                                              alignment:
                                                                  Alignment
                                                                      .center,
                                                              child: Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  Icon(
                                                                      FontAwesomeIcons
                                                                          .boltLightning,
                                                                      color: Colors
                                                                          .white),
                                                                  SizedBox(
                                                                      width: 5),
                                                                  Text('Hire',
                                                                      style: TextStyle(
                                                                          color: Colors
                                                                              .white,
                                                                          fontSize:
                                                                              18,
                                                                          fontWeight:
                                                                              FontWeight.w500))
                                                                ],
                                                              ),
                                                              decoration: BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              30),
                                                                  color: Color
                                                                      .fromRGBO(
                                                                          244,
                                                                          25,
                                                                          248,
                                                                          1)),
                                                            ),
                                                          )
                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                  decoration: BoxDecoration(
                                                      color: Color.fromRGBO(
                                                          88, 84, 117, 0.35),
                                                      borderRadius:
                                                          BorderRadius.only(
                                                              topLeft: Radius
                                                                  .circular(15),
                                                              topRight: Radius
                                                                  .circular(19),
                                                              bottomLeft: Radius
                                                                  .circular(30),
                                                              bottomRight: Radius
                                                                  .circular(
                                                                      30))),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(30),
                                            color: Color.fromRGBO(
                                                22, 22, 35, 0.75)),
                                      ),
                                      decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                              begin: Alignment.bottomCenter,
                                              end: Alignment.topCenter,
                                              colors: [
                                                Color.fromRGBO(244, 25, 248, 1),
                                                Colors.black.withOpacity(0)
                                              ]),
                                          borderRadius:
                                              BorderRadius.circular(30)),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 28, vertical: 21),
                                    child: Container(
                                      padding: EdgeInsets.only(
                                          left: 3, right: 3, top: 0, bottom: 3),
                                      child: Container(
                                        width: double.infinity,
                                        padding: EdgeInsets.only(
                                            left: 8,
                                            right: 8,
                                            top: 25,
                                            bottom: 8),
                                        child: Stack(
                                          alignment: Alignment.bottomCenter,
                                          children: [
                                            Image.asset('assets/petro.png',
                                                height: 195),
                                            ClipRRect(
                                              borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(15),
                                                  topRight: Radius.circular(19),
                                                  bottomLeft:
                                                      Radius.circular(30),
                                                  bottomRight:
                                                      Radius.circular(30)),
                                              child: BackdropFilter(
                                                filter: ImageFilter.blur(
                                                  sigmaX: 7,
                                                  sigmaY: 7,
                                                ),
                                                child: Container(
                                                  padding: EdgeInsets.only(
                                                      left: 16,
                                                      right: 7,
                                                      top: 16,
                                                      bottom: 7),
                                                  width: double.infinity,
                                                  child: Column(
                                                    children: [
                                                      Row(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text('Petro',
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .white,
                                                                      fontSize:
                                                                          18,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500)),
                                                              Text(
                                                                  'Just Petro.',
                                                                  style: TextStyle(
                                                                      color: Color.fromRGBO(
                                                                          134,
                                                                          133,
                                                                          180,
                                                                          1),
                                                                      fontSize:
                                                                          14,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w400))
                                                            ],
                                                          ),
                                                          Spacer(),
                                                          Text('Legenadry',
                                                              style: TextStyle(
                                                                  color: Color
                                                                      .fromRGBO(
                                                                          255,
                                                                          25,
                                                                          40,
                                                                          1),
                                                                  fontSize: 16,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500)),
                                                          SizedBox(width: 12)
                                                        ],
                                                      ),
                                                      Row(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .end,
                                                        children: [
                                                          Icon(
                                                              FontAwesomeIcons
                                                                  .boltLightning,
                                                              color: Color
                                                                  .fromRGBO(
                                                                      255,
                                                                      25,
                                                                      40,
                                                                      1)),
                                                          SizedBox(
                                                            width: 7,
                                                          ),
                                                          RichText(
                                                            text: TextSpan(
                                                                text: '35 ',
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize:
                                                                        16,
                                                                    fontFamily:
                                                                        'Poppins',
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400),
                                                                children: <
                                                                    TextSpan>[
                                                                  TextSpan(
                                                                    text:
                                                                        'FNEX ',
                                                                    style: TextStyle(
                                                                        color: Color.fromRGBO(
                                                                            255,
                                                                            25,
                                                                            40,
                                                                            1),
                                                                        fontSize:
                                                                            16,
                                                                        fontFamily:
                                                                            'Poppins',
                                                                        fontWeight:
                                                                            FontWeight.w500),
                                                                  ),
                                                                  TextSpan(
                                                                      text:
                                                                          'per day',
                                                                      style: TextStyle(
                                                                          color: Colors
                                                                              .white,
                                                                          fontSize:
                                                                              16,
                                                                          fontFamily:
                                                                              'Poppins',
                                                                          fontWeight:
                                                                              FontWeight.w400)),
                                                                ]),
                                                          ),
                                                          Spacer(),
                                                          InkWell(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        30),
                                                            onTap: () {
                                                              if (data[
                                                                      'petro'] ==
                                                                  1) {
                                                                showAnimatedDialog(
                                                                  context:
                                                                      context,
                                                                  barrierDismissible:
                                                                      true,
                                                                  builder:
                                                                      (BuildContext
                                                                          context) {
                                                                    return AlertDialog(
                                                                        alignment:
                                                                            Alignment
                                                                                .center,
                                                                        shape:
                                                                            RoundedRectangleBorder(
                                                                          side:
                                                                              BorderSide(color: Color.fromRGBO(255, 25, 40, 1)),
                                                                          borderRadius:
                                                                              BorderRadius.circular(25),
                                                                        ),
                                                                        backgroundColor: Color.fromARGB(
                                                                            255,
                                                                            21,
                                                                            21,
                                                                            35),
                                                                        title:
                                                                            Center(
                                                                          child:
                                                                              RichText(
                                                                            textAlign:
                                                                                TextAlign.center,
                                                                            text:
                                                                                TextSpan(
                                                                              text: "You've already hired this robot.",
                                                                              style: TextStyle(color: Colors.white, fontSize: 19, fontFamily: 'Poppins', fontWeight: FontWeight.w500),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        content:
                                                                            Container(
                                                                          height:
                                                                              187,
                                                                          child:
                                                                              Column(
                                                                            children: [
                                                                              RichText(
                                                                                textAlign: TextAlign.center,
                                                                                text: TextSpan(text: "You can't hire ", style: TextStyle(color: Colors.white.withOpacity(0.58), fontSize: 14, fontFamily: 'Poppins', fontWeight: FontWeight.w400), children: <TextSpan>[
                                                                                  TextSpan(text: 'Petro', style: TextStyle(color: Color.fromRGBO(255, 25, 40, 1), fontSize: 14, fontFamily: 'Poppins', fontWeight: FontWeight.w700)),
                                                                                  TextSpan(text: ", because you've alredy hired his.", style: TextStyle(color: Colors.white.withOpacity(0.58), fontSize: 14, fontFamily: 'Poppins', fontWeight: FontWeight.w400))
                                                                                ]),
                                                                              ),
                                                                              Spacer(),
                                                                              InkWell(
                                                                                borderRadius: BorderRadius.circular(30),
                                                                                onTap: () {
                                                                                  Navigator.pop(context);
                                                                                },
                                                                                child: Container(
                                                                                  padding: EdgeInsets.all(21),
                                                                                  child: Text('OK', style: TextStyle(color: Colors.white, fontSize: 18, fontFamily: 'Poppins', fontWeight: FontWeight.w500)),
                                                                                  alignment: Alignment.center,
                                                                                  decoration: BoxDecoration(color: Color.fromRGBO(255, 25, 40, 1), borderRadius: BorderRadius.circular(30)),
                                                                                ),
                                                                              )
                                                                            ],
                                                                          ),
                                                                        ));
                                                                  },
                                                                  animationType:
                                                                      DialogTransitionType
                                                                          .scale,
                                                                  curve: Curves
                                                                      .bounceIn,
                                                                  duration:
                                                                      Duration(
                                                                          seconds:
                                                                              1),
                                                                );
                                                              } else if (data[
                                                                      'petro'] ==
                                                                  2) {
                                                                showAnimatedDialog(
                                                                  context:
                                                                      context,
                                                                  barrierDismissible:
                                                                      true,
                                                                  builder:
                                                                      (BuildContext
                                                                          context) {
                                                                    return AlertDialog(
                                                                        alignment:
                                                                            Alignment
                                                                                .bottomCenter,
                                                                        shape:
                                                                            RoundedRectangleBorder(
                                                                          side:
                                                                              BorderSide(color: Color.fromRGBO(75, 74, 95, 1)),
                                                                          borderRadius:
                                                                              BorderRadius.circular(25),
                                                                        ),
                                                                        backgroundColor: Color.fromRGBO(
                                                                            21,
                                                                            21,
                                                                            35,
                                                                            1),
                                                                        title:
                                                                            Center(
                                                                          child:
                                                                              RichText(
                                                                            textAlign:
                                                                                TextAlign.center,
                                                                            text:
                                                                                TextSpan(text: 'Do you want to hire a ', style: TextStyle(color: Colors.white, fontSize: 19, fontFamily: 'Poppins', fontWeight: FontWeight.w500), children: <TextSpan>[
                                                                              TextSpan(text: 'PETRO', style: TextStyle(color: Color.fromRGBO(255, 25, 40, 1), fontSize: 21, fontFamily: 'Poppins', fontWeight: FontWeight.w500)),
                                                                              TextSpan(text: '?', style: TextStyle(color: Colors.white, fontSize: 19, fontFamily: 'Poppins', fontWeight: FontWeight.w500))
                                                                            ]),
                                                                          ),
                                                                        ),
                                                                        content:
                                                                            Container(
                                                                          height:
                                                                              187,
                                                                          child:
                                                                              Column(
                                                                            children: [
                                                                              RichText(
                                                                                textAlign: TextAlign.center,
                                                                                text: TextSpan(text: 'You should to pay ', style: TextStyle(color: Colors.white.withOpacity(0.58), fontSize: 14, fontFamily: 'Poppins', fontWeight: FontWeight.w400), children: <TextSpan>[
                                                                                  TextSpan(text: '458 ', style: TextStyle(color: Colors.white, fontSize: 14, fontFamily: 'Poppins', fontWeight: FontWeight.w500)),
                                                                                  TextSpan(text: 'FNEX', style: TextStyle(color: Color.fromRGBO(255, 25, 40, 1), fontSize: 14, fontFamily: 'Poppins', fontWeight: FontWeight.w700)),
                                                                                  TextSpan(text: ' for hiring this robot.', style: TextStyle(color: Colors.white.withOpacity(0.58), fontSize: 14, fontFamily: 'Poppins', fontWeight: FontWeight.w400))
                                                                                ]),
                                                                              ),
                                                                              Spacer(),
                                                                              InkWell(
                                                                                borderRadius: BorderRadius.circular(30),
                                                                                onTap: () {
                                                                                  if (data['fnex'] >= 458) {
                                                                                    var db = FirebaseFirestore.instance.collection('${FirebaseAuth.instance.currentUser!.email}');
                                                                                    db.doc('${FirebaseAuth.instance.currentUser!.uid}').set({
                                                                                      'nex': 2,
                                                                                      'ricky': 2,
                                                                                      'jack': 2,
                                                                                      'petro': 1,
                                                                                      'fnex': FieldValue.increment(-458)
                                                                                    }, SetOptions(merge: true));
                                                                                    Navigator.push(context, MaterialPageRoute(builder: (context) => Success()));
                                                                                  } else {
                                                                                    showAnimatedDialog(
                                                                                      context: context,
                                                                                      barrierDismissible: true,
                                                                                      builder: (BuildContext context) {
                                                                                        return AlertDialog(
                                                                                            alignment: Alignment.center,
                                                                                            shape: RoundedRectangleBorder(
                                                                                              side: BorderSide(color: Color.fromARGB(255, 230, 54, 54)),
                                                                                              borderRadius: BorderRadius.circular(25),
                                                                                            ),
                                                                                            backgroundColor: Color.fromARGB(255, 35, 21, 21),
                                                                                            title: Center(
                                                                                              child: RichText(
                                                                                                textAlign: TextAlign.center,
                                                                                                text: TextSpan(text: "You can't hire a ", style: TextStyle(color: Colors.white, fontSize: 19, fontFamily: 'Poppins', fontWeight: FontWeight.w500), children: <TextSpan>[
                                                                                                  TextSpan(text: 'PETRO', style: TextStyle(color: Color.fromRGBO(255, 25, 40, 1), fontSize: 21, fontFamily: 'Poppins', fontWeight: FontWeight.w500)),
                                                                                                ]),
                                                                                              ),
                                                                                            ),
                                                                                            content: Container(
                                                                                              height: 187,
                                                                                              child: Column(
                                                                                                children: [
                                                                                                  RichText(
                                                                                                    textAlign: TextAlign.center,
                                                                                                    text: TextSpan(text: 'Your balance is insufficient ', style: TextStyle(color: Colors.white.withOpacity(0.58), fontSize: 14, fontFamily: 'Poppins', fontWeight: FontWeight.w400), children: <TextSpan>[
                                                                                                      TextSpan(text: 'FNEX', style: TextStyle(color: Color.fromRGBO(255, 25, 40, 1), fontSize: 14, fontFamily: 'Poppins', fontWeight: FontWeight.w700)),
                                                                                                      TextSpan(text: ' for hiring this robot.', style: TextStyle(color: Colors.white.withOpacity(0.58), fontSize: 14, fontFamily: 'Poppins', fontWeight: FontWeight.w400))
                                                                                                    ]),
                                                                                                  ),
                                                                                                  Spacer(),
                                                                                                  InkWell(
                                                                                                    borderRadius: BorderRadius.circular(30),
                                                                                                    onTap: () {
                                                                                                      Navigator.pop(context);
                                                                                                    },
                                                                                                    child: Container(
                                                                                                      padding: EdgeInsets.all(21),
                                                                                                      child: RichText(
                                                                                                        textAlign: TextAlign.center,
                                                                                                        text: TextSpan(text: 'I will earn ', style: TextStyle(color: Colors.white, fontSize: 18, fontFamily: 'Poppins', fontWeight: FontWeight.w500), children: <TextSpan>[
                                                                                                          TextSpan(text: 'FNEX', style: TextStyle(color: Colors.white, fontSize: 18, fontFamily: 'Poppins', fontWeight: FontWeight.w500)),
                                                                                                        ]),
                                                                                                      ),
                                                                                                      alignment: Alignment.center,
                                                                                                      decoration: BoxDecoration(color: Color.fromARGB(255, 230, 54, 54), borderRadius: BorderRadius.circular(30)),
                                                                                                    ),
                                                                                                  )
                                                                                                ],
                                                                                              ),
                                                                                            ));
                                                                                      },
                                                                                      animationType: DialogTransitionType.scale,
                                                                                      curve: Curves.bounceIn,
                                                                                      duration: Duration(seconds: 1),
                                                                                    );
                                                                                  }
                                                                                },
                                                                                child: Container(
                                                                                  padding: EdgeInsets.all(21),
                                                                                  child: RichText(
                                                                                    textAlign: TextAlign.center,
                                                                                    text: TextSpan(text: 'Pay ', style: TextStyle(color: Colors.white, fontSize: 18, fontFamily: 'Poppins', fontWeight: FontWeight.w500), children: <TextSpan>[
                                                                                      TextSpan(text: '458 ', style: TextStyle(color: Colors.white, fontSize: 18, fontFamily: 'Poppins', fontWeight: FontWeight.w700)),
                                                                                      TextSpan(text: 'FNEX', style: TextStyle(color: Colors.white, fontSize: 18, fontFamily: 'Poppins', fontWeight: FontWeight.w500)),
                                                                                    ]),
                                                                                  ),
                                                                                  alignment: Alignment.center,
                                                                                  decoration: BoxDecoration(color: Color.fromRGBO(255, 25, 40, 1), borderRadius: BorderRadius.circular(30)),
                                                                                ),
                                                                              )
                                                                            ],
                                                                          ),
                                                                        ));
                                                                  },
                                                                  animationType:
                                                                      DialogTransitionType
                                                                          .scale,
                                                                  curve: Curves
                                                                      .bounceIn,
                                                                  duration:
                                                                      Duration(
                                                                          seconds:
                                                                              1),
                                                                );
                                                              } else if (data[
                                                                      'petro'] ==
                                                                  0) {
                                                                showAnimatedDialog(
                                                                  context:
                                                                      context,
                                                                  barrierDismissible:
                                                                      true,
                                                                  builder:
                                                                      (BuildContext
                                                                          context) {
                                                                    return AlertDialog(
                                                                        alignment:
                                                                            Alignment
                                                                                .bottomCenter,
                                                                        shape:
                                                                            RoundedRectangleBorder(
                                                                          side:
                                                                              BorderSide(color: Color.fromRGBO(75, 74, 95, 1)),
                                                                          borderRadius:
                                                                              BorderRadius.circular(25),
                                                                        ),
                                                                        backgroundColor: Color.fromRGBO(
                                                                            21,
                                                                            21,
                                                                            35,
                                                                            1),
                                                                        title:
                                                                            Center(
                                                                          child:
                                                                              RichText(
                                                                            textAlign:
                                                                                TextAlign.center,
                                                                            text:
                                                                                TextSpan(text: 'Do you want to hire a ', style: TextStyle(color: Colors.white, fontSize: 19, fontFamily: 'Poppins', fontWeight: FontWeight.w500), children: <TextSpan>[
                                                                              TextSpan(text: 'PETRO', style: TextStyle(color: Color.fromRGBO(255, 25, 40, 1), fontSize: 21, fontFamily: 'Poppins', fontWeight: FontWeight.w500)),
                                                                              TextSpan(text: '?', style: TextStyle(color: Colors.white, fontSize: 19, fontFamily: 'Poppins', fontWeight: FontWeight.w500))
                                                                            ]),
                                                                          ),
                                                                        ),
                                                                        content:
                                                                            Container(
                                                                          height:
                                                                              187,
                                                                          child:
                                                                              Column(
                                                                            children: [
                                                                              RichText(
                                                                                textAlign: TextAlign.center,
                                                                                text: TextSpan(text: 'You should to pay ', style: TextStyle(color: Colors.white.withOpacity(0.58), fontSize: 14, fontFamily: 'Poppins', fontWeight: FontWeight.w400), children: <TextSpan>[
                                                                                  TextSpan(text: '458 ', style: TextStyle(color: Colors.white, fontSize: 14, fontFamily: 'Poppins', fontWeight: FontWeight.w500)),
                                                                                  TextSpan(text: 'FNEX', style: TextStyle(color: Color.fromRGBO(255, 25, 40, 1), fontSize: 14, fontFamily: 'Poppins', fontWeight: FontWeight.w700)),
                                                                                  TextSpan(text: ' for hiring this robot.', style: TextStyle(color: Colors.white.withOpacity(0.58), fontSize: 14, fontFamily: 'Poppins', fontWeight: FontWeight.w400))
                                                                                ]),
                                                                              ),
                                                                              Spacer(),
                                                                              InkWell(
                                                                                borderRadius: BorderRadius.circular(30),
                                                                                onTap: () {
                                                                                  if (data['fnex'] >= 458) {
                                                                                    var db = FirebaseFirestore.instance.collection('${FirebaseAuth.instance.currentUser!.email}');
                                                                                    db.doc('${FirebaseAuth.instance.currentUser!.uid}').set({
                                                                                      'nex': 2,
                                                                                      'ricky': 2,
                                                                                      'jack': 2,
                                                                                      'petro': 1,
                                                                                      'fnex': FieldValue.increment(-458)
                                                                                    }, SetOptions(merge: true));
                                                                                    Navigator.push(context, MaterialPageRoute(builder: (context) => Success()));
                                                                                  } else {
                                                                                    showAnimatedDialog(
                                                                                      context: context,
                                                                                      barrierDismissible: true,
                                                                                      builder: (BuildContext context) {
                                                                                        return AlertDialog(
                                                                                            alignment: Alignment.center,
                                                                                            shape: RoundedRectangleBorder(
                                                                                              side: BorderSide(color: Color.fromARGB(255, 230, 54, 54)),
                                                                                              borderRadius: BorderRadius.circular(25),
                                                                                            ),
                                                                                            backgroundColor: Color.fromARGB(255, 35, 21, 21),
                                                                                            title: Center(
                                                                                              child: RichText(
                                                                                                textAlign: TextAlign.center,
                                                                                                text: TextSpan(text: "You can't hire a ", style: TextStyle(color: Colors.white, fontSize: 19, fontFamily: 'Poppins', fontWeight: FontWeight.w500), children: <TextSpan>[
                                                                                                  TextSpan(text: 'PETRO', style: TextStyle(color: Color.fromRGBO(255, 25, 40, 1), fontSize: 21, fontFamily: 'Poppins', fontWeight: FontWeight.w500)),
                                                                                                ]),
                                                                                              ),
                                                                                            ),
                                                                                            content: Container(
                                                                                              height: 187,
                                                                                              child: Column(
                                                                                                children: [
                                                                                                  RichText(
                                                                                                    textAlign: TextAlign.center,
                                                                                                    text: TextSpan(text: 'Your balance is insufficient ', style: TextStyle(color: Colors.white.withOpacity(0.58), fontSize: 14, fontFamily: 'Poppins', fontWeight: FontWeight.w400), children: <TextSpan>[
                                                                                                      TextSpan(text: 'FNEX', style: TextStyle(color: Color.fromRGBO(255, 25, 40, 1), fontSize: 14, fontFamily: 'Poppins', fontWeight: FontWeight.w700)),
                                                                                                      TextSpan(text: ' for hiring this robot.', style: TextStyle(color: Colors.white.withOpacity(0.58), fontSize: 14, fontFamily: 'Poppins', fontWeight: FontWeight.w400))
                                                                                                    ]),
                                                                                                  ),
                                                                                                  Spacer(),
                                                                                                  InkWell(
                                                                                                    borderRadius: BorderRadius.circular(30),
                                                                                                    onTap: () {
                                                                                                      Navigator.pop(context);
                                                                                                    },
                                                                                                    child: Container(
                                                                                                      padding: EdgeInsets.all(21),
                                                                                                      child: RichText(
                                                                                                        textAlign: TextAlign.center,
                                                                                                        text: TextSpan(text: 'I will earn ', style: TextStyle(color: Colors.white, fontSize: 18, fontFamily: 'Poppins', fontWeight: FontWeight.w500), children: <TextSpan>[
                                                                                                          TextSpan(text: 'FNEX', style: TextStyle(color: Colors.white, fontSize: 18, fontFamily: 'Poppins', fontWeight: FontWeight.w500)),
                                                                                                        ]),
                                                                                                      ),
                                                                                                      alignment: Alignment.center,
                                                                                                      decoration: BoxDecoration(color: Color.fromARGB(255, 230, 54, 54), borderRadius: BorderRadius.circular(30)),
                                                                                                    ),
                                                                                                  )
                                                                                                ],
                                                                                              ),
                                                                                            ));
                                                                                      },
                                                                                      animationType: DialogTransitionType.scale,
                                                                                      curve: Curves.bounceIn,
                                                                                      duration: Duration(seconds: 1),
                                                                                    );
                                                                                  }
                                                                                },
                                                                                child: Container(
                                                                                  padding: EdgeInsets.all(21),
                                                                                  child: RichText(
                                                                                    textAlign: TextAlign.center,
                                                                                    text: TextSpan(text: 'Pay ', style: TextStyle(color: Colors.white, fontSize: 18, fontFamily: 'Poppins', fontWeight: FontWeight.w500), children: <TextSpan>[
                                                                                      TextSpan(text: '458 ', style: TextStyle(color: Colors.white, fontSize: 18, fontFamily: 'Poppins', fontWeight: FontWeight.w700)),
                                                                                      TextSpan(text: 'FNEX', style: TextStyle(color: Colors.white, fontSize: 18, fontFamily: 'Poppins', fontWeight: FontWeight.w500)),
                                                                                    ]),
                                                                                  ),
                                                                                  alignment: Alignment.center,
                                                                                  decoration: BoxDecoration(color: Color.fromRGBO(255, 25, 40, 1), borderRadius: BorderRadius.circular(30)),
                                                                                ),
                                                                              )
                                                                            ],
                                                                          ),
                                                                        ));
                                                                  },
                                                                  animationType:
                                                                      DialogTransitionType
                                                                          .scale,
                                                                  curve: Curves
                                                                      .bounceIn,
                                                                  duration:
                                                                      Duration(
                                                                          seconds:
                                                                              1),
                                                                );
                                                              }
                                                            },
                                                            child: Container(
                                                              padding: EdgeInsets
                                                                  .symmetric(
                                                                      horizontal:
                                                                          25,
                                                                      vertical:
                                                                          16),
                                                              alignment:
                                                                  Alignment
                                                                      .center,
                                                              child: Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  Icon(
                                                                      FontAwesomeIcons
                                                                          .boltLightning,
                                                                      color: Colors
                                                                          .white),
                                                                  SizedBox(
                                                                      width: 5),
                                                                  Text('Hire',
                                                                      style: TextStyle(
                                                                          color: Colors
                                                                              .white,
                                                                          fontSize:
                                                                              18,
                                                                          fontWeight:
                                                                              FontWeight.w500))
                                                                ],
                                                              ),
                                                              decoration: BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              30),
                                                                  color: Color
                                                                      .fromRGBO(
                                                                          255,
                                                                          25,
                                                                          40,
                                                                          1)),
                                                            ),
                                                          )
                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                  decoration: BoxDecoration(
                                                      color: Color.fromRGBO(
                                                          88, 84, 117, 0.35),
                                                      borderRadius:
                                                          BorderRadius.only(
                                                              topLeft: Radius
                                                                  .circular(15),
                                                              topRight: Radius
                                                                  .circular(19),
                                                              bottomLeft: Radius
                                                                  .circular(30),
                                                              bottomRight: Radius
                                                                  .circular(
                                                                      30))),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(30),
                                            color: Color.fromRGBO(
                                                22, 22, 35, 0.75)),
                                      ),
                                      decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                              begin: Alignment.bottomCenter,
                                              end: Alignment.topCenter,
                                              colors: [
                                                Color.fromRGBO(255, 25, 40, 1),
                                                Colors.black.withOpacity(0)
                                              ]),
                                          borderRadius:
                                              BorderRadius.circular(30)),
                                    ),
                                  ),
                                ],
                              );
                            }),
                      );
              },
            ),
          ],
        ),
      ),
    );
  }
}

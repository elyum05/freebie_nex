import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:freebie_nex/ad.dart';

class Wallet extends StatefulWidget {
  Wallet({Key? key}) : super(key: key);

  @override
  State<Wallet> createState() => _WalletState();
}

class _WalletState extends State<Wallet> {
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
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 35),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('Wallet',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.w500)),
                        SizedBox(
                          width: 12,
                        ),
                        Icon(FontAwesomeIcons.wallet, color: Colors.white),
                        Spacer(),
                        Image.asset('assets/back.png')
                      ],
                    ),
                  ),
                  Positioned(
                    top: 105,
                    left: 0,
                    right: 0,
                    child: StreamBuilder<QuerySnapshot>(
                      stream: user,
                      builder: (context, snapshots) {
                        return (snapshots.connectionState ==
                                ConnectionState.waiting)
                            ? Center(
                                child: CircularProgressIndicator(
                                    color: Colors.white))
                            : ListView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: snapshots.data!.docs.length,
                                itemBuilder: (context, index) {
                                  var data = snapshots.data!.docs[index].data()
                                      as Map<String, dynamic>;
                                  return Padding(
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
                                            padding: EdgeInsets.all(7),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Text('Balance',
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.w500)),
                                                Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      vertical: 35),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Image.asset(
                                                          'assets/fnex.png',
                                                          height: 45),
                                                      SizedBox(
                                                        width: 10,
                                                      ),
                                                      RichText(
                                                          text: TextSpan(
                                                              text: data['fnex']
                                                                  .toString(),
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize: 32,
                                                                  fontFamily:
                                                                      'Poppins',
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500),
                                                              children: <
                                                                  TextSpan>[
                                                            TextSpan(
                                                                text: ' FNEX',
                                                                style: TextStyle(
                                                                    color: Color
                                                                        .fromRGBO(
                                                                            30,
                                                                            65,
                                                                            245,
                                                                            1),
                                                                    fontSize:
                                                                        32,
                                                                    fontFamily:
                                                                        'Poppins',
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600))
                                                          ]))
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.all(8),
                                                  child: Text(
                                                      'Withdrawal not yet available',
                                                      style: TextStyle(
                                                          color: Color.fromRGBO(
                                                              134, 133, 180, 1),
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
                                  );
                                });
                      },
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 287,
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 30),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('Daily rewards',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 21,
                            fontWeight: FontWeight.w500)),
                    Text('Watch and earn FNEX.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Color.fromRGBO(134, 133, 180, 1),
                            fontSize: 16,
                            fontWeight: FontWeight.w400)),
                    StreamBuilder<QuerySnapshot>(
                      stream: user,
                      builder: (context, snapshots) {
                        return (snapshots.connectionState ==
                                ConnectionState.waiting)
                            ? Center(
                                child: CircularProgressIndicator(
                                    color: Colors.white))
                            : ListView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: snapshots.data!.docs.length,
                                itemBuilder: (context, index) {
                                  var data = snapshots.data!.docs[index].data()
                                      as Map<String, dynamic>;

                                  return Padding(
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
                                            padding: EdgeInsets.all(16),
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Image.asset('assets/gift.png',
                                                    height: 145),
                                                SizedBox(width: 10),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text('Watch to Earn!',
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 18,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500)),
                                                    SizedBox(
                                                      height: 3,
                                                    ),
                                                    Text(
                                                        'You can claim\n1-10 FNEX.',
                                                        style: TextStyle(
                                                            color: Colors.white
                                                                .withOpacity(
                                                                    0.65),
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500)),
                                                    SizedBox(
                                                      height: 12,
                                                    ),
                                                    InkWell(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              16),
                                                      onTap: () {
                                                        Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                                builder:
                                                                    (context) =>
                                                                        Ad()));
                                                      },
                                                      child: Container(
                                                        width: 165,
                                                        padding:
                                                            EdgeInsets.all(16),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Icon(
                                                              CupertinoIcons
                                                                  .play_circle_fill,
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                            SizedBox(width: 7),
                                                            Text('Claim',
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize:
                                                                        16,
                                                                    fontFamily:
                                                                        'Poppins',
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500)),
                                                          ],
                                                        ),
                                                        alignment:
                                                            Alignment.center,
                                                        decoration: BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius.circular(
                                                                    16),
                                                            gradient: LinearGradient(
                                                                begin: Alignment
                                                                    .topCenter,
                                                                end: Alignment
                                                                    .bottomCenter,
                                                                colors: [
                                                                  Color
                                                                      .fromRGBO(
                                                                          34,
                                                                          74,
                                                                          215,
                                                                          1),
                                                                  Color
                                                                      .fromRGBO(
                                                                          18,
                                                                          37,
                                                                          138,
                                                                          1)
                                                                ]),
                                                            boxShadow: [
                                                              BoxShadow(
                                                                  offset:
                                                                      Offset(
                                                                          0, 1),
                                                                  blurRadius: 5,
                                                                  color: Color
                                                                      .fromRGBO(
                                                                          11,
                                                                          33,
                                                                          232,
                                                                          0.45))
                                                            ]),
                                                      ),
                                                    ),
                                                  ],
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
                                  );
                                });
                      },
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(35),
                      topRight: Radius.circular(35),
                    ),
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color.fromRGBO(28, 28, 68, 1),
                          Color.fromRGBO(1, 1, 16, 1)
                        ])),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

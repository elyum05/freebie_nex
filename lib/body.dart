import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:freebie_nex/home_screen.dart';
import 'package:freebie_nex/robohire.dart';
import 'package:freebie_nex/wallet.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class Body extends StatefulWidget {
  Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(3, 3, 3, 16),
      body: PersistentTabView(
        context,
        padding: NavBarPadding.symmetric(vertical: 25),
        decoration:
            NavBarDecoration(border: Border.all(color: Colors.transparent)),
        screens: _screens(),
        items: _items(),
        navBarHeight: 107,
        navBarStyle: NavBarStyle.style12,
        backgroundColor: Color.fromRGBO(3, 3, 15, 1),
      ),
    );
  }

  List<Widget> _screens() {
    return [HomeScreen(), Robohire(), Wallet()];
  }

  List<PersistentBottomNavBarItem> _items() {
    return [
      PersistentBottomNavBarItem(
          icon: Icon(CupertinoIcons.house_alt_fill),
          title: 'Home',
          activeColorPrimary: Color.fromARGB(255, 29, 68, 241),
          inactiveColorPrimary: Color.fromRGBO(88, 88, 115, 1)),
      PersistentBottomNavBarItem(
          icon: Icon(CupertinoIcons.cart_fill_badge_plus),
          title: 'Hire Robot',
          activeColorPrimary: Color.fromARGB(255, 29, 68, 241),
          inactiveColorPrimary: Color.fromRGBO(88, 88, 115, 1)),
      PersistentBottomNavBarItem(
          icon: Icon(Icons.account_balance_wallet),
          title: 'Wallet',
          activeColorPrimary: Color.fromARGB(255, 29, 68, 241),
          inactiveColorPrimary: Color.fromRGBO(88, 88, 115, 1)),
    ];
  }
}

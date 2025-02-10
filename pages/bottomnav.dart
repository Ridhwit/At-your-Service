import 'package:at_your_service/pages/chat_page.dart';
import 'package:at_your_service/pages/home.dart';
import 'package:at_your_service/pages/order.dart';
import 'package:at_your_service/pages/profile.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {

  late List<Widget> pages;

  late Home HomePage;
  late OrderPage order;
  late ChatPage chatPage;
  late ProfilePage profilePage;

  int currentTabIndex=0;

  @override
  void initState() {
    HomePage=const Home();
    order=const OrderPage();
    chatPage=const ChatPage();
    profilePage=const ProfilePage();
    pages=[HomePage, order, chatPage, profilePage];

    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        height: 70,
        backgroundColor: Colors.white,
        color: Colors.black,
        animationDuration: const Duration(milliseconds: 500),
        onTap: (int index){
          setState(() {
            currentTabIndex= index;
          });
        },
        items: const [
          Icon(Icons.home_outlined,
           color: Colors.white, 
           size: 30.0),
          Icon(Icons.shop_outlined, 
          color: Colors.white,
          size:30.0),
          Icon(Icons.chat_outlined, 
          color: Colors.white, 
          size: 30.0),
          Icon(Icons.person, color: 
          Colors.white, 
          size: 30.0),
        ],
      ),
      body: pages[currentTabIndex],
    );

  }
}
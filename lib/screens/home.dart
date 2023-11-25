import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:untitled/screens/page1.dart';
import 'package:untitled/screens/page2.dart';
import 'package:untitled/screens/page3.dart';
import 'package:untitled/screens/page5.dart';
import 'package:flutter/material.dart';
import 'package:untitled/screens/page4.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _page = 0;
  final pages = [Page1(), Page2(), Page3(), Page4(),Page5()];
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.blueGrey,
        items: [
          CurvedNavigationBarItem(
            child: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          CurvedNavigationBarItem(
            child: Icon(Icons.shopping_bag_outlined),
            label: 'Products',
          ),
          CurvedNavigationBarItem(
            child: Icon(Icons.shopping_cart),
            label: 'My cart',
          ),
          CurvedNavigationBarItem(
            child: Icon(Icons.sunny),
            label: 'Weather',
          ),
          CurvedNavigationBarItem(
            child: Icon(Icons.info_outline),
            label: 'About',
          ),

        ],
        onTap: (index) {
          // Handle button tap
          setState(() {
            _page= index;
          });
          print(index);
        },
      ),
      body: pages[_page],


    );
  }
}
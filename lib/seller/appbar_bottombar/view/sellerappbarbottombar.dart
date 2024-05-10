import 'package:auto_mates/user/appbarbottombar/view/widgets/app_bar_gradient_color.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:flutter/material.dart';

class Sellerappbarbottombar extends StatefulWidget {
  const Sellerappbarbottombar({super.key});

  @override
  State<Sellerappbarbottombar> createState() => _SellerappbarbottombarState();
}

class _SellerappbarbottombarState extends State<Sellerappbarbottombar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        flexibleSpace: const AppBarGradientColor(),
      ),
      body: const Center(child: Text('Seller AppBottomBAr')),
      bottomNavigationBar: CurvedNavigationBar(
        animationCurve: Easing.standard,
        backgroundColor: Colors.white,
        buttonBackgroundColor: const Color.fromARGB(255, 100, 206, 248),
        color: const Color.fromARGB(255, 36, 167, 248),
        items: const [
          CurvedNavigationBarItem(
            child: Icon(Icons.home_rounded,color: Colors.black,),
            label: 'Home',labelStyle: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
          ),
          CurvedNavigationBarItem(
            child: Icon(Icons.message_rounded),
            label: 'Chat',labelStyle: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
          ),
          CurvedNavigationBarItem(
            child: Icon(Icons.perm_identity),
            label: 'Profile',labelStyle: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
          ),
        ],
        onTap: (index) {
          
        },
      ),
    );
  }
}

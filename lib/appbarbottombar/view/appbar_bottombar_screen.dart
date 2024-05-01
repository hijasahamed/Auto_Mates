
import 'package:auto_mates/appbarbottombar/view/widgets/app_bar_widget.dart';
import 'package:auto_mates/appbarbottombar/view/widgets/bottom_navigation_widget.dart';
import 'package:auto_mates/appbarbottombar/view/widgets/drawer_widget.dart'; 
import 'package:auto_mates/buyscreentab/ui/buy_screen.dart';
import 'package:auto_mates/homescreen/ui/home_screen.dart'; 
import 'package:flutter/material.dart';

class AppbarBottomTabSwitchScreen extends StatefulWidget {
  const AppbarBottomTabSwitchScreen({super.key});

  @override
  State<AppbarBottomTabSwitchScreen> createState() => _BottomTabSwitchScreenState();
}

class _BottomTabSwitchScreenState extends State<AppbarBottomTabSwitchScreen> {

  int tabIndex=0;
  List tabs=[
    const HomeScreen(),
    const BuyScreen(),
    const BuyScreen(),
    const BuyScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: tabIndex==1? const Size.fromHeight(110) : const Size.fromHeight(85), 
        child: AppBarWidget(screenSize: screenSize,tabIndex: tabIndex,)
      ),
      bottomNavigationBar: BottomNavigationBarWidget(tabIndex: tabIndex),
      body: tabs[tabIndex],      
      drawer: DrawerWidget(screenSize: screenSize)
    );
  }
}
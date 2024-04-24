import 'package:auto_mates/screens/homescreentab/ui/home_screen.dart';
import 'package:flutter/material.dart';

class BottomTabSwitchScreen extends StatefulWidget {
  const BottomTabSwitchScreen({super.key});

  @override
  State<BottomTabSwitchScreen> createState() => _BottomTabSwitchScreenState();
}

class _BottomTabSwitchScreenState extends State<BottomTabSwitchScreen> {

  int tabIndex=0;
  List tabs=[
    const HomeScreen(),
    const HomeScreen(),
    const HomeScreen(),
    const HomeScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        elevation: 10,
        currentIndex: tabIndex,
        onTap: (index){
            setState(() {
              tabIndex=index;
            });
          }, 
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.car_rental),
            label: 'Buy',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.sell_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.newspaper),
            label: 'News',
          ),
        ],
        selectedItemColor: const Color.fromARGB(255, 76, 207, 239),
        selectedFontSize: 15,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold,),
        showUnselectedLabels: true,
        showSelectedLabels: true,
        unselectedItemColor: const Color(0xFF424141),
        unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),              
      ),
      body: tabs[tabIndex],
    );
  }
}
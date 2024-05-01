import 'package:flutter/material.dart';


// ignore: must_be_immutable
class BottomNavigationBarWidget extends StatefulWidget {
  BottomNavigationBarWidget({super.key,required this.tabIndex});
  int tabIndex;
  @override
  State<BottomNavigationBarWidget> createState() => _BottomNavigationBarWidgetState();
}

class _BottomNavigationBarWidgetState extends State<BottomNavigationBarWidget> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        elevation: 10,
        currentIndex: widget.tabIndex,
        onTap: (index){
            setState(() {
              widget.tabIndex=index;
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
            icon: Icon(Icons.newspaper),
            label: 'News',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        selectedItemColor: const Color.fromARGB(255, 76, 207, 239),
        selectedFontSize: 15,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold,),
        showUnselectedLabels: true,
        showSelectedLabels: true,
        unselectedItemColor: const Color(0xFF424141),
        unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),              
      );
  }
}
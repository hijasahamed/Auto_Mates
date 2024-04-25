import 'package:auto_mates/screens/bottomtabswitch_appbar/app_bar_widget.dart';
import 'package:auto_mates/screens/bottomtabswitch_appbar/drawer_listtile_widget.dart';
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
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(85),
        child:AppBarWidget(screenSize: screenSize)
      ),
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
      drawer: Drawer(
        width: screenSize.width/1.22,
        child: ListView(
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 82, 170, 161),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,        
                children: [
                  const CircleAvatar(
                    radius: 35,
                    backgroundImage: NetworkImage('https://www.shareicon.net/data/512x512/2016/09/15/829452_user_512x512.png'),
                  ),
                  SizedBox(width: screenSize.width/30,),
                  const Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Hello',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.white),),
                        Text('Sinina',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),),
                      ],
                    ),
                  ),
                  const Spacer(),
                  const Icon(Icons.arrow_forward_ios_rounded,color: Colors.white,),                  
                ],
              ),
            ),
            const DrawerListtileWidget(leadingIcon: Icons.home_rounded, title: 'Home'),
            const DrawerListtileWidget(leadingIcon: Icons.favorite_border, title: 'Favourite Sellers'),
            const DrawerListtileWidget(leadingIcon: Icons.favorite_border, title: 'Favourite Cars'),
            const DrawerListtileWidget(leadingIcon: Icons.car_rental, title: 'Buy a Car'),
            const DrawerListtileWidget(leadingIcon: Icons.calculate_outlined, title: 'EMI Calculator'),
            const DrawerListtileWidget(leadingIcon: Icons.newspaper, title: 'News'),
            const DrawerListtileWidget(leadingIcon: Icons.rule_sharp, title: 'Terms & Conditions'),
            const DrawerListtileWidget(leadingIcon: Icons.privacy_tip_outlined, title: 'Privacy Policy'),
            const DrawerListtileWidget(leadingIcon: Icons.info_outline, title: 'About'),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 50,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),),
                child: const Center(child: Text('Version 1.0.0',style: TextStyle(fontWeight: FontWeight.w600),),),
              ),
            )
          ],
        ),
      ),
    );
  }
}
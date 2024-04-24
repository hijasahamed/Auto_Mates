import 'package:auto_mates/screens/bottomtabswitch_appbar/app_bar_widget.dart';
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
      // drawer: Drawer(
      //   backgroundColor: Colors.white,          
      //   width: screenSize.width/1.22,
      //   child: SafeArea(
      //     child: Container(
      //       color: const Color(0xFFDBEDF5),
      //       child:  Column(
      //         crossAxisAlignment: CrossAxisAlignment.start,
      //         children: [
      //           Container(
      //             color: const Color.fromARGB(255, 76, 207, 239),
      //             child:  Padding(
      //               padding: const EdgeInsets.all(8.0),
      //               child: Row(
      //                 children: [
      //                   CircleAvatar(
      //                     radius: 25,
                          
      //                   ),
      //                   SizedBox(width: screenSize.width/30,),
      //                   Column(
      //                     crossAxisAlignment: CrossAxisAlignment.start,
      //                     children: [
      //                       Text('Hello',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),),
      //                       Text('Sinina Sihabudheen',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),),
      //                     ],
      //                   ),
      //                   Spacer()
      //                 ],
      //               ),
      //             ),
      //           ),
      //           GestureDetector(
      //             child: Container(
      //               height: 50,
      //               width: 300,
      //               color: Colors.yellow,
      //               child: const Row(
      //                 children: [
      //                   Icon(Icons.home_rounded,color: Color(0xFF424141),size: 40,),
      //                   Text('Home',style: TextStyle(),)
      //                 ],
      //               ),
      //             ),
      //           )
      //         ],
      //       ),
      //     )
      //   ),
      // ),
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
            )
          ],
        ),
      ),
    );
  }
}
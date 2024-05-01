import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:auto_mates/appbarbottombar/view/widgets/menu_button_widget.dart';
import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({super.key, required this.screenSize,required this.tabIndex});
  final Size screenSize;
  final int tabIndex;
  @override
  Widget build(BuildContext context) {
    return  AppBar( 
      backgroundColor: Colors.white,
      leading: const MenuButtonWidget(),  
      title: Container(
        height: screenSize.height / 21,
        width: screenSize.width / 1.5,
        decoration: const BoxDecoration(
            color: Color(0xFF143A42),            
            borderRadius: BorderRadius.all(Radius.circular(60))),
        child: Row(
          children: [
            SizedBox(
              width: screenSize.width / 50,
            ),
            const Icon(
              Icons.search,
              color: Colors.white,
              size: 25,
            ),
            SizedBox(
              width: screenSize.width / 22,
            ),
            AnimatedTextKit(
              animatedTexts: [
                TypewriterAnimatedText(
                  'Search',
                  textStyle: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  speed: const Duration(milliseconds: 300),
                  cursor: ''
                ),
              ],
              isRepeatingAnimation: true,
              repeatForever: true,              
            )
          ],
        ),
      ),
      actions: [
        Stack(
          children: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.notifications,
                  color: Colors.white,
                  size: 30,
                )),
            const Positioned(
                right: 11,
                top: 14,
                child: CircleAvatar(
                  radius: 6,
                  backgroundColor: Color.fromARGB(255, 0, 112, 248),
                )),
            const Positioned(
                right: 13,
                top: 16,
                child: CircleAvatar(
                  radius: 4,
                  backgroundColor: Colors.green,
                ))
          ],
        )
      ],
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20)),
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              Color.fromARGB(255, 76, 207, 239),
              Color.fromARGB(255, 80, 171, 250)
            ],
          ),
        ),
      ),
      bottom: tabIndex==1?
      const PreferredSize(
        preferredSize: Size.fromHeight(150), 
        child: Padding(
          padding: EdgeInsets.only(bottom: 13),
          child: Text('FIND THE RIGHT USED CAR',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 20),),
        )
      ) : null,
    );
  }
}

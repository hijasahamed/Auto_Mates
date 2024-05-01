import 'package:auto_mates/appbarbottombar/view/widgets/drawer_list_tile_widget.dart';
import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key,required this.screenSize});
  final Size screenSize;
  @override
  Widget build(BuildContext context) {
    return Drawer(
        width: screenSize.width/1.22,
        child: ListView(
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 22, 190, 118)
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
      );
  }
}
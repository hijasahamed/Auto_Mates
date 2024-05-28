import 'package:auto_mates/user/appbarbottombar/view/widgets/app_bar_gradient_color.dart';
import 'package:auto_mates/user/appbarbottombar/view/widgets/menu_button_widget.dart';
import 'package:auto_mates/user/commonwidgets/my_text_widget/my_text_widget.dart';
import 'package:auto_mates/user/search/view/search_page/search_page.dart';
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
      title: Ink(
        height: screenSize.height / 21,
        width: screenSize.width / 1.5,
        decoration: const BoxDecoration(
            color: Color(0xFF143A42),           
            borderRadius: BorderRadius.all(Radius.circular(60))),
        child: InkWell(
          onTap: () {
            Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => SearchPage(screenSize: screenSize,)));
          },
          splashColor: Colors.white10,
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
              const MyTextWidget(text: 'Search', color: Colors.white, size: 16, weight: FontWeight.w400)
            ],
          ),
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
      flexibleSpace: const AppBarGradientColor(),
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

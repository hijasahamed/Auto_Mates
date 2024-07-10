import 'package:auto_mates/user/appbarbottombar/view/widgets/appbar/app_bar_gradient_color.dart';
import 'package:auto_mates/user/appbarbottombar/view/widgets/appbar/menu_button_widget.dart';
import 'package:auto_mates/user/buyscreentab/view/buy_screen/filter_button/filter_button.dart';
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
      backgroundColor: tabIndex==0?const Color(0xFFDBEDF5):Colors.white,
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
            MaterialPageRoute(builder: (context) => SearchPage(screenSize: screenSize,isFromComaprisonScreen: false,)));
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
              const MyTextWidget(text: 'Search', color: Colors.white, size: 16, weight: FontWeight.w500)
            ],
          ),
        ),
      ),
      actions: [
        tabIndex==1?
        FilterButton(screenSize: screenSize)
        : const SizedBox.shrink()
      ],
      flexibleSpace: const AppBarGradientColor(),
      bottom: tabIndex==1?
      const PreferredSize(
        preferredSize: Size.fromHeight(80), 
        child: Padding(
          padding: EdgeInsets.only(bottom: 1),
          child: Text('FIND THE RIGHT USED CAR',style: TextStyle(fontWeight: FontWeight.w700,color: Colors.white,fontSize: 19),), 
        )
      ) : null,
    );
  }
}

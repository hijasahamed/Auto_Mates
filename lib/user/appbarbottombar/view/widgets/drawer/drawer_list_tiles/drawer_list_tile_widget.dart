import 'package:auto_mates/user/appbarbottombar/view/widgets/drawer/about/about_screen.dart';
import 'package:auto_mates/user/appbarbottombar/view/widgets/drawer/privacy_policy/privacy_policy_screen.dart';
import 'package:auto_mates/user/appbarbottombar/view/widgets/drawer/terms_condition/terms_conditions_screen.dart';
import 'package:auto_mates/user/commonwidgets/my_text_widget/my_text_widget.dart';
import 'package:flutter/material.dart';

class DrawerListtileWidget extends StatelessWidget {
  const DrawerListtileWidget({
    super.key,
    required this.leadingIcon,
    required this.title,
    required this.screenSize,
    this.termsAndConditons,
    this.privecyPolicy,
    this.about,
  });
  final IconData leadingIcon;
  final String title;
  final Size screenSize;
  final bool? termsAndConditons;
  final bool? privecyPolicy;
  final bool? about;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        (termsAndConditons==true)
        ? Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return TermsConditionsScreen(screenSize: screenSize,);
        },))
        : (privecyPolicy==true)
        ? Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return PrivacyPolicyScreen(screenSize: screenSize,);
        },))
        : (about==true)
        ? Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return AboutScreen(screenSize: screenSize,);
        },))
        : null;
      },
      leading: Icon(
        leadingIcon,
        size: screenSize.width/13,
        color: Colors.blueGrey,
      ),
      title: MyTextWidget(text: title, color: Colors.blueGrey, size: 15, weight: FontWeight.w600),
    );
  }
}

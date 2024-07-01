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
          return const TermsConditionsScreen();
        },))
        : (privecyPolicy==true)
        ? Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return const PrivacyPolicyScreen();
        },))
        : (about==true)
        ? Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return const AboutScreen();
        },))
        : null;
      },
      leading: Icon(
        leadingIcon,
        size: 26,
      ),
      title: MyTextWidget(text: title, color: const Color(0xFF424141), size: 15, weight: FontWeight.w600),
    );
  }
}

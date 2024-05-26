import 'package:auto_mates/user/commonwidgets/common_widgets/common_widgets.dart';
import 'package:flutter/material.dart';

class DrawerListtileWidget extends StatelessWidget {
  const DrawerListtileWidget({
    super.key,
    required this.leadingIcon,
    required this.title,
    this.onTap,
  });
  final IconData leadingIcon;
  final String title;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        
      },
      leading: Icon(
        leadingIcon,
        size: 26,
      ),
      title: MyTextWidget(text: title, color: const Color(0xFF424141), size: 15, weight: FontWeight.w600),
    );
  }
}

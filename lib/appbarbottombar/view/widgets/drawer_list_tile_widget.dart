import 'package:auto_mates/commonwidgets/my_text_widget.dart';
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
    return Card(      
     elevation: 2,
      shadowColor: const Color(0xFFDBEDF5),
      child: ListTile(
        leading: Icon(
          leadingIcon,
          size: 30,
        ),
        title: MyTextWidget(text: title, color: const Color(0xFF424141), size: 16, weight: FontWeight.w600),
      ),
    );
  }
}

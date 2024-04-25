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
      shadowColor: Color(0xFFDBEDF5),
      child: ListTile(
        leading: Icon(
          leadingIcon,
          size: 35,
        ),
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
      ),
    );
  }
}

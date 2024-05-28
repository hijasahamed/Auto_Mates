import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';

snackbarWidget(String text, context, Color color, Color textColor,SnackBarBehavior behavior) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    elevation: 3,
    dismissDirection: DismissDirection.horizontal,
    duration: const Duration(milliseconds: 2100),
    behavior: behavior,
    backgroundColor: color,
    margin: const EdgeInsets.all(15),
    content: Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(color: textColor, fontWeight: FontWeight.w500),
    ),
  ));
}

awsomeSnackbar({content}){
   SnackBar(
      elevation: 10,
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      content: AwesomeSnackbarContent(
        title: 'Hi There!',
        message:
            content, 
        contentType: ContentType.help,
      ),
    );
}
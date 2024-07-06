import 'package:auto_mates/seller/authentications/model/model.dart';
import 'package:auto_mates/user/buyscreentab/controller/functions.dart';
import 'package:auto_mates/user/chatscreen/view/chat_page/chat_page.dart';
import 'package:auto_mates/user/commonwidgets/my_text_widget/my_text_widget.dart';
import 'package:flutter/material.dart';

class ChatButton extends StatelessWidget {
  const ChatButton({super.key, required this.screenSize,required this.data});
  final Size screenSize;
  final dynamic data;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: const Color(0xFFDBEDF5),
      onTap: () async{
       Navigator.of(context).push(MaterialPageRoute(builder: (context) {
         return ChatPage(sellerData: data,screenSize: screenSize,);
       },));
      },
      child: Ink(
        height: screenSize.height / 20,
        width: screenSize.width / 2.9,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7), color: Colors.blue),
        child:Padding(
          padding: const EdgeInsets.only(left: 35, right: 35),
          child: Row(
            children: [
              const Icon(
                Icons.chat_outlined,
                size: 25,
                color: Colors.white,
              ),
              const Spacer(),
              MyTextWidget(text: 'Chat', color: Colors.white, size: screenSize.width/30, weight: FontWeight.bold)
            ],
          ),
        ),
      ),
    );
  }
}

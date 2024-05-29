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
       
      },
      child: Ink(
        height: screenSize.height / 20,
        width: screenSize.width / 2.9,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7), color: Colors.blue),
        child: const Padding(
          padding: EdgeInsets.only(left: 35, right: 35),
          child: Row(
            children: [
              Icon(
                Icons.chat_outlined,
                size: 25,
                color: Colors.white,
              ),
              Spacer(),
              Text(
                'Chat',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              )
            ],
          ),
        ),
      ),
    );
  }
}

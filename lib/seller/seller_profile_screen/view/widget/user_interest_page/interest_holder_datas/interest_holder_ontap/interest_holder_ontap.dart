// ignore_for_file: use_build_context_synchronously

import 'package:auto_mates/seller/authentications/model/model.dart';
import 'package:auto_mates/seller/seller_appbar_bottombar/controllers/functions.dart';
import 'package:auto_mates/seller/seller_chat_screen/controller/seller_chat_controller.dart';
import 'package:auto_mates/seller/seller_chat_screen/view/seller_chatting_screen/seller_chatting_screen.dart';
import 'package:auto_mates/user/authentications/controller/functions/fuctions.dart';
import 'package:auto_mates/user/buyscreentab/controller/functions.dart';
import 'package:auto_mates/user/commonwidgets/my_text_widget/my_text_widget.dart';
import 'package:flutter/material.dart';

class InterestHolderOntap{
  callAndChatCarInterestedCustomer({context, data, screenSize}) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          title: Container(
            height: screenSize.height / 6,
            width: screenSize.width / 6,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(data['carImage']), fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(10)),
          ),
          content: SizedBox(
            height: screenSize.height / 5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MyTextWidget(
                    text: 'Car model : ${data['carName']}',
                    color: Colors.black,
                    size: 18,
                    weight: FontWeight.bold),
                const Spacer(),
                MyTextWidget(
                  text:
                      '${data['userName']} from ${data['userLocation']} has marked a interest on this car with Registration number ${data['carNumber']}',
                  color: Colors.black,
                  size: 14,
                  weight: FontWeight.bold,
                  maxline: true,
                ),
                const Spacer(),
                const MyTextWidget(
                  text:
                      'To make a deal with this customer contact in the below number',
                  color: Colors.blue,
                  size: 15,
                  weight: FontWeight.bold,
                  maxline: true,
                )
              ],
            ),
          ),
          actions: [
            Column(
              children: [               
                InkWell(
                  onTap: () {
                    makeCall(context: context, mobileNumber: data['userContact']);
                  },
                  child: Ink(
                    height: screenSize.width/8.5,
                    width: screenSize.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(screenSize.width/90),
                      color: Colors.green
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MyTextWidget(
                            text: 'Call',
                            color: Colors.white,
                            size: screenSize.width/28,
                            weight: FontWeight.bold),
                        SizedBox(
                          width: screenSize.width / 50,
                        ),
                        MyTextWidget(
                            text: '+91 ${data['userContact']}',
                            color: Colors.white,
                            size: screenSize.width/28,
                            weight: FontWeight.bold)
                      ],
                    )
                  ),
                ),
                SizedBox(height: screenSize.height/100,),
                InkWell(
                  onTap: () async {
                    UserData? userdata = await getUserDetailsById(data['userId']);
                    SellerData? sellerdata = await fetchSellerDetails();
                    Navigator.push(context, MaterialPageRoute(builder: (context) {                      
                      return SellerChattingScreen(screenSize: screenSize, userdata: userdata!, currentSeller: sellerdata!);
                    },)); 
                  },
                  child: Ink(
                    height: screenSize.width/8.5,
                    width: screenSize.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(screenSize.width/90),
                      color: Colors.blueGrey
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MyTextWidget(
                            text: 'Chat with',
                            color: Colors.white,
                            size: screenSize.width/28,
                            weight: FontWeight.bold),
                        SizedBox(
                          width: screenSize.width / 100,
                        ),
                        MyTextWidget(
                            text: '${data['userName']}',
                            color: Colors.white,
                            size: screenSize.width/28,
                            weight: FontWeight.bold)
                      ],
                    )
                  ),
                )
              ],
            )
          ],
        );
      },
    );
  }
}
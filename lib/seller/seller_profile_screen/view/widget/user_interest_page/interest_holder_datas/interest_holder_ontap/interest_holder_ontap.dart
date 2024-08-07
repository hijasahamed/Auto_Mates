// ignore_for_file: use_build_context_synchronously
import 'package:auto_mates/user/buyscreentab/controller/functions.dart';
import 'package:auto_mates/user/commonwidgets/my_text_widget/my_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

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
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MyTextWidget(
                    text: '${data['CarBrand']} ${data['carName']}',
                    color: Colors.black,
                    size: 18,
                    weight: FontWeight.bold),
                MyTextWidget(
                  text:
                      '${data['userName']} from ${data['userLocation']} has marked a interest on this car with Registration number ${data['carNumber']}',
                  color: const Color.fromARGB(255, 79, 79, 79),
                  size: 14,
                  weight: FontWeight.w600,
                  maxline: true,
                ),
                SizedBox(height: screenSize.height/100,),
                const MyTextWidget(
                  text:'To make a deal with this customer contact in the below number',
                  color: Color.fromARGB(255, 79, 79, 79),
                  size: 15,
                  weight: FontWeight.w600,
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
                        const FaIcon(FontAwesomeIcons.phone,color: Colors.white,),
                        SizedBox(
                          width: screenSize.width / 100,
                        ),
                        MyTextWidget(
                            text: 'Call ${data['userName']}',
                            color: Colors.white,
                            size: screenSize.width/28,
                            weight: FontWeight.bold),
                      ],
                    )
                  ),
                ),
                SizedBox(height: screenSize.height/100,),
                InkWell(
                  onTap: () async {                                        
                    String phoneNumber = data['userContact'];
                    String message = 'Hello ${data['userName']}✋. We have received the interest for ${data['CarBrand']} ${data['carName']} with RegNo. ${data['carNumber']}.';
                    await launchWhatsApp(phoneNumber: phoneNumber, message: message);
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
                        const FaIcon(FontAwesomeIcons.whatsapp,color: Colors.white,),
                        SizedBox(
                          width: screenSize.width / 100,
                        ),
                        MyTextWidget(
                            text: 'WhatsApp ${data['userName']}',
                            color: Colors.white,
                            size: screenSize.width/28,
                            weight: FontWeight.bold),
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

Future<void> launchWhatsApp({required String phoneNumber, required String message}) async {
    final Uri whatsappUrl = Uri.parse("https://wa.me/$phoneNumber?text=${Uri.encodeComponent(message)}");
    if (await canLaunchUrl(whatsappUrl)) {
      await launchUrl(whatsappUrl);
    } else {
      throw 'Could not launch $whatsappUrl';
    }
}
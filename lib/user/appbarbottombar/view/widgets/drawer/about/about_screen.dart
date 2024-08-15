import 'package:auto_mates/user/appbarbottombar/view/widgets/normal_app_bar/normal_app_bar.dart';
import 'package:auto_mates/user/commonwidgets/my_text_widget/my_text_widget.dart';
import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key, required this.screenSize});
  final Size screenSize;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: const PreferredSize(
            preferredSize: Size.fromHeight(50),
            child: NormalAppBar(title: 'About')),
        body: Padding(
          padding: EdgeInsets.all(screenSize.width / 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyTextWidget(
                  text: 'About AutoMates',
                  color: Colors.blueGrey,
                  size: screenSize.width / 25,
                  weight: FontWeight.w400),
              MyTextWidget(
                  text:
                      '''\nWelcome to AutoMAtes, your trusted platform for buying and selling cars. Our mission is to provide a seamless and secure experience for car enthusiasts, buyers, and sellers alike. Whether you're looking to purchase your dream car or sell your vehicle to a new owner, AutoMates offers a user-friendly interface and a wide range of listings to meet your needs.''',
                  color: Colors.blueGrey,
                  maxline: true,
                  size: screenSize.width / 30,
                  weight: FontWeight.w300),
              MyTextWidget(
                  text:
                      '''Our Values:\n\nTransparency: We believe in clear communication and honest transactions.\nSecurity: Your safety is our priority. We implement robust security measures to protect your data.\nCommunity: We aim to build a community of car lovers who can share their passion for vehicles.''',
                  color: Colors.blueGrey,
                  maxline: true,
                  size: screenSize.width / 30,
                  weight: FontWeight.w300),
              MyTextWidget(
                  text:
                      '''\nOur Story:\nFounded in 2024, AutoMates was created to simplify the car buying and selling process. We recognized the need for a platform that offers a wide selection of vehicles while ensuring a secure and enjoyable experience for users.''',
                  color: Colors.blueGrey,
                  maxline: true,
                  size: screenSize.width / 30,
                  weight: FontWeight.w300),
              MyTextWidget(
                  text:
                      '''\nJoin Us:\nBecome part of our growing community today and explore the exciting world of cars with AutoMates. Whether you're a buyer or a seller, we're here to help you every step of the way.''',
                  color: Colors.blueGrey,
                  maxline: true,
                  size: screenSize.width / 30,
                  weight: FontWeight.w300),
            ],
          ),
        ));
  }
}

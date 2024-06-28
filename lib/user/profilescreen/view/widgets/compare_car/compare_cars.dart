import 'package:auto_mates/user/appbarbottombar/view/widgets/normal_app_bar/normal_app_bar.dart';
import 'package:auto_mates/user/commonwidgets/my_text_widget/my_text_widget.dart';
import 'package:flutter/material.dart';

class CompareCars extends StatelessWidget {
  const CompareCars({super.key, required this.screenSize});
  final Size screenSize;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: NormalAppBar(title: 'Compare Cars')),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: MyTextWidget(
                text: 'Select the car varient you want to compare',
                color: Colors.blueGrey,
                size: screenSize.width / 25,
                weight: FontWeight.bold),
          ),
          Container(
            height: screenSize.height/3.9,
            decoration: const BoxDecoration(
              border: Border(bottom: BorderSide(color: Color.fromARGB(255, 219, 219, 219)),top: BorderSide(color: Color.fromARGB(255, 219, 219, 219))),
            ),
            child: Stack(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const CircleAvatar(
                            backgroundColor: Color.fromARGB(255, 208, 253, 210),
                            child: Icon(Icons.compare_arrows),
                          ),
                          MyTextWidget(text: 'Select car', color: Colors.grey, size: screenSize.width/36, weight: FontWeight.bold)
                        ],
                      )
                    ),
                    Expanded(
                      child: Container(
                        decoration: const BoxDecoration(
                          border: Border(left: BorderSide(color: Color.fromARGB(255, 219, 219, 219))),
                        ),
                      )
                    ),
                  ],
                ),
                Align(
                  alignment: Alignment.center,
                  child: CircleAvatar(
                      radius: 17,
                      backgroundColor: Colors.blueGrey,
                      child: CircleAvatar(
                        radius: 16,
                        backgroundColor: Colors.white,
                        child: MyTextWidget(text: 'V/S', color: Colors.red, size: screenSize.width/36, weight: FontWeight.bold)
                      ),
                    ),
                )
              ],
            )
          )
        ],
      ),
    );
  }
}

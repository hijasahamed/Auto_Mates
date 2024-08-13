import 'package:auto_mates/user/commonwidgets/custom_alertdialog/custom_alert_dialog.dart';
import 'package:auto_mates/user/commonwidgets/my_text_widget/my_text_widget.dart';
import 'package:flutter/material.dart';

class SoldCarHolder extends StatelessWidget {
  const SoldCarHolder({super.key,required this.screenSize,required this.car});
  final Size screenSize;
  final dynamic car;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color.fromARGB(255, 241, 241, 241),
      elevation: 5,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(            
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(screenSize.width/50),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(screenSize.width/100), 
                  child: FadeInImage(
                      fadeInDuration: const Duration(milliseconds: 800),
                      height: screenSize.height / 9,
                      width: screenSize.width / 3.2,
                      placeholder: const AssetImage(
                        'assets/images/image placeholder.jpeg',
                      ),
                      placeholderFit: BoxFit.cover,
                      imageErrorBuilder: (context, error, stackTrace) {
                        return const Center(
                          child: CircularProgressIndicator(
                            color: Colors.blue,
                          ),
                        );
                      },
                      image: NetworkImage(car['thumbnail']),
                      fit: BoxFit.cover,
                      filterQuality: FilterQuality.high),
                ),
              ),
              SizedBox(
                child: Padding(
                  padding: EdgeInsets.only(top: screenSize.width/100),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          MyTextWidget(text: car['brand'], color: Colors.blueGrey, size: screenSize.width/23, weight: FontWeight.w500),
                          SizedBox(width: screenSize.width/90,),
                          MyTextWidget(text: car['modelName'], color: Colors.blueGrey, size: screenSize.width/25, weight: FontWeight.w500),
                        ],
                      ),
                      MyTextWidget(text: car['regNumber'], color: Colors.blueGrey, size: screenSize.width/30, weight: FontWeight.bold),
                      MyTextWidget(text: 'Bought Price: ₹${car['boughtPrice']} Lakh', color: Colors.blueGrey, size: screenSize.width/35, weight: FontWeight.bold),
                      MyTextWidget(text: 'Customer Price: ₹${car['price']} Lakh', color: Colors.blueGrey, size: screenSize.width/35, weight: FontWeight.bold),
                      Row(
                        children: [
                          MyTextWidget(text: 'Sold For: ₹${car['soldAmount']}', color: Colors.green, size: screenSize.width/25, weight: FontWeight.bold),
                          MyTextWidget(text: ' Lakh', color: Colors.green, size: screenSize.width/25, weight: FontWeight.bold),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const Spacer(),
              IconButton(
                onPressed: () {
                  showDialog(
                    barrierDismissible: false,
                    context: context, 
                    builder: (context) => CustomAlertDialog(
                      image: 'assets/images/bin.png',
                      title: 'Remove the sold car',
                      subtitle: 'Do you want to remove the sold car',
                      screenSize: screenSize,
                      soldCardata: car,
                      isSoldcarRemoving: true,          
                    ),
                  );              
                }, 
                icon: const Icon(Icons.close)
              )
            ],
          ),
        ],
      ),
    );
  }
}
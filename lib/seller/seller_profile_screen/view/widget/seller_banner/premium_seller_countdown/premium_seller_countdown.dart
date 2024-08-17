import 'package:auto_mates/seller/authentications/model/model.dart';
import 'package:auto_mates/seller/seller_homescreen/view/widgets/premium_bottomsheet/premium_bottomsheet.dart';
import 'package:auto_mates/seller/seller_profile_screen/view/widget/seller_banner/premium_seller_countdown/premium_plan_counter/premium_plan_counter.dart';
import 'package:auto_mates/user/commonwidgets/my_text_widget/my_text_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class PremiumSellerCountdown extends StatelessWidget {
  const PremiumSellerCountdown({super.key,required this.screenSize,required this.data});
  final Size screenSize;
  final SellerData data;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DocumentSnapshot>(
      stream: FirebaseFirestore.instance
          .collection('sellerSignupData')
          .doc(data.id)
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const SizedBox.shrink();
        }
        if (snapshot.hasError) {
          return const SizedBox.shrink();
        }
        if (!snapshot.hasData || !snapshot.data!.exists) {
          return const SizedBox.shrink();
        }        
        var plan = snapshot.data!['plan'];
        if (plan == 'subscribed') {
          var endTime = (snapshot.data!['planEndDate'] as Timestamp).toDate();
          return IsPremium(screenSize: screenSize, endTime: endTime,sellerId: data.id,);
        } else {
          return IsFree(screenSize: screenSize,sellerId: data.id,sellerData: data,);
        }
      },
    );
  }
}

class IsFree extends StatelessWidget {
  const IsFree({
    super.key,
    required this.screenSize,
    required this.sellerId,
    required this.sellerData
  });

  final Size screenSize;
  final String sellerId;
  final SellerData sellerData;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(screenSize.width/80),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyTextWidget(text: 'Current Plan', color: Colors.blueGrey, size: screenSize.width/25, weight: FontWeight.bold),
          MyTextWidget(text: 'You are now using the FREE PLAN. Unlock the PREMIUM PLAN for more exciting features', color: const Color.fromARGB(255, 76, 76, 76), size: screenSize.width/30, weight: FontWeight.w500,maxline: true,),
          SizedBox(height: screenSize.height/120,),
          InkWell(
            onTap: () {
              showBottomSheetForPremium(context: context,screenSize: screenSize,sellerId: sellerId,sellerData: sellerData);
            },
            child: Ink(
              height: screenSize.height/20,
              width: screenSize.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(screenSize.width/100),
                border: Border.all(width: .2,color: Colors.grey),
                color: Colors.green
              ),
              child: Center(
                child: MyTextWidget(text: 'Get Premium For ₹3999 /- per year', color: Colors.white, size: screenSize.width/25, weight: FontWeight.bold),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class IsPremium extends StatelessWidget {

  const IsPremium({
    super.key,
    required this.screenSize,
    required this.endTime,
    required this.sellerId
  });

  final Size screenSize;
  final DateTime endTime;
  final String sellerId;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(screenSize.width/100),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyTextWidget(text: 'Current Plan', color: Colors.blueGrey, size: screenSize.width/25, weight: FontWeight.bold),
          MyTextWidget(text: 'You are now using the PREMIUM PLAN. Enjoy the exciting features from AutoMates', color: const Color.fromARGB(255, 76, 76, 76), size: screenSize.width/30, weight: FontWeight.w500,maxline: true,),
          SizedBox(height: screenSize.height/150,),
          Row(
            children: [
              MyTextWidget(text: 'PREMIUM', color: Colors.green, size: screenSize.width/25, weight: FontWeight.bold),
              SizedBox(width: screenSize.width/100,),
              PremiumPlanCounter(screenSize: screenSize,endTime: endTime,sellerId: sellerId,),
            ],
          ),
        ],
      ),
    );
  }
}
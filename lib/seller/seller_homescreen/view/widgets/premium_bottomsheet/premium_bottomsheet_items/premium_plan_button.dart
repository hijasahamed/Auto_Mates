// ignore_for_file: use_build_context_synchronously

import 'package:auto_mates/seller/authentications/model/model.dart';
import 'package:auto_mates/seller/seller_homescreen/controller/functions.dart';
import 'package:auto_mates/seller/seller_homescreen/controller/payments_services.dart';
import 'package:auto_mates/seller/seller_homescreen/view/bloc/seller_home_screen_bloc.dart';
import 'package:auto_mates/seller/seller_homescreen/view/widgets/single_car_details/feature_the_car/payment_success_page/payment_success_page.dart';
import 'package:auto_mates/user/commonwidgets/my_text_widget/my_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PremiumPlanButton extends StatelessWidget {
  const PremiumPlanButton(
      {super.key,
      required this.screenSize,
      required this.sellerId,
      required this.sellerData,
      required this.subscriptionBlocInstance});
  final Size screenSize;
  final String sellerId;
  final SellerData sellerData;
  final SellerHomeScreenBloc subscriptionBlocInstance;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        UnlockExcitingFeaturesText(screenSize: screenSize),
        PremiumButton(
            subscriptionBlocInstance: subscriptionBlocInstance,
            sellerId: sellerId,
            sellerData: sellerData,
            screenSize: screenSize),
      ],
    );
  }
}

class PremiumButton extends StatelessWidget {
  const PremiumButton({
    super.key,
    required this.subscriptionBlocInstance,
    required this.screenSize,
    required this.sellerId,
    required this.sellerData
  });

  final SellerHomeScreenBloc subscriptionBlocInstance;
  final Size screenSize;
  final String sellerId;
  final SellerData sellerData;
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () async {
          subscriptionBlocInstance
              .add(SubscriptionPremiumPaymentLoadingEvent());
          dynamic pay = await StripePaymentService.instance
              .makePayment(amountToPay: 3999)
              .then((value) => value == true ? true : false);
          pay == true
              ? {
                  paymentSuccessPage(
                      context: context,
                      paidAmount: 3999,
                      screenSize: screenSize,
                      title: 'Subscription Plan Activated'),
                  addRevenueData(amount: 3999, paidBy: sellerData.companyName, paidFor: 'Seller Premium Subscription'),
                  changeSellerPlan(sellerId: sellerId,context: context),
                  await Future.delayed(const Duration(seconds: 3)),
                  Navigator.of(context).pop(),
                  subscriptionBlocInstance.add(SellerSubscribedEvent()),
                  await Future.delayed(const Duration(seconds: 4)),
                  Navigator.of(context).pop(),
                }
              : {
                  Navigator.of(context).pop(),
                };
        },
        borderRadius: BorderRadius.circular(screenSize.width / 25),
        child: Ink(
          height: screenSize.height / 18,
          width: screenSize.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(screenSize.width / 25),
            color: Colors.green,
          ),
          child: PremiumButtonChangingText(subscriptionBlocInstance: subscriptionBlocInstance, screenSize: screenSize),
        ),
      ),
    );
  }
}

class PremiumButtonChangingText extends StatelessWidget {
  const PremiumButtonChangingText({
    super.key,
    required this.subscriptionBlocInstance,
    required this.screenSize,
  });

  final SellerHomeScreenBloc subscriptionBlocInstance;
  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BlocBuilder<SellerHomeScreenBloc, SellerHomeScreenState>(
        bloc: subscriptionBlocInstance,
        builder: (context, state) {
          if (state is SubscriptionPremiumPaymentLoadingState) {
            return SizedBox(
                height: screenSize.width / 15,
                width: screenSize.width / 15,
                child: const CircularProgressIndicator(
                  color: Colors.white,
                ));
          } else if (state is SellerSubscribedState) {
            return FutureBuilder(
              future: Future.delayed(const Duration(seconds: 2)),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MyTextWidget(
                        text: 'Subscribing',
                        color: Colors.white,
                        size: screenSize.width / 25,
                        weight: FontWeight.w500,
                      ),
                      SizedBox(width: screenSize.width / 40),
                      SizedBox(
                          height: screenSize.width / 20,
                          width: screenSize.width / 20,
                          child: const CircularProgressIndicator(
                            color: Colors.white,
                          ))
                    ],
                  );
                } else {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MyTextWidget(
                        text: 'Subscribed',
                        color: Colors.white,
                        size: screenSize.width / 25,
                        weight: FontWeight.w500,
                      ),
                      SizedBox(width: screenSize.width / 40),
                      const Icon(
                        Icons.check_circle,
                        color: Colors.white,
                        size: 24,
                      ),
                    ],
                  );
                }
              },
            );
          }
          return MyTextWidget(
              text: 'Get Premium with ₹3999 per year',
              color: Colors.white,
              size: screenSize.width / 25,
              weight: FontWeight.w500);
        },
      ),
    );
  }
}

class UnlockExcitingFeaturesText extends StatelessWidget {
  const UnlockExcitingFeaturesText({
    super.key,
    required this.screenSize,
  });

  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return MyTextWidget(
        text: 'Unlock Exciting Features',
        color: Colors.blueGrey,
        size: screenSize.width / 35,
        weight: FontWeight.bold);
  }
}

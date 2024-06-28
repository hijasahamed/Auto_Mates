import 'package:auto_mates/seller/seller_profile_screen/controllers/functions.dart';
import 'package:auto_mates/user/commonwidgets/my_text_widget/my_text_widget.dart';
import 'package:flutter/material.dart';

class SoldCarsBottomNavBar extends StatelessWidget {
  const SoldCarsBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<int>(
      future: getTotalSalesAmount(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return BottomAppBar(
            color: Colors.white,
            child: Container(
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.green,
              ),
              child: const Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              ),
            ),
          );
        } else if (snapshot.hasError) {
          return BottomAppBar(
            color: Colors.white,
            child: Container(
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.green,
              ),
              child: const Center(
                child: MyTextWidget(text: 'Something went wrong', color: Colors.white, size: 16, weight: FontWeight.bold),
              ),
            ),
          );
        } else {
          int totalSalesAmount = snapshot.data ?? 0;
          return BottomAppBar(
            color: Colors.white,
            child: Container(
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.green,
              ),
              child: Center(
                child: MyTextWidget(
                  text: 'Total Sales: ₹$totalSalesAmount',
                  color: Colors.white,
                  size: 16,
                  weight: FontWeight.bold,
                ),
              ),
            ),
          );
        }
      },
    );
  }
  }
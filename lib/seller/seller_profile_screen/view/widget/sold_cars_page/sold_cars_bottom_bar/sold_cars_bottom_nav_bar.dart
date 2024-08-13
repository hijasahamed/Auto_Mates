import 'package:auto_mates/seller/seller_profile_screen/controllers/functions.dart';
import 'package:auto_mates/user/commonwidgets/my_text_widget/my_text_widget.dart';
import 'package:flutter/material.dart';

class SoldCarsBottomNavBar extends StatelessWidget {
  const SoldCarsBottomNavBar({super.key,required this.screenSize});
  final Size screenSize;
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.white,
      child: InkWell(
        onTap: () {
          
        },
        child: Ink(
          height: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.green,
          ),
          child: Center(
            child: StreamBuilder<int>(
              stream: getTotalSalesAmountStream(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  );
                } else if (snapshot.hasError) {
                  return const MyTextWidget(
                    text: 'Something went wrong',
                    color: Colors.white,
                    size: 16,
                    weight: FontWeight.bold,
                  );
                } else {
                  int totalSalesAmount = snapshot.data ?? 0;
                  return MyTextWidget(
                    text: 'Total Sales: ₹$totalSalesAmount',
                    color: Colors.white,
                    size: 16,
                    weight: FontWeight.bold,
                  );
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}

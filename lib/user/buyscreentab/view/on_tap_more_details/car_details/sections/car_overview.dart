import 'package:auto_mates/user/commonwidgets/my_text_widget/my_text_widget.dart';
import 'package:flutter/material.dart';

class CarOverview extends StatelessWidget {
  const CarOverview({super.key, required this.data});
  final dynamic data;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
      color: Colors.white,
        borderRadius: BorderRadius.circular(5)
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 10,bottom: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const MyTextWidget(
                text: 'Overview',
                color: Color(0xFF424141),
                size: 18,
                weight: FontWeight.w700),
            Text(
              data['overview'],
              style: const TextStyle(
                  color: Color.fromARGB(255, 118, 118, 118),
                  fontSize: 15,
                  fontWeight: FontWeight.w500),
            )
          ],
        ),
      ),
    );
  }
}

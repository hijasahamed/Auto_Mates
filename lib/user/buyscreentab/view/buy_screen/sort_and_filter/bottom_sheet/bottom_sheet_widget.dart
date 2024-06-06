import 'package:auto_mates/user/commonwidgets/my_text_widget/my_text_widget.dart';
import 'package:flutter/material.dart';

bottomSheetWidget({context, screenSize}) {
  showModalBottomSheet(
    barrierColor: Colors.black45,
    backgroundColor: Colors.transparent,
    elevation: 5,
    isDismissible: true,
    context: context,
    builder: (context) {
      final PageController controller = PageController(initialPage: 0);
      return LayoutBuilder(
        builder: (context, constraints) {
          return Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30), topRight: Radius.circular(30)),
              color: Colors.white,
            ),
            child: PageView(
              controller: controller,
              children: [
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: SizedBox(
                    height: screenSize.height/2,
                    width: screenSize.width / 2,
                    child: const Column(
                      children: [
                        MyTextWidget(text: 'Select the car brand', color: Colors.black, size: 15, weight: FontWeight.w500)
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Container(
                    height: screenSize.height/3,
                    width: screenSize.width / 2,
                    color: Colors.green,
                  ),
                ),
              ],
            ),
          );
        },
      );
    },
  );
}

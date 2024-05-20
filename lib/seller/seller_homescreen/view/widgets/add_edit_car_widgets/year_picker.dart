import 'package:auto_mates/user/commonwidgets/common_widgets.dart';
import 'package:flutter/material.dart';

Future<void> selectYear(BuildContext context,controller,screenSize) async {
    final int? selectedYear = await showDialog<int>(
      context: context,
      builder: (BuildContext context) {
        int tempSelectedYear = DateTime.now().year;
        return AlertDialog(
          title: const MyTextWidget(text: 'Select Year', color: Colors.black, size: 20, weight: FontWeight.bold),
          content: SizedBox(
            width: screenSize.width/2,
            height: screenSize.height/4.5,
            child: YearPicker(
              firstDate: DateTime(1950),
              lastDate: DateTime.now(),
              selectedDate: DateTime(tempSelectedYear),
              onChanged: (DateTime dateTime) {
                Navigator.pop(context, dateTime.year);
              },
            ),
          ),
        );
      },
    );

    if (selectedYear != null) {
      controller.text = selectedYear.toString();
    }
  }
import 'package:auto_mates/user/commonwidgets/my_text_widget/my_text_widget.dart';
import 'package:flutter/material.dart';

class SortingFilteringWidget extends StatelessWidget {
  const SortingFilteringWidget({super.key,required this.screenSize});
  final Size screenSize;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: screenSize.height/20,
      width: screenSize.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              IconButton(
                onPressed: (){}, 
                icon: const Icon(Icons.sort,color: Color.fromARGB(255, 32, 32, 32),)
              ),
              const MyTextWidget(text: 'Last Added', color: Color(0xFF424141),size: 15,weight: FontWeight.w600,)
            ],
          ),
        ],
      ),
    );
  }
}



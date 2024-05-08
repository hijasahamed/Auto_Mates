import 'package:auto_mates/user/commonwidgets/common_widgets.dart';
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
        children: [
          Row(
            children: [
              IconButton(
                onPressed: (){}, 
                icon: const Icon(Icons.sort,color: Color(0xFF424141),)
              ),
              const MyTextWidget(text: 'Last Added', color: Color(0xFF424141),size: 15,weight: FontWeight.w600,)
            ],
          ),
        ],
      ),
    );
  }
}



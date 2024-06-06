import 'package:auto_mates/user/buyscreentab/view/buy_screen/sort_and_filter/bottom_sheet/bottom_sheet_widget.dart';
import 'package:flutter/material.dart';

class SortingFilteringButton extends StatelessWidget {
  const SortingFilteringButton({super.key,required this.screenSize});
  final Size screenSize;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: (){
        bottomSheetWidget(context: context,screenSize: screenSize);
      }, 
      icon: const Icon(Icons.sort,color: Colors.white,size: 35,)
    );
  }
}



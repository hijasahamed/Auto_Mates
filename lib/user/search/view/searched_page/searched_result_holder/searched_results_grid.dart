import 'package:auto_mates/user/buyscreentab/view/on_tap_more_details/on_tap_car_more_details.dart';
import 'package:auto_mates/user/search/view/searched_page/searched_result_holder/searched_result_holder.dart';
import 'package:flutter/material.dart';

class SearchedResultsGrid extends StatelessWidget {
  const SearchedResultsGrid({super.key,required this.screenSize,required this.dataList});
  final Size screenSize;
  final dynamic dataList;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
        shrinkWrap: true,
        itemCount: dataList.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 3,
          crossAxisSpacing: 3,
          childAspectRatio: 1.05,
        ),
        itemBuilder: (context, index) {
          final data = dataList[index];
          return GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) {
                    return OnTapCarMoreDetailsCarScreen(
                      screenSize: screenSize,
                      data: data,
                    );
                  },
                ));
              },
              child: SearchedResultHolder(
                screenSize: screenSize,
                data: data,
              ));
        },
      ),
    );
  }
}

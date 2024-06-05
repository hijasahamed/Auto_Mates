import 'package:auto_mates/user/commonwidgets/no_data_error_placeholder/no_data_error_placeholder.dart';
import 'package:auto_mates/user/commonwidgets/shimmer_effect/shimmer_effect.dart';
import 'package:auto_mates/user/search/controllers/functions.dart';
import 'package:auto_mates/user/search/view/searched_page/searched_result_holder/searched_results_grid.dart';
import 'package:flutter/material.dart';

class RecommentedSearchList extends StatelessWidget {
  const RecommentedSearchList({super.key, required this.screenSize});
  final Size screenSize;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getSearchingCars(query: ''),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return SkelotonIndicatorGrid(screenSize: screenSize,);
        } else if (snapshot.hasError || !snapshot.hasData) {
          return const Center(
            child: Text('Something Went Wrong'),
          );
        }
        final results = snapshot.data ?? [];
        if (results.isEmpty) {
          return NoDataErrorPlaceholder(
              screenSize: screenSize, titleText: 'No Data Available');
        }
        return SearchedResultsGrid(screenSize: screenSize,dataList: results,); 
      },
    );
  }
}

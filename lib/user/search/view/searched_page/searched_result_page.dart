import 'package:auto_mates/user/commonwidgets/circular_indicator/circular_indicator_widget.dart';
import 'package:auto_mates/user/commonwidgets/no_data_error_placeholder/no_data_error_placeholder.dart';
import 'package:auto_mates/user/profilescreen/view/bloc/profile_screen_bloc.dart';
import 'package:auto_mates/user/search/controllers/functions.dart';
import 'package:auto_mates/user/search/view/bloc/search_bloc.dart';
import 'package:auto_mates/user/search/view/searched_page/searched_result_holder/searched_results_grid.dart';
import 'package:flutter/material.dart';

class SearchedResultPage extends StatelessWidget {
  const SearchedResultPage({super.key, required this.screenSize, required this.searchnotifier,this.isFromComaprisonScreen,this.carSelectionScreen,required this.searchBlocObj});
  final Size screenSize;
  final bool? isFromComaprisonScreen;
  final ProfileScreenBloc? carSelectionScreen;
  final ValueNotifier<TextEditingController> searchnotifier;
  final SearchBloc searchBlocObj;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<TextEditingController>(
      valueListenable: searchnotifier,
      builder: (context, controller, _) {
        return FutureBuilder<List<Map<String, dynamic>>>(
          future: getSearchingCars(query: controller.text.trim()),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularIndicatorWidget();
            } else if (snapshot.hasError || !snapshot.hasData) {
              return const Center(
                child: Text('Something Went Wrong'),
              );
            }
            final results = snapshot.data ?? [];
            if (results.isEmpty) {
              return NoDataErrorPlaceholder(screenSize: screenSize, titleText: 'No Data Available');
            }
            final queryText = controller.text.trim().toLowerCase();
            final filteredData = results
            .where((data) {
              final modelName = data['modelName'].toString().toLowerCase();
              final brand = data['brand'].toString().toLowerCase();
              return modelName.contains(queryText) || brand.contains(queryText);
            })
            .toList();
            if(filteredData.isEmpty){
              return NoDataErrorPlaceholder(screenSize: screenSize, titleText: 'Searched data not available');
            }
            return SearchedResultsGrid(screenSize: screenSize,dataList: filteredData,carSelectionScreen: carSelectionScreen,isFromComaprisonScreen: isFromComaprisonScreen,searchBlocObj: searchBlocObj,);
          },
        );
      },
    );
  }
}

import 'package:auto_mates/user/buyscreentab/view/buy_screen/on_tap_more_details/on_tap_car_more_details.dart';
import 'package:auto_mates/user/profilescreen/controller/functions.dart';
import 'package:auto_mates/user/profilescreen/view/bloc/profile_screen_bloc.dart';
import 'package:auto_mates/user/search/view/bloc/search_bloc.dart';
import 'package:auto_mates/user/search/view/searched_page/searched_result_holder/searched_result_holder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchedResultsGrid extends StatelessWidget {
  const SearchedResultsGrid(
      {super.key,
      required this.screenSize,
      required this.dataList,
      this.isFromComaprisonScreen,
      required this.searchBlocObj,
      this.carSelectionScreen});
  final Size screenSize;
  final dynamic dataList;
  final bool? isFromComaprisonScreen;
  final ProfileScreenBloc? carSelectionScreen;
  final SearchBloc searchBlocObj;
  @override
  Widget build(BuildContext context) {
    // SearchBloc searchBlocObj = SearchBloc();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: BlocBuilder<SearchBloc, SearchState>(
        bloc: searchBlocObj,
        builder: (context, state) {
          return GridView.builder(
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
                    (isFromComaprisonScreen == false)
                        ? Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) {
                              return OnTapCarMoreDetailsCarScreen(
                                screenSize: screenSize,
                                data: data,
                                isFromSearch: true,
                              );
                            },
                          ))
                        : addCarToComparingList(
                            car: data,
                            context: context,
                            carSelectionScreen: carSelectionScreen,
                            searchBlocObj: searchBlocObj
                          );
                  },
                  child: SearchedResultHolder(
                    screenSize: screenSize,
                    data: data,
                    carSelectionScreen: carSelectionScreen,
                  ));
            },
          );
        },
      ),
    );
  }
}

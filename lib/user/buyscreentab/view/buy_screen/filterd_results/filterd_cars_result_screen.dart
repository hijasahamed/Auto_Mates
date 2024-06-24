import 'package:auto_mates/user/appbarbottombar/view/widgets/normal_app_bar/normal_app_bar.dart';
import 'package:auto_mates/user/buyscreentab/view/bloc/buy_screen_bloc.dart';
import 'package:auto_mates/user/buyscreentab/view/buy_screen/filterd_results/filterd_cars_dropdown_details/filterd_details_dropdown_details.dart';
import 'package:auto_mates/user/buyscreentab/view/buy_screen/filterd_results/filterd_cars_image_name_holder/filterd_cars_image_name_holder.dart';
import 'package:auto_mates/user/commonwidgets/no_data_error_placeholder/no_data_error_placeholder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FilterResultsScreen extends StatelessWidget {
  const FilterResultsScreen(
      {super.key, required this.filterdCarList, required this.screenSize});
  final List<Map<String, dynamic>> filterdCarList;
  final Size screenSize;
  @override
  Widget build(BuildContext context) {
    bool isDropdownVisible = false;
    int? indexofButton;
    BuyScreenBloc dropdownblocInstance = BuyScreenBloc();
    return BlocConsumer<BuyScreenBloc, BuyScreenState>(
      bloc: dropdownblocInstance,
      listener: (context, state) {
        if (state is FilterdCarDropdownButtonRefreshState) {
          isDropdownVisible = state.isDropdownVisible;
          indexofButton = state.index;
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: PreferredSize(
              preferredSize: const Size.fromHeight(50),
              child: NormalAppBar(
                title: '${filterdCarList.length} Cars',
                isFromFilterResultPage: true,
              )),
          body: filterdCarList.isEmpty
              ? Scaffold(
                  body: NoDataErrorPlaceholder(
                      screenSize: screenSize, titleText: 'No cars found'))
              : ListView.builder(
                  itemCount: filterdCarList.length,
                  itemBuilder: (context, index) {
                    final car = filterdCarList[index];
                    return Padding(
                      padding: const EdgeInsets.all(6),
                      child: Card(
                        elevation: 5,
                        color: const Color.fromARGB(255, 246, 246, 246),
                        child: Column(
                          children: [
                            FilterdCarsImageNameHolder(
                                screenSize: screenSize,
                                car: car,
                                dropdownblocInstance: dropdownblocInstance,
                                isDropdownVisible: isDropdownVisible,
                                index: index),
                            if (isDropdownVisible == true &&
                                indexofButton == index)
                              FilterdDetailsDropdownDetails(
                                  screenSize: screenSize,
                                  car: car,
                                  dropdownblocInstance: dropdownblocInstance,
                                  isDropdownVisible: isDropdownVisible,
                                  index: index)
                          ],
                        ),
                      ),
                    );
                  },
                ),
        );
      },
    );
  }
}

import 'package:auto_mates/user/appbarbottombar/view/widgets/normal_app_bar/normal_app_bar.dart';
import 'package:auto_mates/user/buyscreentab/view/bloc/buy_screen_bloc.dart';
import 'package:auto_mates/user/commonwidgets/my_text_widget/my_text_widget.dart';
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
          indexofButton=state.index;
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
                            Container(
                              height: screenSize.height / 8,
                              width: screenSize.width,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    width: screenSize.width / 2.7,
                                    decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(5),
                                        ),
                                        image: DecorationImage(
                                            image:
                                                NetworkImage(car['thumbnail']),
                                            fit: BoxFit.cover)),
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      MyTextWidget(
                                          text: car['brand'],
                                          color: Colors.grey,
                                          size: 13,
                                          weight: FontWeight.bold),
                                      MyTextWidget(
                                          text: car['modelName'],
                                          color: const Color(0xff424141),
                                          size: 15,
                                          weight: FontWeight.bold),
                                    ],
                                  ),
                                  IconButton(
                                      onPressed: () {
                                        dropdownblocInstance.add(
                                          FilterdCarDropdownButtonRefreshEvent(isDropdownVisible:!isDropdownVisible,index: index)
                                        );
                                      },
                                      icon: Icon(
                                        (isDropdownVisible == true)
                                            ? Icons.arrow_drop_up_rounded
                                            : Icons.arrow_drop_down_rounded,
                                        size: 35,
                                        color: Colors.grey,
                                      )),
                                ],
                              ),
                            ),
                            if (isDropdownVisible == true && indexofButton==index)
                              Container(
                                height: 100,
                                width: screenSize.width,
                                color: Colors.yellow,
                              )
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

import 'package:auto_mates/user/buyscreentab/controller/functions.dart';
import 'package:auto_mates/user/buyscreentab/view/bloc/buy_screen_bloc.dart';
import 'package:auto_mates/user/buyscreentab/view/buy_screen/buy_screen.dart';
import 'package:auto_mates/user/buyscreentab/view/buy_screen/filter_car_screen/fuel_types/fuel_types_container/fuel_type_container_widget.dart';
import 'package:auto_mates/user/commonwidgets/my_text_widget/my_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FilterWithFuelType extends StatelessWidget {
  const FilterWithFuelType({super.key, required this.screenSize});
  final Size screenSize;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BuyScreenBloc, BuyScreenState>(
      bloc: buyScreenBloc,
      builder: (context, state) {
        bool isDropdownVisible = false;
        if (state is CarFuelFilterDropDownStateChangeState) {
          isDropdownVisible = state.isDropdownVisible;
        }
        return Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: screenSize.height / 15,
                  width: screenSize.width,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(5),
                        topRight: Radius.circular(5)),
                    color: Color.fromARGB(255, 244, 244, 244),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: MyTextWidget(
                            text: 'Fuel Type',
                            color: Color.fromARGB(255, 136, 136, 136),
                            size: 15,
                            weight: FontWeight.w700),
                      ),
                      IconButton(
                          onPressed: () {
                            buyScreenBloc.add(
                                CarFuelFilterDropDownStateChangeEvent(
                                    isDropdownVisible: !isDropdownVisible));
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
                if (isDropdownVisible == true)
                  FuelTypeContainerWidget(screenSize: screenSize)
              ],
            ));
      },
    );
  }
}

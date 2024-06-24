import 'package:auto_mates/user/buyscreentab/model/buyscreen_model.dart';
import 'package:auto_mates/user/buyscreentab/view/bloc/buy_screen_bloc.dart';
import 'package:auto_mates/user/buyscreentab/view/buy_screen/filter_car_screen/filter_screen.dart';
import 'package:auto_mates/user/commonwidgets/my_text_widget/my_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FuelTypeContainerWidget extends StatelessWidget {
   FuelTypeContainerWidget({super.key, required this.screenSize});
  final Size screenSize;
  final BuyScreenBloc dropselectbloc=BuyScreenBloc();
  @override
  Widget build(BuildContext context) {
    return Container(
        height: screenSize.height / 8,
        width: screenSize.width,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(5), bottomRight: Radius.circular(5)),
          color: Color.fromARGB(255, 244, 244, 244),
        ),
        child: GridView.builder(
          padding: const EdgeInsets.only(left: 8, right: 8),
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: .955),
          itemCount: fuelTypes.length,
          itemBuilder: (context, index) {
            return BlocBuilder<BuyScreenBloc, BuyScreenState>(
              bloc: dropselectbloc,
              builder: (context, state) {
                return GestureDetector(
                  onTap: () {
                    dropselectbloc.add(CarFuelFilterStateRefreshEvent(selectedFuel: fuelTypes[index].fuelType, index: index));
                  },
                  child: CircleAvatar(
                    backgroundColor: selectedCarFilterdList.contains(fuelTypes[index].fuelType) ? Colors.blue : Colors.white,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: screenSize.width / 14,
                          height: screenSize.height / 30,
                          decoration: const BoxDecoration(
                            color: Colors.transparent,
                          ),
                          child: Image.asset(
                            selectedCarFilterdList.contains(fuelTypes[index].fuelType)
                            ? fuelTypes[index].imageUrlWhite
                            : fuelTypes[index].imageUrl
                          ),
                        ),
                        MyTextWidget(
                            text: fuelTypes[index].fuelType,
                            color: selectedCarFilterdList.contains(fuelTypes[index].fuelType) ? Colors.white : Colors.grey,
                            size: 12,
                            weight: FontWeight.w600)
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ));
  }
}

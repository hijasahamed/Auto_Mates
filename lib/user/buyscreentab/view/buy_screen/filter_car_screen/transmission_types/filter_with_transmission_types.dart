import 'package:auto_mates/user/buyscreentab/model/buyscreen_model.dart';
import 'package:auto_mates/user/buyscreentab/view/bloc/buy_screen_bloc.dart';
import 'package:auto_mates/user/buyscreentab/view/buy_screen/buy_screen.dart';
import 'package:auto_mates/user/buyscreentab/view/buy_screen/filter_car_screen/car_brands/filter_with_car_brands.dart';
import 'package:auto_mates/user/commonwidgets/my_text_widget/my_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FilterWithTransmissionTypes extends StatelessWidget {
  const FilterWithTransmissionTypes({super.key, required this.screenSize});
  final Size screenSize;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const MyTextWidget(
              text: 'Makes',
              color: Color.fromARGB(255, 136, 136, 136),
              size: 15,
              weight: FontWeight.w700),
          Container(
            height: screenSize.height / 8.5,
            width: screenSize.width,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 244, 244, 244),
              borderRadius: BorderRadius.circular(5)
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: .955),
                itemCount: transmissionTypes.length,
                itemBuilder: (context, index) {
                  return BlocBuilder<BuyScreenBloc, BuyScreenState>(
                    bloc: buyScreenBloc,
                    builder: (context, state) {
                      return GestureDetector(
                        onTap: () {
                          buyScreenBloc.add(
                              CarTransmissionFilterStateRefreshEvent(
                                  selectedTransmission:
                                      transmissionTypes[index].transmissionType,
                                  index: index));
                        },
                        child: CircleAvatar(
                          backgroundColor: selectedCarFilterdList.contains(
                                  transmissionTypes[index].transmissionType)
                              ? Colors.blue
                              : Colors.white,
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
                                child: Image.asset(selectedCarFilterdList
                                        .contains(transmissionTypes[index]
                                            .transmissionType)
                                    ? transmissionTypes[index].imageUrlWhite
                                    : transmissionTypes[index].imageUrl),
                              ),
                              MyTextWidget(
                                  text: transmissionTypes[index].transmissionType,
                                  color: selectedCarFilterdList.contains(
                                          transmissionTypes[index]
                                              .transmissionType)
                                      ? Colors.white
                                      : Colors.grey,
                                  size: 12,
                                  weight: FontWeight.w600)
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

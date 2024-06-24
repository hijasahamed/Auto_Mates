import 'package:auto_mates/user/buyscreentab/model/buyscreen_model.dart';
import 'package:auto_mates/user/buyscreentab/view/bloc/buy_screen_bloc.dart';
import 'package:auto_mates/user/buyscreentab/view/buy_screen/filter_car_screen/filter_screen.dart';
import 'package:auto_mates/user/commonwidgets/my_text_widget/my_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SeatCapacityContainerWidget extends StatelessWidget {
  SeatCapacityContainerWidget({super.key, required this.screenSize});
  final Size screenSize;
  final BuyScreenBloc seatCapacitySelectbloc=BuyScreenBloc();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenSize.height / 6.4,
      width: screenSize.width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: const Color.fromARGB(255, 244, 244, 244)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: screenSize.width/200
            ),
          itemCount: seatCapacity.length,
          itemBuilder: (context, index) {
            return BlocBuilder<BuyScreenBloc, BuyScreenState>(
              bloc: seatCapacitySelectbloc,
              builder: (context, state) {
                return GestureDetector(
                  onTap: () {
                    seatCapacitySelectbloc
                        .add(CarSeatFilterStateRefreshEvent(index: index,seat: seatCapacity[index]));
                  },
                  child: Container(
                    height: screenSize.height / 20,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(color: selectedCarFilterdList.contains(seatCapacity[index])?Colors.blue :Colors.grey),
                        color: selectedCarFilterdList.contains(seatCapacity[index])? Colors.blue : Colors.transparent
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MyTextWidget(
                            text: seatCapacity[index],
                            color: selectedCarFilterdList.contains(seatCapacity[index])? Colors.white : Colors.grey,
                            size: 13,
                            weight: FontWeight.w600),
                        SizedBox(
                          width: screenSize.width / 110,
                        ),
                        MyTextWidget(
                            text: 'Seater',
                            color: selectedCarFilterdList.contains(seatCapacity[index])? Colors.white : Colors.grey,
                            size: 13,
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
    );
  }
}

import 'package:auto_mates/user/buyscreentab/model/buyscreen_model.dart';
import 'package:auto_mates/user/buyscreentab/view/bloc/buy_screen_bloc.dart';
import 'package:auto_mates/user/buyscreentab/view/buy_screen/filter_car_screen/car_brands/filter_with_car_brands.dart';
import 'package:auto_mates/user/commonwidgets/my_text_widget/my_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PriceContainersWidget extends StatelessWidget {
  PriceContainersWidget({super.key, required this.screenSize});
  final Size screenSize;
  final BuyScreenBloc budgetSelectbloc = BuyScreenBloc();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenSize.height / 3.25,
      width: screenSize.width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: const Color.fromARGB(255, 244, 244, 244)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 2),
          itemCount: budgetsForFilter.length,
          itemBuilder: (context, index) {
            String budgetText = budgetsForFilter[index].ratio +
                ' ' +
                budgetsForFilter[index].budget;
            return BlocBuilder<BuyScreenBloc, BuyScreenState>(
              bloc: budgetSelectbloc,
              builder: (context, state) {
                return GestureDetector(
                  onTap: () {
                    budgetSelectbloc
                        .add(CarBudgetFilterStateRefreshEvent(index: index,budgetText: budgetText));
                  },
                  child: Container(
                    height: screenSize.height / 30,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(color: selectedCarFilterdList.contains(budgetText)?Colors.blue :Colors.grey),
                        color: selectedCarFilterdList.contains(budgetText)?Colors.blue :Colors.transparent),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MyTextWidget(
                            text: budgetText,
                            color: selectedCarFilterdList.contains(budgetText)?Colors.white :Colors.grey,
                            size: 13,
                            weight: FontWeight.w600),
                        SizedBox(
                          width: screenSize.width / 110,
                        ),
                        MyTextWidget(
                            text: 'Lakhs',
                            color: selectedCarFilterdList.contains(budgetText)?Colors.white :Colors.grey,
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

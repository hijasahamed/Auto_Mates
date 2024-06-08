import 'package:auto_mates/seller/seller_homescreen/view/widgets/add_edit_car_widgets/dropdownbuttons/car_brand_drop_down.dart';
import 'package:auto_mates/user/buyscreentab/view/bloc/buy_screen_bloc.dart';
import 'package:auto_mates/user/buyscreentab/view/buy_screen/buy_screen.dart';
import 'package:auto_mates/user/commonwidgets/my_text_widget/my_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final List<String> selectedCarBrandsList = [];

class FilterWithCarBrands extends StatelessWidget {
 const FilterWithCarBrands({super.key, required this.screenSize});
  final Size screenSize;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const MyTextWidget(text: 'Makes', color: Color.fromARGB(255, 136, 136, 136), size: 15, weight: FontWeight.w700),
          Scrollbar(
            radius: const Radius.circular(10),
            thickness: 3,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: const Color.fromARGB(255, 244, 244, 244),
              ),
              height: screenSize.height/2,
              width: screenSize.width,
              child: GridView.builder(
                padding: const EdgeInsets.all(10),
                scrollDirection: Axis.horizontal,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 5,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: .955),
                itemCount: carBrands.length,
                itemBuilder: (context, index) {
                  return BlocBuilder<BuyScreenBloc, BuyScreenState>(
                    bloc: buyScreenBloc,
                    builder: (context, state) {
                      return GestureDetector(
                        onTap: () {
                          buyScreenBloc.add(CarBrandFilterStateRefreshEvent(selectedCar: carBrands[index],index: index));                    
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: selectedCarBrandsList.contains(carBrands[index]) ? Colors.blue : Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                          child: Center(
                            child: MyTextWidget(
                                text: carBrands[index],
                                color: selectedCarBrandsList.contains(carBrands[index]) ? Colors.white : Colors.grey,
                                size: 12,
                                weight: FontWeight.w400,
                                
                                ),
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

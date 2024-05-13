import 'package:auto_mates/seller/seller_homescreen/controller/functions.dart';
import 'package:auto_mates/user/appbarbottombar/view/widgets/app_bar_gradient_color.dart';
import 'package:auto_mates/user/authentications/view/widgets/signup_screen_widgets/text_form_widget.dart';
import 'package:auto_mates/user/commonwidgets/common_widgets.dart';
import 'package:flutter/material.dart';

class AddCarWidget extends StatelessWidget {
  AddCarWidget({super.key, required this.screenSize});
  final Size screenSize;
  final TextEditingController carBrandController = TextEditingController();
  final TextEditingController carModelNameController = TextEditingController();
  final TextEditingController carColorController = TextEditingController();
  final TextEditingController carYearController = TextEditingController();
  final TextEditingController carPriceController = TextEditingController();
  final TextEditingController carFuelController = TextEditingController();
  final TextEditingController carKilometerController = TextEditingController();


  final GlobalKey<FormState> postCarFormkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        appBar: AppBar(
          flexibleSpace: const AppBarGradientColor(),
          title: const MyTextWidget(
              text: 'Post New Car',
              color: Colors.white,
              size: 20,
              weight: FontWeight.bold),
          centerTitle: true,
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Container(
                  height: screenSize.height / 6.5,
                  width: screenSize.width / 1.8,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/post new car.jpg'),
                          fit: BoxFit.cover,
                          filterQuality: FilterQuality.high)
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Form(
                      key: postCarFormkey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: screenSize.height/6,
                              width: screenSize.width,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: const Color(0XFFDBEDF5)
                              ),
                              child: const Center(child: MyTextWidget(text: 'Add photo', color: Color(0xFF424141), size: 15, weight: FontWeight.bold)),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormWidget(
                                text: 'Brand Name',
                                controller: carBrandController,
                                warning: 'Enter value',
                                obscure: false,
                                keyBoardType: TextInputType.name,
                                textCapitalization: TextCapitalization.words,
                                fillColor: const Color(0XFFDBEDF5)),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormWidget(
                                text: 'Model Name',
                                controller: carModelNameController,
                                warning: 'Enter value',
                                obscure: false,
                                keyBoardType: TextInputType.name,
                                textCapitalization: TextCapitalization.words,
                                fillColor: const Color(0XFFDBEDF5)),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormWidget(
                                text: 'Color',
                                controller: carColorController,
                                warning: 'Enter value',
                                obscure: false,
                                keyBoardType: TextInputType.name,
                                textCapitalization: TextCapitalization.words,
                                fillColor: const Color(0XFFDBEDF5)),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormWidget(
                                text: 'Year',
                                controller: carYearController,
                                warning: 'Enter value',
                                obscure: false,
                                keyBoardType: TextInputType.name,
                                textCapitalization: TextCapitalization.words,
                                fillColor: const Color(0XFFDBEDF5)),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormWidget(
                                text: 'Price',
                                controller: carPriceController,
                                warning: 'Enter value',
                                obscure: false,
                                keyBoardType: TextInputType.name,
                                textCapitalization: TextCapitalization.words,
                                fillColor: const Color(0XFFDBEDF5)),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormWidget(
                                text: 'Fuel',
                                controller: carFuelController,
                                warning: 'Enter value',
                                obscure: false,
                                keyBoardType: TextInputType.name,
                                textCapitalization: TextCapitalization.words,
                                fillColor: const Color(0XFFDBEDF5)),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormWidget(
                                text: 'Kilometers',
                                controller: carKilometerController,
                                warning: 'Enter value',
                                obscure: false,
                                keyBoardType: TextInputType.name,
                                textCapitalization: TextCapitalization.words,
                                fillColor: const Color(0XFFDBEDF5)),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: screenSize.height / 17,
                    width: screenSize.width / 1.5,
                    color: Colors.transparent,
                    child: Material(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      color: Colors.redAccent,
                      child: InkWell(
                          onTap: () {
                            postNewCar(
                              carBrandController: carBrandController,
                              carColorController: carColorController,
                              carFuelController: carFuelController,
                              carKilometerController: carKilometerController,
                              carModelNameController: carModelNameController,
                              carPriceController: carPriceController,
                              carYearController: carYearController,
                              postCarFormkey: postCarFormkey,
                              context: context,
                            );
                          },
                          child: const Center(
                            child: MyTextWidget(
                                text: 'Post New Car',
                                color: Colors.white,
                                size: 17,
                                weight: FontWeight.bold),
                          )),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}

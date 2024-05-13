import 'package:auto_mates/user/appbarbottombar/view/widgets/app_bar_gradient_color.dart';
import 'package:auto_mates/user/authentications/view/widgets/signup_screen_widgets/text_form_widget.dart';
import 'package:auto_mates/user/commonwidgets/common_widgets.dart';
import 'package:flutter/material.dart';

class AddCarWidget extends StatelessWidget {
 AddCarWidget({super.key});
  TextEditingController carBrandController =TextEditingController();
  TextEditingController carModelNameController =TextEditingController();
  TextEditingController carColorController =TextEditingController();
  TextEditingController carYearController =TextEditingController();
  TextEditingController carPriceController =TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          flexibleSpace: const AppBarGradientColor(),
          title: const MyTextWidget(text: 'Add Car', color: Colors.white, size: 20, weight: FontWeight.bold),
          centerTitle: true,
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  TextFormWidget(
                      text: 'Brand Name',
                      controller: carBrandController,
                      warning: 'Enter value',
                      obscure: false,
                      keyBoardType: TextInputType.name,
                      textCapitalization: TextCapitalization.words,
                      fillColor: const Color.fromARGB(255, 255, 255, 255)),
                  TextFormWidget(
                      text: 'Model Name',
                      controller: carModelNameController,
                      warning: 'Enter value',
                      obscure: false,
                      keyBoardType: TextInputType.name,
                      textCapitalization: TextCapitalization.words,
                      fillColor: const Color.fromARGB(255, 255, 255, 255)),
                  TextFormWidget(
                      text: 'Color',
                      controller: carColorController,
                      warning: 'Enter value',
                      obscure: false,
                      keyBoardType: TextInputType.name,
                      textCapitalization: TextCapitalization.words,
                      fillColor: const Color.fromARGB(255, 255, 255, 255)),
                  TextFormWidget(
                      text: 'Year',
                      controller: carYearController,
                      warning: 'Enter value',
                      obscure: false,
                      keyBoardType: TextInputType.name,
                      textCapitalization: TextCapitalization.words,
                      fillColor: const Color.fromARGB(255, 255, 255, 255)),
                  TextFormWidget(
                      text: 'Price',
                      controller: carPriceController,
                      warning: 'Enter value',
                      obscure: false,
                      keyBoardType: TextInputType.name,
                      textCapitalization: TextCapitalization.words,
                      fillColor: const Color.fromARGB(255, 255, 255, 255)),
                ],
              ),
            ),
          ),
        ));
  }
}

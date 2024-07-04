
import 'package:auto_mates/user/commonwidgets/text_form_field/text_form_widget.dart';
import 'package:flutter/material.dart';

class CreateSectionWidget extends StatelessWidget {
  const CreateSectionWidget(
      {super.key,
      required this.phoneNumberController,
      required this.companyNameController,
      required this.locationController,
      required this.screenSize,
      required this.sellerSignupFormkey});
  final Size screenSize;
  final TextEditingController phoneNumberController;
  final TextEditingController companyNameController;
  final TextEditingController locationController;
  final GlobalKey sellerSignupFormkey;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: screenSize.height / 2.5,
        width: screenSize.width,        
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Form(
            key: sellerSignupFormkey,
            child: Column(
              children: [
                MyTextFormWidget(                  
                  screenSize: screenSize,
                    text: 'Company Name',
                    enabledBorderColor: Colors.white,
                    focusedBorderColor: Colors.red,
                    valueTextColor: Colors.grey,
                    labelTextColor: Colors.grey,
                    controller: companyNameController,
                    warning: 'Enter the company name',
                    obscure: false,
                    keyBoardType: TextInputType.name,
                    textCapitalization: TextCapitalization.words,
                    fillColor: const Color.fromARGB(255, 240, 240, 240),
                    ),
                    SizedBox(height: screenSize.height/60,),
                MyTextFormWidget(
                  screenSize: screenSize,
                  fetchLocation: true,
                    text: 'Fetch Location',
                    enabledBorderColor: Colors.white,
                    focusedBorderColor: Colors.red,
                    labelTextColor: Colors.grey,
                    valueTextColor: Colors.grey,
                    fillColor: const Color.fromARGB(255, 240, 240, 240),
                    controller: locationController,
                    warning: 'Enter your company location',
                    obscure: false,
                    keyBoardType: TextInputType.none,
                    textCapitalization: TextCapitalization.words),
                SizedBox(height: screenSize.height/60,),               
                MyTextFormWidget(
                  screenSize: screenSize,
                    text: 'Phone Number',
                    valueTextColor: Colors.grey,
                    enabledBorderColor: Colors.white,
                    focusedBorderColor: Colors.red,
                    labelTextColor: Colors.grey,
                    fillColor: const Color.fromARGB(255, 240, 240, 240),
                    controller: phoneNumberController,
                    warning: 'Enter a valid Phone Numbe',
                    length: true,
                    obscure: false,
                    keyBoardType: TextInputType.phone,
                    textCapitalization: TextCapitalization.none),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

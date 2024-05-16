import 'package:auto_mates/user/authentications/view/widgets/text_form_field/text_form_widget.dart';
import 'package:flutter/material.dart';

class CreateSectionWidget extends StatelessWidget {
  const CreateSectionWidget(
      {super.key,
      required this.phoneNumberController,
      required this.companyNameController,
      required this.locationController,
      required this.screenSize,
      required this.formKey});
  final Size screenSize;
  final TextEditingController phoneNumberController;
  final TextEditingController companyNameController;
  final TextEditingController locationController;
  final GlobalKey formKey;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: screenSize.height / 2.7,
        width: screenSize.width,        
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),

        ),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [            
              MyTextFormWidget(
                screenSize: screenSize,
                  text: 'Company Name',
                  controller: companyNameController,
                  warning: 'Enter values',
                  obscure: false,
                  keyBoardType: TextInputType.name,
                  textCapitalization: TextCapitalization.words,
                  fillColor: const Color.fromARGB(255, 240, 240, 240),
                  ),
                  SizedBox(height: screenSize.height/60,),
              MyTextFormWidget(
                screenSize: screenSize,
                  text: 'Location',
                  fillColor: const Color.fromARGB(255, 240, 240, 240),
                  controller: locationController,
                  warning: 'Enter your company location',
                  obscure: false,
                  keyBoardType: TextInputType.streetAddress,
                  textCapitalization: TextCapitalization.words),
                  SizedBox(height: screenSize.height/60,),
              MyTextFormWidget(
                screenSize: screenSize,
                  text: 'Phone Number',
                  fillColor: const Color.fromARGB(255, 240, 240, 240),
                  controller: phoneNumberController,
                  warning: 'Enter a valid Phone Numbe',
                  obscure: false,
                  keyBoardType: TextInputType.phone,
                  textCapitalization: TextCapitalization.none),
            ],
          ),
        ),
      ),
    );
  }
}

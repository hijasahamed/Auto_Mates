import 'package:auto_mates/user/authentications/view/widgets/signup_screen_widgets/text_form_widget.dart';
import 'package:auto_mates/user/commonwidgets/common_widgets.dart';
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
    return Container(
      height: screenSize.height/2.3,
      width: screenSize.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.black12
      ),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextFormWidget(
                text: 'Company Name',
                controller: companyNameController,
                warning: 'Enter values',
                obscure: false,
                keyBoardType: TextInputType.name,
                textCapitalization: TextCapitalization.words),
            TextFormWidget(
                text: 'Location',
                controller: locationController,
                warning: 'Enter your company location',
                obscure: false,
                keyBoardType: TextInputType.streetAddress,
                textCapitalization: TextCapitalization.words),
            TextFormWidget(
                text: 'Phone Number',
                controller: phoneNumberController,
                warning: 'Enter a valid Phone Numbe',
                obscure: false,
                keyBoardType: TextInputType.phone,
                textCapitalization: TextCapitalization.none),
            Container(              
              height: screenSize.height/8,
              width: screenSize.width/2,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(width: 1,color: Colors.grey)
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const MyTextWidget(text: 'Add Profile', color: Color.fromARGB(255, 86, 86, 86), size: 15, weight: FontWeight.bold),
                  IconButton(
                    onPressed: () {
                      
                    }, 
                    icon: const CircleAvatar(
                      backgroundColor: Colors.black12,
                      child: Icon(Icons.add)
                    )
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

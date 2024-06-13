import 'package:auto_mates/user/commonwidgets/my_text_widget/my_text_widget.dart';
import 'package:flutter/material.dart';

String? selectedItem;
  
final List<String> carBrands=['Maruti Suzuki',
  'Hyundai','Tata Motors',  'Mahindra',  'Kia','Skoda' , 'Toyota',  'Honda',  'Ford',  'Volkswagen',  'Renault',  'MG Motor',
  'Nissan',  'Fiat',  'Datsun',  'Jeep',  'Mercedes-Benz',  'BMW',  'Audi',  'Land Rover',  'Volvo',  'Lexus',
  'Mini',  'Mitsubishi',  'Isuzu',  'Force Motors',
  'Chevrolet',  
  'Citroen',
  'BYD',];

void showBrandSelectionDialog({required BuildContext context, String? selectedItem, required List<String> brands, required TextEditingController controller}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const MyTextWidget(text: 'Select the Car Brand', color: Colors.black, size: 22, weight: FontWeight.w700),        
          content: SizedBox(
          width: 200,
          height: 200,
          child: Scrollbar(
            thumbVisibility: true,
            radius: const Radius.circular(20),
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: brands.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: MyTextWidget(text: brands[index], color: Colors.black, size: 18, weight: FontWeight.w500),
                  onTap: () {
                    controller.text = brands[index];
                    Navigator.of(context).pop();
                  },
                );
              },
            ),
          ),
        ),
        );
      },
    );
  }
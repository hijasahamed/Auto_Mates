import 'package:flutter/material.dart';

String? selectedItem;
  
final List<String> brands=['Maruti Suzuki',
  'Hyundai','Tata Motors',  'Mahindra',  'Kia'  'Toyota',  'Honda',  'Ford',  'Volkswagen',  'Renault',  'MG Motor',
  'Nissan',  'Fiat',  'Datsun',  'Jeep',  'Mercedes-Benz',  'BMW',  'Audi',  'Land Rover',  'Volvo',  'Lexus',  'Porsche',
  'Ferrari',  'Lamborghini',  'Maserati',  'Bentley',  'Rolls-Royce',  'Mini',  'Mitsubishi',  'Isuzu',  'Force Motors',
  'Ashok Leyland',
  'Chevrolet',
  'Peugeot',
  'Citroen',
  'Opel',
  'SsangYong',
  'Haval',
  'BYD',
  'Great Wall Motors',
  'Geely',
  'Chery',
  'Dongfeng',
  'JMC',
  'Haima',
  'Foton',
  'Changan',
  'Baojun',
  'FAW',
  'SAIC',
  'Zotye',
  'Tata Daewoo',
  'Mahindra SsangYong',
  'Hyundai Genesis',
  'Kia Genesis',
  'Bugatti',
  'Pagani',
  'Koenigsegg',
  'Aston Martin',
  'McLaren',
  'Bentley Bentayga',
  'Tesla',
  'Rimac',
  'Lucid Motors',
  'Faraday Future',
  'Fisker',
  'Polestar'];

void showBrandSelectionDialog({required BuildContext context, String? selectedItem, required List<String> brands, required TextEditingController controller}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Select Car Brand'),         
          content: SizedBox(
          width: 200,
          height: 200,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: brands.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text(brands[index]),
                onTap: () {
                  controller.text = brands[index];
                  Navigator.of(context).pop();
                },
              );
            },
          ),
        ),         
        );
      },
    );
  }
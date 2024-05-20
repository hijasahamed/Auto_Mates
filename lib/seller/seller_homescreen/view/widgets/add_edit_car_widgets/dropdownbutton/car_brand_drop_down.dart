// import 'package:flutter/material.dart';

// // ignore: must_be_immutable
// class CarBrandDropDown extends StatelessWidget {
//   CarBrandDropDown({super.key,required this.controller});
//   final TextEditingController controller;
//   String? selectedItem;
//   final List<String> brands=['Maruthi Suzuki','Toyota','Honda','Skoda','Mahindra'];
//   @override
//   Widget build(BuildContext context) {
//     // return Padding(
//     //   padding: const EdgeInsets.only(right: 10),
//     //   child: DropdownButton<String>(
//     //     underline: const SizedBox(),
//     //     elevation: 5,
//     //     value: selectedItem,
//     //     items: brands.map((String item) {
//     //       return DropdownMenuItem<String>(
//     //         alignment: Alignment.center,
//     //         value: item,
//     //         child: Text(item),
//     //       );
//     //     }).toList(),
//     //     onChanged: (value) {
//     //       controller.text = value.toString();
//     //     },
//     //   ),
//     // );
//     // return  showBrandSelectionDialog()
//   }
// }


import 'package:flutter/material.dart';

String? selectedItem;
  
final List<String> brands=['Maruti Suzuki',
  'Hyundai',
  'Tata Motors',
  'Mahindra',
  'Kia',
  'Toyota',
  'Honda',
  'Ford',
  'Volkswagen',
  'Renault',
  'Skoda',
  'MG Motor',
  'Nissan',
  'Fiat',
  'Datsun',
  'Jeep',
  'Mercedes-Benz',
  'BMW',
  'Audi',
  'Jaguar',
  'Land Rover',
  'Volvo',
  'Lexus',
  'Porsche',
  'Ferrari',
  'Lamborghini',
  'Maserati',
  'Bentley',
  'Rolls-Royce',
  'Mini',
  'Mitsubishi',
  'Isuzu',
  'Force Motors',
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
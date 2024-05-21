import 'package:auto_mates/user/buyscreentab/view/widgets/car_details/sections/car_image.dart';
import 'package:auto_mates/user/buyscreentab/view/widgets/car_details/sections/details_container.dart';
import 'package:auto_mates/user/buyscreentab/view/widgets/specification_features_widget.dart';
import 'package:flutter/material.dart';

class CarDetailsWidget extends StatelessWidget {
  const CarDetailsWidget(
      {super.key, required this.screenSize, required this.data,this.fromSeller});
  final Size screenSize;
  final dynamic data;
  final bool? fromSeller;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xFFDBEDF5),
      elevation: 5,
      child: Column(
        children: [
          CarImage(screenSize: screenSize, data: data,fromSeller: fromSeller,),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data['brand'],
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 23,
                      color: Color(0xFF424141)),
                ),
                Text(
                  data['modelName'],
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 23,
                      color: Color(0xFF424141)),
                ),
                (fromSeller==false)? Row(
                  children: [
                    const Text(
                      'EMI Starts from',
                      style: TextStyle(
                          color: Color.fromARGB(255, 118, 118, 118),
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      width: screenSize.width / 35,
                    ),
                    const Text(
                      '₹38,587',
                      style: TextStyle(
                          color: Colors.blue, fontWeight: FontWeight.bold),
                    )
                  ],
                ):const SizedBox(),
                SizedBox(
                  height: screenSize.height / 90,
                ),
                DetailsContainer(screenSize: screenSize, data: data),
                SizedBox(
                  height: screenSize.height / 90,
                ),
                Container(
                  height: screenSize.height/2,
                  width: screenSize.width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5)
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 10,top: 5),
                        child: Text('Specifications & Features',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Color(0xFF424141)),),
                      ),
                      SpecificationFeaturesWidget(screenSize: screenSize,)
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

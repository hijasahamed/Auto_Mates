import 'package:auto_mates/screens/buyscreentab/ui/buy_screen.dart';
import 'package:auto_mates/screens/buyscreentab/ui/seller_details_screen.dart';
import 'package:auto_mates/screens/buyscreentab/ui/specification_features_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CarDetailsWidget extends StatelessWidget {
  const CarDetailsWidget(
      {super.key, required this.screenSize, required this.data});
  final Size screenSize;
  final AllCars data;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xFFDBEDF5),
      elevation: 5,
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                height: screenSize.height / 6,
                width: screenSize.width,
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10)),
                    image: DecorationImage(
                        image: NetworkImage(data.imageurl), fit: BoxFit.cover)),
              ),
              const Positioned(
                  top: 5,
                  right: 5,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 15,
                    child: Icon(Icons.favorite_outline_rounded,
                          size: 20,
                          color: Colors.red,),
                  ))
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data.name,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 23,
                      color: Color(0xFF424141)),
                ),
                Text(
                  data.price,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 23,
                      color: Color(0xFF424141)),
                ),
                Row(
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
                ),
                SizedBox(
                  height: screenSize.height / 90,
                ),
                Container(
                  height: screenSize.height / 12,
                  width: screenSize.width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5)
                  ),
                  child: const Padding(
                    padding: EdgeInsets.only(top: 8, left: 8, right: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CarMoreDetails(
                            text: 'Nov 2021',
                            icon: FaIcon(
                              FontAwesomeIcons.calendar,
                              color: Color.fromARGB(255, 118, 118, 118),
                            )),
                        CarMoreDetails(
                            text: '35,258',
                            icon: FaIcon(FontAwesomeIcons.calculator,
                                color: Color.fromARGB(255, 118, 118, 118))),
                        CarMoreDetails(
                            text: 'Petrol',
                            icon: FaIcon(FontAwesomeIcons.water,
                                color: Color.fromARGB(255, 118, 118, 118))),
                        CarMoreDetails(
                            text: 'Automatic',
                            icon: FaIcon(FontAwesomeIcons.gear,
                                color: Color.fromARGB(255, 118, 118, 118))),
                        CarMoreDetails(
                            text: 'Calicut',
                            icon: FaIcon(FontAwesomeIcons.locationDot,
                                color: Color.fromARGB(255, 118, 118, 118))),
                      ],
                    ),
                  ),
                ),
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

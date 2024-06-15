import 'package:auto_mates/user/buyscreentab/controller/functions.dart';
import 'package:auto_mates/user/buyscreentab/view/on_tap_more_details/on_tap_car_more_details.dart';
import 'package:auto_mates/user/commonwidgets/my_text_widget/my_text_widget.dart';
import 'package:auto_mates/user/commonwidgets/shimmer_effect/shimmer_effect.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RelatedCars extends StatelessWidget {
  const RelatedCars({super.key, required this.data, required this.screenSize});
  final dynamic data;
  final Size screenSize;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<DocumentSnapshot>>(
      future: findCarForRelatedCars(data: data['bodytype'],carNumber: data['regNumber']),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return SkelotonIndicatorGrid(screenSize: screenSize,isFromSimilers: true,);
        } else if (snapshot.hasError) {
          return const SizedBox.shrink();
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const SizedBox.shrink();
        } else {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const MyTextWidget(text: 'Similar Cars', color: Color(0xFF424141), size: 18, weight: FontWeight.w700),
              Container(
                height: screenSize.height/3.1,
                width: screenSize.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5)
                ),
                child: GridView.builder(
                  scrollDirection: Axis.horizontal,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 1.4,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 3,
                    crossAxisCount: 1,
                  ),
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    var carData = snapshot.data![index].data() as Map<String, dynamic>;
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) {
                          return OnTapCarMoreDetailsCarScreen(
                            screenSize: screenSize,
                            data: carData,
                            isUserFavScreen: false,
                            isFromSearch: true,
                          );
                        },
                      ));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey,width: .5),
                          borderRadius: BorderRadius.circular(5),
                          color: const Color.fromARGB(255, 244, 244, 244)
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(image: NetworkImage(carData['thumbnail']),fit: BoxFit.cover),
                                borderRadius: const BorderRadius.only(topLeft: Radius.circular(5),topRight: Radius.circular(5))
                              ),
                              height: screenSize.height/5,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(5),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  MyTextWidget(text: '${carData['brand']} ${carData['modelName']}', color: const Color.fromARGB(255, 2, 85, 119), size: 17, weight: FontWeight.bold),
                                  MyTextWidget(text: 'Rs. ${carData['price']} Lakhs only', color: const Color.fromARGB(255, 100, 100, 100), size: 13, weight: FontWeight.bold),
                                  MyTextWidget(text: '${carData['kilometer']} Kilometers', color: const Color.fromARGB(255, 100, 100, 100), size: 13, weight: FontWeight.bold),
                                  MyTextWidget(text: '${carData['year']} Model', color: const Color.fromARGB(255, 100, 100, 100), size: 13, weight: FontWeight.bold),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        }
      },
    );
  }
}
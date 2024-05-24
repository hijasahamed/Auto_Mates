import 'package:auto_mates/user/buyscreentab/controller/functions.dart';
import 'package:auto_mates/user/buyscreentab/view/widgets/seller_details_screen.dart';
import 'package:auto_mates/user/commonwidgets/common_widgets/common_widgets.dart';
import 'package:flutter/material.dart';

class CarHolder extends StatelessWidget {
  const CarHolder(
      {super.key,
      required this.screenSize,
      required this.data,
      this.isFromFavorites});
  final Size screenSize;
  final dynamic data;
  final bool? isFromFavorites;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) {
              return SellerDetailsScreen(
                screenSize: screenSize,
                data: data,
              );
            },
          ));
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),border: Border.all(width: .3)
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10)),
                    child: FadeInImage(
                        fadeInDuration: const Duration(milliseconds: 750),
                        height: screenSize.height / 5,
                        width: screenSize.width,
                        placeholder: const AssetImage(
                            'assets/images/image placeholder.jpeg',),
                        placeholderFit: BoxFit.cover,
                        imageErrorBuilder: (context, error, stackTrace) {
                          return const CircularProgressIndicator(
                            color: Colors.blue,
                          );
                        },
                        image: NetworkImage(data['image']),
                        fit: BoxFit.cover,
                        filterQuality: FilterQuality.high),
                  ),
                  Positioned(
                      top: 5,
                      right: 5,
                      child: GestureDetector(
                      onTap: () async {
                        await addCarToUserFavourite(
                            data: data, context: context);
                      },
                      child: (isFromFavorites == false)
                          ? const CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 15,
                      child: Icon(
                        Icons.favorite_outline_rounded,
                        size: 20,
                        color: Colors.red,
                      ),
                    )
                  : GestureDetector(
                      onTap: () {
                        removeFavoriteCar(docId: data.id, context: context);
                      },
                      child: const CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 15,
                        child: Icon(
                          Icons.delete,
                          size: 20,
                          color: Colors.red,
                        ),
                      ),
                    )))
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 4),
                child: Row(                  
                  children: [
                    MyTextWidget(text: '${data['brand']}', color: Colors.black, size: 15, weight: FontWeight.bold),
                    SizedBox(width: screenSize.width/100,),
                    MyTextWidget(text: '${data['modelName']}', color: Colors.black, size: 15, weight: FontWeight.bold),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 4),
                child: MyTextWidget(text: '${data['year']} model', color: Colors.black, size: 15, weight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 4),                
                child: MyTextWidget(text: '${data['kilometer']} kilometers', color: Colors.black, size: 15, weight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 4),
                child: MyTextWidget(text: 'Rs. ${data['price']} onwards', color: Colors.black, size: 15, weight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

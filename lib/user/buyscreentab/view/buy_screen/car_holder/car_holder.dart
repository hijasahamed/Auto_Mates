import 'package:auto_mates/user/buyscreentab/controller/functions.dart';
import 'package:auto_mates/user/buyscreentab/view/widgets/seller_details_screen.dart';
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
                        //  placeholder: const AssetImage(
                        //     'assets/images/photo placeholder.webp'),
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
                child: Text(
                  data['modelName'],
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, color: Color(0xFF424141)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 4),
                child: Text(
                  data['year'],
                  style: const TextStyle(
                      color: Color.fromARGB(255, 83, 83, 83),
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 4),
                child: Text(
                  data['kilometer'],
                  style: const TextStyle(
                      color: Color.fromARGB(255, 83, 83, 83),
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 4),
                child: Text(
                  'Rs. ${data['price']} onwards',
                  style: const TextStyle(
                      color: Color.fromARGB(255, 83, 83, 83),
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

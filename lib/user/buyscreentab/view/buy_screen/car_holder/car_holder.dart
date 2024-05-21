import 'package:auto_mates/user/buyscreentab/controller/functions.dart';
import 'package:auto_mates/user/buyscreentab/view/seller_details_screen.dart';
import 'package:flutter/material.dart';

class CarHolder extends StatelessWidget {
  const CarHolder({super.key,required this.screenSize,required this.data,this.isFromFavorites});
  final Size screenSize;
  final dynamic data;
  final bool? isFromFavorites;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      color: const Color(0xFFDBEDF5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: FadeInImage(
                    fadeInDuration: const Duration(milliseconds: 750),
                    height: screenSize.height / 7,
                    width: screenSize.width,
                    placeholder: const AssetImage(
                        'assets/images/image placeholder.jpeg'),
                    placeholderFit: BoxFit.fill,
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
                      await addCarToUserFavourite(data: data, context: context);
                    },
                    child: (isFromFavorites==false)
                    ?const CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 15,
                      child: Icon(
                        Icons.favorite_outline_rounded,
                        size: 20,
                        color: Colors.red,
                      ),
                    )
                    :GestureDetector(
                      onTap: () {
                        removeFavoriteCar(docId: data.id,context: context);
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
                    )
                  ))
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
          const Spacer(),
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
              data['price'],
              style: const TextStyle(
                  color: Color.fromARGB(255, 83, 83, 83),
                  fontWeight: FontWeight.bold),
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.only(left: 4, bottom: 4),
            child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) {
                      return SellerDetailsScreen(
                        screenSize: screenSize,
                        data: data,
                      );
                    },
                  ));
                },
                child: const Text(
                  'More Details',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black),
                )),
          )
        ],
      ),
    );
  }
}

import 'package:auto_mates/user/buyscreentab/controller/functions.dart';
import 'package:auto_mates/user/buyscreentab/view/bloc/buy_screen_bloc.dart';
import 'package:auto_mates/user/buyscreentab/view/buy_screen/buy_screen.dart';
import 'package:auto_mates/user/profilescreen/controller/functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavouriteIcon extends StatelessWidget {
  const FavouriteIcon({
    super.key,
    required this.data,
  });
  final dynamic data;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BuyScreenBloc, BuyScreenState>(
      bloc: buyScreenBloc,
      builder: (context, state) {
        return FutureBuilder(
          future: isCarToSellInUserFavourite(
            carToSellId: data.id,
          ),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return IconButton(
                onPressed: (){},
                 icon: const Icon(Icons.favorite_outline_rounded,size: 20,color: Colors.white,)
              );
            }
            final List favouriteData = snapshot.data ?? [];
            bool isFavourite = favouriteData.isNotEmpty;
            String? docId;
            if (isFavourite) {
              docId = favouriteData[0]['id'] as String;
            }
            return isFavourite
                ? IconButton(
                    onPressed: () {
                      removeFavoriteCar(context: context, docId: docId);
                    },
                    icon: const Icon(
                      Icons.favorite_rounded,
                      size: 23,
                      color: Colors.redAccent,
                    ))
                : IconButton(
                    onPressed: () {
                      addCarToUserFavourite(data: data, context: context);
                    },
                    icon: const Icon(
                      Icons.favorite_outline_rounded,
                      size: 23,
                      color: Colors.white,
                    ));
          },
        );
      },
    );
  }
}

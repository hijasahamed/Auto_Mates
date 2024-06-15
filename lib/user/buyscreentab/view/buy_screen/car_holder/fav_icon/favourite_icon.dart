import 'package:auto_mates/user/buyscreentab/controller/functions.dart';
import 'package:auto_mates/user/buyscreentab/view/bloc/buy_screen_bloc.dart';
import 'package:auto_mates/user/profilescreen/controller/functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavouriteIcon extends StatelessWidget {
  const FavouriteIcon({
    super.key,
    required this.data,
    this.isFromSearch,
  });
  final dynamic data;
  final bool? isFromSearch;
  @override
  Widget build(BuildContext context) {
    BuyScreenBloc favouriteIconBlocInstance = BuyScreenBloc();
    return BlocBuilder<BuyScreenBloc, BuyScreenState>(
      bloc: favouriteIconBlocInstance,
      builder: (context, state) {
        return FutureBuilder(
          future: isCarToSellInUserFavourite(
            carToSellId: (isFromSearch==true)?data['id']:data.id
          ),
          builder: (context, snapshot) {            
            final List favouriteData = snapshot.data ?? [];
            bool isFavourite = favouriteData.isNotEmpty;
            String? docId;
            if (isFavourite) {
              docId = favouriteData[0]['id'] as String;
            }
            return isFavourite
                ? CircleAvatar(
                  backgroundColor: Colors.black12,
                  child: IconButton(
                      onPressed: () {
                        removeFavoriteCar(context: context, docId: docId,favouriteIconBlocInstance: favouriteIconBlocInstance);
                      },
                      icon: const Icon(
                        Icons.favorite_rounded,
                        size: 23,
                        color: Colors.redAccent,
                      )),
                )
                : CircleAvatar(
                  backgroundColor: Colors.black12,
                  child: IconButton(
                      onPressed: () {
                        addCarToUserFavourite(data: data, context: context,isFromSearch: isFromSearch,favouriteIconBlocInstance: favouriteIconBlocInstance);
                      },
                      icon: const Icon(
                        Icons.favorite_outline_rounded,
                        size: 23,
                        color: Colors.white,
                      )),
                );
          },
        );
      },
    );
  }
}

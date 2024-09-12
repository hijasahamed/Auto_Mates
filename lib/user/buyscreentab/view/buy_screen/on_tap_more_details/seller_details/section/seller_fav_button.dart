import 'package:auto_mates/seller/authentications/model/model.dart';
import 'package:auto_mates/user/buyscreentab/controller/functions.dart';
import 'package:auto_mates/user/buyscreentab/view/bloc/buy_screen_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SellerFavButton extends StatelessWidget {
  const SellerFavButton({
    super.key,
    required this.sellerData,
  });
  final SellerData sellerData;
  @override
  Widget build(BuildContext context) {
    BuyScreenBloc sellerFavIconBlocInstance = BuyScreenBloc();
    return BlocBuilder<BuyScreenBloc, BuyScreenState>(
      bloc: sellerFavIconBlocInstance,
      builder: (context, state) {
        return FutureBuilder(
          future: isSellerInFavourites(sellerDetails: sellerData),
          builder: (context, snapshot) {
            final List sellerFavouriteData = snapshot.data ?? [];
            bool isSellerFavourite = sellerFavouriteData.isNotEmpty;
            return isSellerFavourite
                ? IconButton(
                    color: Colors.white54,
                    highlightColor: Colors.white54,
                    onPressed: () {
                      removeSellerFromFavourites(
                          context: context,
                          docId: sellerFavouriteData[0]['id'],sellerFavIconBlocInstance: sellerFavIconBlocInstance);
                    },
                    icon: const Icon(
                      Icons.favorite_rounded,
                      size: 23,
                      color: Colors.redAccent,
                    ))
                : IconButton(
                    color: Colors.white54,
                    highlightColor: Colors.white54,
                    onPressed: () {
                      addSellerToFavourite(
                          context: context, sellerData: sellerData,sellerFavIconBlocInstance: sellerFavIconBlocInstance);
                    },
                    icon: const Icon(
                      Icons.favorite_outline_rounded,
                      size: 23,
                      color: Colors.grey,
                    ));
          },
        );
      },
    );
  }
}

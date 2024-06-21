import 'dart:io';

import 'package:auto_mates/seller/authentications/controllers/functions.dart';
import 'package:auto_mates/seller/authentications/view/bloc/seller_authentication_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SellerProfile extends StatelessWidget {
  const SellerProfile({super.key});

  @override
  Widget build(BuildContext context) {
    SellerAuthenticationBloc blocInstance = SellerAuthenticationBloc();
    return BlocBuilder<SellerAuthenticationBloc, SellerAuthenticationState>(
      bloc: blocInstance,
      builder: (context, state) {
        ImageProvider? imageProvider;
        if (sellerProfileImage == null || sellerProfileImage!.isEmpty) {
          imageProvider = const AssetImage('assets/images/avatar.png');
        } else {
          Uri uri = Uri.parse(sellerProfileImage!);
          if (uri.isAbsolute) {
            imageProvider = NetworkImage(sellerProfileImage!);
          } else {
            imageProvider = FileImage(File(sellerProfileImage!));
          }
        }
        return Stack(
          children: [
            CircleAvatar(
              radius: 50,
              backgroundColor: Colors.blue,
              backgroundImage: imageProvider,
            ),
            Positioned(
                bottom: 0,
                right: 0,
                child: GestureDetector(
                  onTap: () {
                    addSellerProfileImage(bloc: blocInstance);
                  },
                  child: const CircleAvatar(
                    radius: 18,
                    backgroundColor: Colors.blue,
                    child: Icon(
                      Icons.add_a_photo,
                      color: Colors.white,
                      size: 18,
                    ),
                  ),
                )),
          ],
        );
      },
    );
  }
}

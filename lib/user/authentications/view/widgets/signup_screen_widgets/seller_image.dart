import 'dart:io';

import 'package:auto_mates/user/authentications/controller/bloc/authentication_bloc.dart';
import 'package:auto_mates/user/authentications/controller/functions/fuctions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SellerImage extends StatelessWidget {
  const SellerImage({super.key});

  @override
  Widget build(BuildContext context) {
    AuthenticationBloc userProfileBlocInstance = AuthenticationBloc();
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
      bloc: userProfileBlocInstance,
      builder: (context, state) {
        ImageProvider? imageProvider;
        if (userProfileImage == null || userProfileImage!.isEmpty) {
          imageProvider = const AssetImage('assets/images/avatar.png');
        } else {
          Uri uri = Uri.parse(userProfileImage!);
          if (uri.isAbsolute) {
            imageProvider = NetworkImage(userProfileImage!);
          } else {
            imageProvider = FileImage(File(userProfileImage!));
          }
        }
        return Stack(
          children: [
            CircleAvatar(
              radius: 60,
              backgroundColor: const Color(0XFF143A42),
              backgroundImage: imageProvider
            ),
            Positioned(
                bottom: 0,
                right: 0,
                child: GestureDetector(
                  onTap: () {
                    addUserProfileImage(bloc: userProfileBlocInstance);
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

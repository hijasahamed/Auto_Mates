import 'package:auto_mates/user/authentications/controller/functions/fuctions.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class UserProfileImage extends StatelessWidget {
  const UserProfileImage(
      {super.key, required this.screenSize, required this.user});
  final Size screenSize;
  final UserData user;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: screenSize.height / 20.5,
      backgroundColor: Colors.green,
      child: CircleAvatar(
        backgroundColor: Colors.white,
        radius: screenSize.height / 21,
        child: ClipOval(
          child: CachedNetworkImage(
            imageUrl: user.userProfile,
            placeholder: (context, url) => const CircularProgressIndicator(
              color: Colors.blue,
            ),
            errorWidget: (context, url, error) => const Icon(Icons.error),
            imageBuilder: (context, imageProvider) => Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

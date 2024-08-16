import 'package:auto_mates/user/authentications/controller/functions/fuctions.dart';
import 'package:auto_mates/user/profilescreen/view/bloc/profile_screen_bloc.dart';
import 'package:flutter/material.dart';

class EditUserImage extends StatelessWidget {
  const EditUserImage(
      {super.key,
      required this.screenSize,
      required this.imageProvider,
      required this.editUserImageBloc});
  final Size screenSize;
  final ImageProvider imageProvider;
  final ProfileScreenBloc editUserImageBloc;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: FadeInImage(
              fadeInDuration: const Duration(milliseconds: 500),
              height: screenSize.height / 6.5,
              width: screenSize.width / 3,
              placeholder: const AssetImage(
                'assets/images/image placeholder.jpeg',
              ),
              placeholderFit: BoxFit.cover,
              imageErrorBuilder: (context, error, stackTrace) {
                return const CircularProgressIndicator(
                  color: Colors.blue,
                );
              },
              image: imageProvider,
              fit: BoxFit.cover,
              filterQuality: FilterQuality.high),
        ),
        Positioned(
          bottom: 5,
          right: 5,
          child: GestureDetector(
            onTap: () {
              addUserProfileImage(editBloc: editUserImageBloc, bloc: null);
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
          )
        ),
      ],
    );
  }
}

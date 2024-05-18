import 'package:auto_mates/user/appbarbottombar/controller/functions/functions.dart';
import 'package:auto_mates/user/authentications/controller/functions/fuctions.dart';
import 'package:auto_mates/user/profilescreen/controller/functions.dart';
import 'package:auto_mates/user/profilescreen/view/bloc/profile_screen_bloc.dart';
import 'package:auto_mates/user/profilescreen/view/widgets/logout_section/loging_out_screen_widget.dart';
import 'package:auto_mates/user/profilescreen/view/widgets/profile_properties/profile_properties_screen.dart';
import 'package:auto_mates/user/profilescreen/view/widgets/user_banner/profile_banner_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key, required this.screenSize});
  final Size screenSize;
  @override
  Widget build(BuildContext context) {
    final ProfileScreenBloc profileScreenBloc = ProfileScreenBloc();
    return BlocConsumer<ProfileScreenBloc, ProfileScreenState>(
      bloc: profileScreenBloc,
      listener: (context, state) {
        if (state is LogoutButtonClickedActionState) {
          logoutAlertMessage(
              context: context, profileScreenBloc: profileScreenBloc);
        } else if (state is ConfirmLogoutActionState) {
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => LogingOutScreenWidget(screenSize: screenSize),
          ));
        }
      },
      builder: (context, state) {
        return FutureBuilder(
          future: fetchUserDetails(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return const Center(child: Text('Error loading user data'));
            } else if (!snapshot.hasData || snapshot.data == null) {
              return const Center(child: Text('No user data available'));
            } else {
              UserData user = snapshot.data!;
              return Padding(
                padding: const EdgeInsets.all(3),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          ProfileBannerWidget(
                            screenSize: screenSize,
                            user: user,
                          ),
                        ],
                      ),
                      ProfilePropertiesScreen(screenSize: screenSize,)
                      // LogoutButtonWidget(profileScreenBloc: profileScreenBloc,screenSize: screenSize,)
                    ],
                  ),
                ),
              );
            }
          },
        );
      },
    );
  }
}

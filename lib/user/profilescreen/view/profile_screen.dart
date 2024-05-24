import 'package:auto_mates/user/authentications/controller/functions/fuctions.dart';
import 'package:auto_mates/user/commonwidgets/no_data_error_placeholder/no_data_error_placeholder.dart';
import 'package:auto_mates/user/favourite_screen/view/favourite_screen/favourite_screen.dart';
import 'package:auto_mates/user/profilescreen/controller/functions.dart';
import 'package:auto_mates/user/profilescreen/view/bloc/profile_screen_bloc.dart';
import 'package:auto_mates/user/profilescreen/view/widgets/logout_section/loging_out_screen_widget.dart';
import 'package:auto_mates/user/profilescreen/view/widgets/profile_properties/profile_properties_screen.dart';
import 'package:auto_mates/user/profilescreen/view/widgets/user_banner/profile_banner_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key, required this.screenSize,});
  final Size screenSize;

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late Future<UserData?> fetch;
  @override
  void initState() {
    fetch=fetchUserDetails();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final ProfileScreenBloc profileScreenBloc = ProfileScreenBloc();
    return BlocConsumer<ProfileScreenBloc, ProfileScreenState>(
      bloc: profileScreenBloc,
      listener: (context, state)async {
        if (state is LogoutButtonClickedActionState) {
          logoutAlertMessage(
              context: context, profileScreenBloc: profileScreenBloc);
        } else if (state is ConfirmLogoutActionState) {
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => LogingOutScreenWidget(screenSize: widget.screenSize,seller: false,),
          ));
        }else if (state is FavouriteConatinerClickedActionState){
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => FavouriteScreen(screenSize: widget.screenSize,),
          ));
        }
      },
      builder: (context, state) {
        return FutureBuilder(
          future: fetch,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return NoDataErrorPlaceholder(screenSize: widget.screenSize, titleText: 'Error Loading State');
            } else if (!snapshot.hasData || snapshot.data == null) {
              return NoDataErrorPlaceholder(screenSize: widget.screenSize, titleText: 'Error Loading State');
            } else {
              UserData user = snapshot.data!;
              return Padding(
                padding: const EdgeInsets.all(3),
                child: Column(
                  children: [
                    ProfileBannerWidget(
                      screenSize: widget.screenSize,
                      user: user,
                    ),
                    ProfilePropertiesScreen(screenSize: widget.screenSize,profileScreenBloc: profileScreenBloc,),
                    
                  ],
                ),
              );
            }
          },
        );     
      },
    );
  }
}

// ignore_for_file: use_build_context_synchronously

import 'package:auto_mates/user/authentications/controller/functions/fuctions.dart';
import 'package:auto_mates/user/commonwidgets/no_data_error_placeholder/no_data_error_placeholder.dart';
import 'package:auto_mates/user/emicalculator/view/emi_calculator_screen.dart';
import 'package:auto_mates/user/profilescreen/view/widgets/compare_car/compare_cars.dart';
import 'package:auto_mates/user/profilescreen/view/widgets/favourite_screen/favourite_screen/favourite_screen.dart';
import 'package:auto_mates/user/profilescreen/controller/functions.dart';
import 'package:auto_mates/user/profilescreen/view/bloc/profile_screen_bloc.dart';
import 'package:auto_mates/user/profilescreen/view/widgets/favourite_seller/favourite_seller_screen.dart';
import 'package:auto_mates/user/profilescreen/view/widgets/interested_cars/interested_cars_screen.dart';
import 'package:auto_mates/user/profilescreen/view/widgets/points_card/points_card.dart';
import 'package:auto_mates/user/profilescreen/view/widgets/profile_properties/profile_properties_screen.dart';
import 'package:auto_mates/user/profilescreen/view/widgets/user_banner/profile_banner_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({
    super.key,
    required this.screenSize,
  });
  final Size screenSize;

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late Future<UserData?> fetch;
  @override
  void initState() {
    fetch = fetchUserDetails();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final ProfileScreenBloc profileScreenBloc = ProfileScreenBloc();
    return BlocConsumer<ProfileScreenBloc, ProfileScreenState>(
      bloc: profileScreenBloc,
      listener: (context, state) async {
        if (state is FavouriteConatinerClickedActionState) {
          UserData? userData = await fetchUserDetails();
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => FavouriteScreen(
              screenSize: widget.screenSize,
              userContact: userData!.mobile,
            ),
          ));
        } else if (state is InterestedCarConatinerClickedActionState) {
          final sharedPref = await SharedPreferences.getInstance();
          dynamic mobile = sharedPref.getString('mobile');
          UserData? userData = await fetchUserDetails();
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => InterestedCarsScreen(
              userId: userData!.id,
              userContact: mobile,
              screenSize: widget.screenSize,
              profileScreenBloc: profileScreenBloc,
            ),
          ));
        } else if (state is FavouriteSellerContainerClickedState) {
          UserData? userData = await fetchUserDetails();
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => FavouriteSellerScreen(
                    screenSize: widget.screenSize,
                    userContact: userData!.mobile,
                  )));
        } else if (state is EmiCalculatorConatinerClickedState) {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) =>
                  EmiCalculatorScreen(screenSize: widget.screenSize)));
        } else if (state is CompareCarsContainerClickedState) {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => CompareCars(
                    screenSize: widget.screenSize,
                  )));
        }
      },
      builder: (context, state) {
        return FutureBuilder(
          future: fetch,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Scaffold(backgroundColor: Colors.white,body: SizedBox.shrink());
            } else if (snapshot.hasError) {
              return NoDataErrorPlaceholder(
                  screenSize: widget.screenSize,
                  titleText: 'Error Loading State');
            } else if (!snapshot.hasData || snapshot.data == null) {
              return NoDataErrorPlaceholder(
                  screenSize: widget.screenSize,
                  titleText: 'Error Loading State');
            } else {
              UserData user = snapshot.data!;
              return Scaffold(
                backgroundColor: Colors.white,
                body: Padding(
                  padding: const EdgeInsets.all(3),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [                     
                      ProfileBannerWidget(
                        screenSize: widget.screenSize,
                        user: user,
                      ),
                      PointsCard(screenSize: widget.screenSize,user: user,),
                      ProfilePropertiesScreen(
                        screenSize: widget.screenSize,
                        profileScreenBloc: profileScreenBloc,
                      ),
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

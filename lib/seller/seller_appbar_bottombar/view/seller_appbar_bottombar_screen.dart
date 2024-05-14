import 'package:auto_mates/seller/seller_appbar_bottombar/view/bloc/sellerappbottom_bloc.dart';
import 'package:auto_mates/seller/seller_appbar_bottombar/view/widgets/seller_screen_appbar_widget.dart';
import 'package:auto_mates/seller/seller_homescreen/view/seller_home_screen.dart';
import 'package:auto_mates/seller/seller_profile_screen/view/seller_profile_screen.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

class Sellerappbarbottombar extends StatefulWidget {
  const Sellerappbarbottombar({super.key});

  @override
  State<Sellerappbarbottombar> createState() => _SellerappbarbottombarState();
}

class _SellerappbarbottombarState extends State<Sellerappbarbottombar> {
  final SellerappbottomBloc sellerAppBottomBloc = SellerappbottomBloc();

  int sellertabIndex=0;
  List sellerTabs=[
    const SellerHomeScreen(),
    const SellerHomeScreen(),
    const SellerProfileScreen(),
  ];

  @override
  void initState() {
    sellerAppBottomBloc.add(SellerAppBottomBarInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SellerappbottomBloc, SellerappbottomState>(
      bloc: sellerAppBottomBloc,
      listener: (context, state) {
        
      },
      builder: (context, state) {
        final screenSize = MediaQuery.of(context).size;
        switch(state.runtimeType){
          case const (SellerAppbottombarLoadingState) :
          return Scaffold(
              backgroundColor: const Color(0xFFDBEDF5),
              body: Center(
                child: LottieBuilder.asset(
                  'assets/animations/loading_animation.json',
                  height: screenSize.height / 10,
                  width: screenSize.width / 4,
                  repeat: true,
                ),
              ),
            );
          case const (SellerAppbottombarLoadedSuccessState):
          return Scaffold(
          appBar: const PreferredSize(
            preferredSize: Size.fromHeight(80),
            child: SellerScreenAppbarWidget()
          ),
          body: sellerTabs[sellertabIndex],
          bottomNavigationBar: CurvedNavigationBar(
            animationCurve: Easing.standard,
            backgroundColor: Colors.white,
            buttonBackgroundColor: const Color.fromARGB(255, 100, 206, 248),
            color: const Color.fromARGB(255, 36, 167, 248),
            items: const [
              CurvedNavigationBarItem(
                child: Icon(
                  Icons.home_rounded,
                  color: Colors.black,
                ),
                label: 'Home',
                labelStyle:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              CurvedNavigationBarItem(
                child: Icon(Icons.message_rounded),
                label: 'Chat',
                labelStyle:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              CurvedNavigationBarItem(
                child: Icon(Icons.perm_identity),
                label: 'Profile',
                labelStyle:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ],
            onTap: (index) {
              setState(() {
                sellertabIndex=index;
              });
            },            
          ),
        );
        default:
        return const SizedBox();
        }
      },
    );
  }
}

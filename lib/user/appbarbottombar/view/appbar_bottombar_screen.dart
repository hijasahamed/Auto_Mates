import 'package:auto_mates/user/appbarbottombar/controller/bloc/appbottombar_bloc.dart';
import 'package:auto_mates/user/appbarbottombar/view/widgets/app_bar_widget.dart';
import 'package:auto_mates/user/appbarbottombar/view/widgets/drawer_widget.dart';
import 'package:auto_mates/user/buyscreentab/view/buy_screen.dart';
import 'package:auto_mates/user/homescreen/view/home_screen.dart';
import 'package:auto_mates/user/profilescreen/view/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

int tabIndex = 0;

class AppbarBottomTabSwitchScreen extends StatefulWidget {
  const AppbarBottomTabSwitchScreen({super.key});

  @override
  State<AppbarBottomTabSwitchScreen> createState() =>
      _AppbarBottomTabSwitchScreenState();
}

class _AppbarBottomTabSwitchScreenState
    extends State<AppbarBottomTabSwitchScreen> {
  @override
  void initState() {
    appbottombarBloc.add(AppBottomBarInitialEvent());
    tabIndex = 0;
    super.initState();
  }

  final AppbottombarBloc appbottombarBloc = AppbottombarBloc();

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    List tabs = [
      const HomeScreen(),
      const BuyScreen(),
      const BuyScreen(),
      const ProfileScreen(),
    ];
    return BlocConsumer<AppbottombarBloc, AppbottombarState>(
      bloc: appbottombarBloc,
      listener: (context, state) {},
      builder: (context, state) {
        switch (state.runtimeType) {
          case AppbottombarLoadingState:  
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
          case AppbottombarLoadedSuccessState:
            return BlocBuilder<AppbottombarBloc, AppbottombarState>(
              builder: (context, state) {
                return Scaffold(
                    appBar: PreferredSize(
                        preferredSize: tabIndex == 1
                            ? const Size.fromHeight(110)
                            : const Size.fromHeight(85),
                        child: AppBarWidget(
                          screenSize: screenSize,
                          tabIndex: tabIndex,
                        )),
                    bottomNavigationBar: BlocBuilder<AppbottombarBloc, AppbottombarState>(
                      builder: (context, state) {
                        return BottomNavigationBar(
                          elevation: 10,
                          currentIndex: tabIndex,
                          onTap: (index) {
                            setState(() {
                              tabIndex = index;
                            });
                            // tabIndex=index;
                            // appbottombarBloc.add(OntapIndexChangeEvent());
                          },
                          items: const [
                            BottomNavigationBarItem(
                              icon: Icon(Icons.home),
                              label: 'Home',
                            ),
                            BottomNavigationBarItem(
                              icon: Icon(Icons.car_rental),
                              label: 'Buy',
                            ),
                            BottomNavigationBarItem(
                              icon: Icon(Icons.newspaper),
                              label: 'News',
                            ),
                            BottomNavigationBarItem(
                              icon: Icon(Icons.person),
                              label: 'Profile',
                            ),
                          ],
                          selectedItemColor:
                              const Color.fromARGB(255, 76, 207, 239),
                          selectedFontSize: 15,
                          selectedLabelStyle: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                          showUnselectedLabels: true,
                          showSelectedLabels: true,
                          unselectedItemColor: const Color(0xFF424141),
                          unselectedLabelStyle:
                              const TextStyle(fontWeight: FontWeight.bold),
                        );
                      },
                    ),
                    body: tabs[tabIndex],
                    drawer: DrawerWidget(screenSize: screenSize));
              },
            );
          default:
            return const SizedBox();
        }
      },
    );
  }
}

import 'package:auto_mates/appbarbottombar/controller/bloc/appbottombar_bloc.dart';
import 'package:auto_mates/appbarbottombar/view/widgets/app_bar_widget.dart';
import 'package:auto_mates/appbarbottombar/view/widgets/drawer_widget.dart';
import 'package:auto_mates/buyscreentab/view/buy_screen.dart';
import 'package:auto_mates/homescreen/view/home_screen.dart';
import 'package:auto_mates/profilescreen/view/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

int tabIndex = 0;

class AppbarBottomTabSwitchScreen extends StatelessWidget {
  const AppbarBottomTabSwitchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    List tabs = [
      const HomeScreen(),
      const BuyScreen(),
      const BuyScreen(),
      const ProfileScreen(),
    ];
    final AppbottombarBloc appbottombarBloc = AppbottombarBloc();

    return BlocBuilder<AppbottombarBloc, AppbottombarState>(
      bloc: appbottombarBloc,
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
            bottomNavigationBar: BottomNavigationBar(
              elevation: 10,
              currentIndex: tabIndex,
              onTap: (index) {
                tabIndex = index;
                appbottombarBloc.add(OntapIndexChangeEvent());
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
              selectedItemColor: const Color.fromARGB(255, 76, 207, 239),
              selectedFontSize: 15,
              selectedLabelStyle: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
              showUnselectedLabels: true,
              showSelectedLabels: true,
              unselectedItemColor: const Color(0xFF424141),
              unselectedLabelStyle:
                  const TextStyle(fontWeight: FontWeight.bold),
            ),
            body: tabs[tabIndex],
            drawer: DrawerWidget(screenSize: screenSize));
      },
    );
  }
}
import 'package:auto_mates/user/appbarbottombar/controller/bloc/appbottombar_bloc.dart';
import 'package:auto_mates/user/appbarbottombar/view/widgets/app_bar_widget.dart';
import 'package:auto_mates/user/appbarbottombar/view/widgets/drawer_widget.dart';
import 'package:auto_mates/user/buyscreentab/view/buy_screen/buy_screen.dart';
import 'package:auto_mates/user/homescreen/view/home_screen.dart';
import 'package:auto_mates/user/news/news_screen.dart';
import 'package:auto_mates/user/profilescreen/view/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppbarBottomTabSwitchScreen extends StatefulWidget {
  const AppbarBottomTabSwitchScreen({
    super.key,
    required this.isAccountCreated,
  });
  final bool isAccountCreated;
  @override
  State<AppbarBottomTabSwitchScreen> createState() =>
      _AppbarBottomTabSwitchScreenState();
}

class _AppbarBottomTabSwitchScreenState
    extends State<AppbarBottomTabSwitchScreen> {
  @override
  void initState() {
    tabIndex = 0;
    super.initState();
  }

  int tabIndex = 0;
  final AppbottombarBloc appbottombarBloc = AppbottombarBloc();

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    List tabs = [
      HomeScreen(
        screenSize: screenSize,
      ),
      const BuyScreen(),
      const NewsScreen(),
      ProfileScreen(
        screenSize: screenSize,
      ),
    ];
    return BlocConsumer<AppbottombarBloc, AppbottombarState>(
      bloc: appbottombarBloc,
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
            appBar: PreferredSize(
                preferredSize: tabIndex == 1
                    ? const Size.fromHeight(85)
                    : const Size.fromHeight(70),
                child: AppBarWidget(
                  screenSize: screenSize,
                  tabIndex: tabIndex,
                )),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: tabIndex,
              onTap: (index) {
                setState(() {
                  tabIndex = index;
                });
              },
              items: const [
                BottomNavigationBarItem(
                  backgroundColor: Colors.white,
                  icon: Icon(Icons.home),
                  label: 'HOME',
                ),
                BottomNavigationBarItem(
                  backgroundColor: Colors.white,
                  icon: Icon(Icons.car_rental),
                  label: 'BUY',
                ),
                BottomNavigationBarItem(
                  backgroundColor: Colors.white,
                  icon: Icon(Icons.newspaper),
                  label: 'NEWS',
                ),
                BottomNavigationBarItem(
                  backgroundColor: Colors.white,
                  icon: Icon(Icons.person),
                  label: 'PROFILE',
                ),
              ],
              selectedItemColor: const Color.fromARGB(255, 76, 207, 239),
              selectedFontSize: 17,
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

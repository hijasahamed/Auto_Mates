import 'package:auto_mates/user/appbarbottombar/controller/bloc/appbottombar_bloc.dart';
import 'package:auto_mates/user/appbarbottombar/view/widgets/app_bar_widget.dart';
import 'package:auto_mates/user/appbarbottombar/view/widgets/drawer_widget.dart';
import 'package:auto_mates/user/appbarbottombar/view/widgets/loading_state_widget.dart';
import 'package:auto_mates/user/buyscreentab/view/buy_screen/buy_screen.dart';
import 'package:auto_mates/user/homescreen/view/home_screen.dart';
import 'package:auto_mates/user/news/news_screen.dart';
import 'package:auto_mates/user/profilescreen/view/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppbarBottomTabSwitchScreen extends StatefulWidget {
  const AppbarBottomTabSwitchScreen(
      {super.key, required this.isAccountCreated});
  final bool isAccountCreated;
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
        switch (state.runtimeType) {
          case const (AppbottombarLoadingState):
            return LoadingStateWidget(
                isAccountCreated: widget.isAccountCreated,
                screenSize: screenSize);
          case const (AppbottombarLoadedSuccessState):
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
                    bottomNavigationBar:
                        BlocBuilder<AppbottombarBloc, AppbottombarState>(
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
                          selectedFontSize: 17,
                          selectedLabelStyle: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                          showUnselectedLabels: true,
                          showSelectedLabels: true,
                          unselectedItemColor: const Color(0xFF424141),
                          unselectedLabelStyle:
                              const TextStyle(fontWeight: FontWeight.bold),
                        );
                        /* return CurvedNavigationBar(
                          
                          animationCurve: Easing.standard,
                          backgroundColor: Colors.white,
                          buttonBackgroundColor: const Color.fromARGB(255, 100, 206, 248),
                          color: const Color.fromARGB(255, 36, 167, 248),
                          items: const [
                            CurvedNavigationBarItem(
                              child: Icon(
                                Icons.home_rounded,
                                color: Color(0xFF424141),
                              ),
                              label: 'Home',
                              labelStyle: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            CurvedNavigationBarItem(
                              child: Icon(Icons.car_rental,
                                color: Color(0xFF424141),), 
                              label: 'Cars',
                              labelStyle: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            CurvedNavigationBarItem(
                              child: Icon(Icons.newspaper,
                                color: Color(0xFF424141),),
                              label: 'News',
                              labelStyle: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            CurvedNavigationBarItem(
                              child: Icon(Icons.person,
                                color: Color(0xFF424141),),
                              label: 'Profile',
                              labelStyle: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                          onTap: (index) {
                            setState(() {
                              tabIndex = index;
                            });
                          },
                        ); */
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

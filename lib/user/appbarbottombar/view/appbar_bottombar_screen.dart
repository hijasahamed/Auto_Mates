import 'package:auto_mates/user/appbarbottombar/controller/bloc/appbottombar_bloc.dart';
import 'package:auto_mates/user/appbarbottombar/view/widgets/appbar/app_bar_widget.dart';
import 'package:auto_mates/user/appbarbottombar/view/widgets/drawer/drawer_widget.dart';
import 'package:auto_mates/user/authentications/controller/functions/fuctions.dart';
import 'package:auto_mates/user/buyscreentab/view/buy_screen/buy_screen.dart';
import 'package:auto_mates/user/chatscreen/view/user_chat_screen/chat_screen.dart';
import 'package:auto_mates/user/commonwidgets/circular_indicator/circular_indicator_widget.dart';
import 'package:auto_mates/user/commonwidgets/no_data_error_placeholder/no_data_error_placeholder.dart';
import 'package:auto_mates/user/homescreen/view/home_screen.dart';
import 'package:auto_mates/user/profilescreen/controller/functions.dart';
import 'package:auto_mates/user/profilescreen/view/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppbarBottomTabSwitchScreen extends StatefulWidget {
  const AppbarBottomTabSwitchScreen({
    super.key,
  });
  @override
  State<AppbarBottomTabSwitchScreen> createState() =>
      _AppbarBottomTabSwitchScreenState();
}

class _AppbarBottomTabSwitchScreenState
    extends State<AppbarBottomTabSwitchScreen> {
  late Future<UserData?> fetch;
  int tabIndex = 0;
  final AppbottombarBloc appbottombarBloc = AppbottombarBloc();

  @override
  void initState(){
    tabIndex = 0;
    fetch = fetchUserDetails();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    List <Widget> buildSellerTabs(UserData data){
      return [
        HomeScreen(
        screenSize: screenSize,
      ),
      const BuyScreen(),
      UserChatScreen(
        screenSize: screenSize,
        userData: data,
      ),
      ProfileScreen(
        screenSize: screenSize,
      ),
      ];
    }
    return BlocConsumer<AppbottombarBloc, AppbottombarState>(
      bloc: appbottombarBloc,
      listener: (context, state) {},
      builder: (context, state) {
        return FutureBuilder(
          future: fetch,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularIndicatorWidget();
            } else if (snapshot.hasError) {
              return Scaffold(
                backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                body: Center(
                  child: Text('Error: ${snapshot.error}'),
                ),
              );
            } else if (!snapshot.hasData || snapshot.data == null) {
              return NoDataErrorPlaceholder(
                  screenSize: screenSize, titleText: 'No data found');
            } else {
              UserData data = snapshot.data!;
              List<Widget> userTabs = buildSellerTabs(data);
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
                        label: 'Home',
                      ),
                      BottomNavigationBarItem(
                        backgroundColor: Colors.white,
                        icon: Icon(Icons.car_rental),
                        label: 'Buy',
                      ),
                      BottomNavigationBarItem(
                        backgroundColor: Colors.white,
                        icon: Icon(Icons.newspaper),
                        label: 'Chats',
                      ),
                      BottomNavigationBarItem(
                        backgroundColor: Colors.white,
                        icon: Icon(Icons.person),
                        label: 'Profile',
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
                  body: userTabs[tabIndex],
                  drawer: DrawerWidget(screenSize: screenSize));
            }
          },
        );
      },
    );
  }
}

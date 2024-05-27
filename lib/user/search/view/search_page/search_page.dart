import 'package:auto_mates/user/appbarbottombar/controller/bloc/appbottombar_bloc.dart';
import 'package:auto_mates/user/appbarbottombar/view/widgets/app_bar_gradient_color.dart';
import 'package:auto_mates/user/search/view/search_car/search_car.dart';
import 'package:auto_mates/user/search/view/searchbar/search_bar_widget.dart';
import 'package:auto_mates/user/search/view/searched_page/searched_result_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchPage extends StatelessWidget {
  SearchPage(
      {super.key, required this.screenSize,});
  final Size screenSize;
  final ValueNotifier<TextEditingController> searchNotifier =
      ValueNotifier(TextEditingController());

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppbottombarBloc, AppbottombarState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            flexibleSpace: const AppBarGradientColor(),
            leading: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(
                Icons.arrow_back_ios_new_rounded,
                color: Colors.white,
              ),
            ),
            title: SearchBarWidget(
                screenSize: screenSize, searchnotifier: searchNotifier),
            actions: [
              IconButton(
                onPressed: () {
                  searchNotifier.value.clear();
                  searchNotifier.notifyListeners();
                },
                icon: const CircleAvatar(
                  radius: 15,
                  backgroundColor: Colors.white54,
                  child: Icon(
                    Icons.clear_rounded,
                    color: Color.fromARGB(255, 255, 255, 255),
                  ),
                ),
              ),
            ],
          ),
          body: ValueListenableBuilder<TextEditingController>(
            valueListenable: searchNotifier,
            builder: (context, controller, child) {
              return SizedBox(
                height: screenSize.height,
                child: controller.text.trim().isEmpty
                    ? SearchCar(screenSize: screenSize)
                    : SearchedResultPage(
                        screenSize: screenSize,
                        searchnotifier: searchNotifier,
                      ),
              );
            },
          ),
        );
      },
    );
  }
}

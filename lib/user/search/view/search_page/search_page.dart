import 'package:auto_mates/user/appbarbottombar/controller/bloc/appbottombar_bloc.dart';
import 'package:auto_mates/user/appbarbottombar/view/widgets/app_bar_gradient_color.dart';
import 'package:auto_mates/user/buyscreentab/view/buy_screen/filter_car_screen/filter_screen.dart';
import 'package:auto_mates/user/commonwidgets/my_text_widget/my_text_widget.dart';
import 'package:auto_mates/user/search/view/recommented_search_list/recommented_search_list.dart';
import 'package:auto_mates/user/search/view/searchbar/search_bar_widget.dart';
import 'package:auto_mates/user/search/view/searched_page/searched_result_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchPage extends StatelessWidget {
  SearchPage({
    super.key,
    required this.screenSize,
  });
  final Size screenSize;
  final ValueNotifier<TextEditingController> searchNotifier =
      ValueNotifier(TextEditingController());

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppbottombarBloc, AppbottombarState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            flexibleSpace: const AppBarGradientColor(),
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
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
                  FocusScope.of(context).unfocus();
                  searchNotifier.notifyListeners();
                },
                icon: const CircleAvatar(
                  radius: 15,
                  backgroundColor: Colors.white24,
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
                    ? RecommentedSearchList(screenSize: screenSize)
                    : SearchedResultPage(
                        screenSize: screenSize,
                        searchnotifier: searchNotifier,
                      ),
              );
            },
          ),
          bottomNavigationBar: BottomAppBar(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Material(
                borderRadius: BorderRadius.circular(8),
                color: Colors.transparent,
                child: Ink(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: const Color.fromARGB(255, 232, 232, 232),
                  ),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(8),
                    onTap: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) {
                        return FilterScreen(screenSize: screenSize);
                      },));
                    },
                    child: Center(
                      child: MyTextWidget(
                        text: 'Filter Your Search',
                        color: const Color.fromARGB(255, 103, 103, 103),
                        size: screenSize.width / 28,
                        weight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

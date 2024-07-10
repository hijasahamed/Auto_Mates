import 'package:auto_mates/user/commonwidgets/my_text_widget/my_text_widget.dart';
import 'package:auto_mates/user/profilescreen/controller/functions.dart';
import 'package:auto_mates/user/profilescreen/view/bloc/profile_screen_bloc.dart';
import 'package:auto_mates/user/search/view/search_page/search_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AllCarsToSelectBackButton extends StatelessWidget {
  const AllCarsToSelectBackButton({super.key, required this.screenSize,required this.carSelectionScreen,required this.compareCarsBlocInstance});
  final Size screenSize;
  final ProfileScreenBloc carSelectionScreen;
  final ProfileScreenBloc compareCarsBlocInstance;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
            onPressed: () {
              carForComparing1.clear();
              carForComparing2.clear();
              compareCarsBlocInstance.add(CompareCarScreenRefreshEvent());
              Navigator.pop(context);
            },
            icon: const Icon(Icons.clear)),
        MyTextWidget(
            text: 'select car for comparison',
            color: Colors.grey,
            size: screenSize.width / 30,
            weight: FontWeight.bold),
        SizedBox(
          width: screenSize.width / 30,
        ),
        BlocBuilder<ProfileScreenBloc, ProfileScreenState>(
          bloc: carSelectionScreen,
          builder: (context, state) {
            return MyTextWidget(
                text: '${carForComparing1.length + carForComparing2.length}/2',
                color: Colors.blueGrey,
                size: screenSize.width / 22,
                weight: FontWeight.bold);
          },
        ),
        const Spacer(),
        IconButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => SearchPage(screenSize: screenSize,isFromComaprisonScreen: true,carSelectionScreen: carSelectionScreen,)));
          }, 
          icon: const Icon(Icons.search,color: Colors.blueGrey,)
        )
      ],
    );
  }
}

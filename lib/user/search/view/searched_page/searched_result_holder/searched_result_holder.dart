import 'package:auto_mates/user/commonwidgets/my_text_widget/my_text_widget.dart';
import 'package:auto_mates/user/profilescreen/controller/functions.dart';
import 'package:auto_mates/user/profilescreen/view/bloc/profile_screen_bloc.dart';
import 'package:flutter/material.dart';

class SearchedResultHolder extends StatelessWidget {
  const SearchedResultHolder(
      {super.key,
      required this.screenSize,
      required this.data,
      this.carSelectionScreen});
  final Size screenSize;
  final dynamic data;
  final ProfileScreenBloc? carSelectionScreen;
  @override
  Widget build(BuildContext context) {
    bool isSelected = carForComparing1.any(
            (comparedCar) => comparedCar['regNumber'] == data['regNumber']) ||
        carForComparing2.any(
            (comparedCar) => comparedCar['regNumber'] == data['regNumber']);
    Color carContainerColor =
        isSelected ? const Color.fromARGB(255, 194, 231, 248) : Colors.white;
    return Card(
      color: carContainerColor,
      elevation: 5,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10)),
            child: FadeInImage(
                fadeInDuration: const Duration(milliseconds: 750),
                height: screenSize.height / 6,
                width: screenSize.width,
                placeholder: const AssetImage(
                  'assets/images/image placeholder.jpeg',
                ),
                placeholderFit: BoxFit.cover,
                imageErrorBuilder: (context, error, stackTrace) {
                  return const CircularProgressIndicator(
                    color: Colors.blue,
                  );
                },
                image: NetworkImage(data['thumbnail']),
                fit: BoxFit.cover,
                filterQuality: FilterQuality.high),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 4),
            child: Row(
              children: [
                MyTextWidget(
                  text: '${data['brand']}',
                  color: Colors.black,
                  size: 19,
                  weight: FontWeight.w600,
                ),
                SizedBox(
                  width: screenSize.width / 100,
                ),
                Expanded(
                  child: MyTextWidget(
                    text: '${data['modelName']}',
                    color: const Color.fromARGB(255, 75, 76, 76),
                    size: 15,
                    weight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:auto_mates/user/commonwidgets/my_text_widget/my_text_widget.dart';
import 'package:auto_mates/user/profilescreen/controller/functions.dart';
import 'package:auto_mates/user/profilescreen/view/bloc/profile_screen_bloc.dart';
import 'package:auto_mates/user/profilescreen/view/widgets/compare_car/compared_screen/car_compared_screen.dart';
import 'package:flutter/material.dart';

class PreviousNotEmptyScreen extends StatelessWidget {
  const PreviousNotEmptyScreen(
      {super.key,
      required this.screenSize,
      required this.compareCarsBlocInstance,
      required this.previousComparisonBlocInstance});
  final Size screenSize;
  final ProfileScreenBloc compareCarsBlocInstance,
      previousComparisonBlocInstance;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          carForComparing1.add(previousComparisonList[0]);
          carForComparing2.add(previousComparisonList[1]);
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => CarComparedScreen(
                    screenSize : screenSize,
                    compareCarsBlocInstance : compareCarsBlocInstance,
                    previousComparisonBlocInstance : previousComparisonBlocInstance,
                  )));
        },
        child: Container(
          decoration: BoxDecoration(
              color: const Color.fromARGB(255, 236, 236, 236),
              borderRadius: BorderRadius.circular(6)),
          child: Row(
            children: [
              previousCarOne(),
              SizedBox(width: screenSize.width / 145,),
              previousCarTwo()
            ],
          ),
        ),
      ),
    );
  }

  Widget previousCarOne(){
    return Expanded(
      child: Column(
        children: [
          Expanded(
            child: SizedBox(
              width: screenSize.width,
              child: Image.network(
                previousComparisonList[0]['thumbnail'],
                fit: BoxFit.cover,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) {
                    return child;
                  } else {
                    return Center(
                      child: CircularProgressIndicator(
                        color: Colors.blue,
                        value: loadingProgress.expectedTotalBytes !=
                                null
                            ? loadingProgress.cumulativeBytesLoaded /
                                (loadingProgress.expectedTotalBytes ??
                                    1)
                            : null,
                      ),
                    );
                  }
                },
                errorBuilder: (context, error, stackTrace) {
                  return const Center(
                    child: Text('Image not available'),
                  );
                },
              ),
            ),
          ),
          MyTextWidget(
              text: previousComparisonList[0]['brand'],
              color: Colors.black,
              size: screenSize.width / 30,
              weight: FontWeight.bold),
          MyTextWidget(
              text: previousComparisonList[0]['modelName'],
              color: Colors.black,
              size: screenSize.width / 35,
              weight: FontWeight.bold),
        ],
      ),
    );
  }

  Widget previousCarTwo(){
    return Expanded(
      child: Column(
        children: [
          Expanded(
            child: SizedBox(
              width: screenSize.width,
              child: Image.network(
                previousComparisonList[1]['thumbnail'],
                fit: BoxFit.cover,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) {
                    return child;
                  } else {
                    return Center(
                      child: CircularProgressIndicator(
                        color: Colors.blue,
                        value: loadingProgress.expectedTotalBytes !=
                                null
                            ? loadingProgress.cumulativeBytesLoaded /
                                (loadingProgress.expectedTotalBytes ??
                                    1)
                            : null,
                      ),
                    );
                  }
                },
                errorBuilder: (context, error, stackTrace) {
                  return const Center(
                    child: Text('Image not available'),
                  );
                },
              ),
            ),
          ),
          MyTextWidget(
              text: previousComparisonList[1]['brand'],
              color: Colors.black,
              size: screenSize.width / 30,
              weight: FontWeight.bold),
          MyTextWidget(
              text: previousComparisonList[1]['modelName'],
              color: Colors.black,
              size: screenSize.width / 35,
              weight: FontWeight.bold),
        ],
      ),
    );
  }

}

import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class Skeleton extends StatelessWidget {
  const Skeleton({super.key, this.height, this.width});

  final double? height, width;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: const Color.fromARGB(255, 198, 197, 197),
      highlightColor: const Color.fromARGB(255, 249, 249, 249),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: height,
          width: width,
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
              color: Colors.black.withOpacity(.6),
              borderRadius: const BorderRadius.all(Radius.circular(5))),
        ),
      ),
    );
  }
}

class SkelotonIndicator extends StatelessWidget {
  const SkelotonIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Row(
        children: [
          Skeleton(height: 120, width: 120),
          SizedBox(
            width: 5,
          ),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Skeleton(width: 80),
              SizedBox(height: 5),
              Skeleton(),
              SizedBox(height: 5),
              Skeleton(),
              SizedBox(height: 5),
              Row(
                children: [
                  Expanded(
                    child: Skeleton(),
                  ),
                  SizedBox(width: 5),
                  Expanded(
                    child: Skeleton(),
                  ),
                ],
              )
            ],
          ))
        ],
      ),
    );
  }
}

class SkelotonIndicatorGrid extends StatelessWidget {
  const SkelotonIndicatorGrid({super.key,required this.screenSize});
 final Size screenSize;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: 6,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: .75,
        mainAxisSpacing: 3,
        crossAxisSpacing: 3,
        crossAxisCount: 2,
      ),
      itemBuilder: (context, index) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Skeleton(height: screenSize.height/6,width: screenSize.width/2.1,),
            Skeleton(height: screenSize.height/80,width: screenSize.width/2.1,),
            Skeleton(height: screenSize.height/80,width: screenSize.width/3.3,),
            Skeleton(height: screenSize.height/80,width: screenSize.width/4,),
          ],
        );
      },
    );
  }
}

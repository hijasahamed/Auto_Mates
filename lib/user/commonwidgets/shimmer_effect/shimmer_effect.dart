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

class SkelotonIndicatorList extends StatelessWidget {
  const SkelotonIndicatorList({super.key,required this.screenSize,required this.itemCount});
  final Size screenSize;
  final int itemCount;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: itemCount,
      itemBuilder: (context, index) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Skeleton(height: screenSize.height/7.2,width: screenSize.width/2.9,),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Skeleton(height: screenSize.height/80,width: screenSize.width/4,),
                  Skeleton(height: screenSize.height/80,width: screenSize.width/1.9,),
                  Skeleton(height: screenSize.height/80,width: screenSize.width/1.9,),
                  Row(
                    children: [
                      Skeleton(height: screenSize.height/80,width: screenSize.width/4.2,),
                      Skeleton(height: screenSize.height/80,width: screenSize.width/4.2,),
                    ],
                  )
                ],
              ),
            )
          ],
        );
      },
    );
  }
}

class SkelotonIndicatorGrid extends StatelessWidget {
  const SkelotonIndicatorGrid({super.key,required this.screenSize,this.isFromSimilers});
 final Size screenSize;
 final bool? isFromSimilers;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: (isFromSimilers==true)?2:6,
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

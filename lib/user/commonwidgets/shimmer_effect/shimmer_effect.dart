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


class SkelotonIndicatorListForChats extends StatelessWidget {
  const SkelotonIndicatorListForChats({super.key,required this.screenSize,required this.itemCount});
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
            Skeleton(height: screenSize.height/12.5,width: screenSize.width/5,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Skeleton(height: screenSize.height/50,width: screenSize.width/1.5,),
                Skeleton(height: screenSize.height/60,width: screenSize.width/2.1,),
              ],
            )
          ],
        );
      },
    );
  }
}


class SkelotonChatLoader extends StatelessWidget {
  const SkelotonChatLoader({super.key,required this.screenSize});
  final Size screenSize;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Skeleton(height: screenSize.height/12.5,width: screenSize.width/5,),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Skeleton(height: screenSize.height/50,width: screenSize.width/1.5,),
            Skeleton(height: screenSize.height/60,width: screenSize.width/2.1,),
          ],
        )
      ],
    );
  }
}

class SkelotonIndicatorForSellerAllCars extends StatelessWidget {
  const SkelotonIndicatorForSellerAllCars({super.key,required this.screenSize});
  final Size screenSize;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          SizedBox(
            height: screenSize.height/4.2,
            width: screenSize.width,
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Skeleton(height: screenSize.height/50,width: screenSize.width/2.5,),
                    Skeleton(height: screenSize.height/50,width: screenSize.width/2.8,),
                    Skeleton(height: screenSize.height/50,width: screenSize.width/3,),
                    Skeleton(height: screenSize.height/50,width: screenSize.width/2.3),
                    Skeleton(height: screenSize.height/50,width: screenSize.width/2.6,),
                    Skeleton(height: screenSize.height/50,width: screenSize.width/2.2,),
                  ],
                ),
                const Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Skeleton(height: screenSize.height/50,width: screenSize.width/10),
                    Skeleton(height: screenSize.height/7,width: screenSize.width/2.5),
                  ],
                )
              ],
            ),
          ),
          SizedBox(height: screenSize.height/100,),
          Skeleton(height: screenSize.height/50,width: screenSize.width/1.5),
          SizedBox(height: screenSize.height/100,),
          SizedBox(
            height: screenSize.height/2,
            width: screenSize.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Skeleton(height: screenSize.height/5,width: screenSize.width),
                Skeleton(height: screenSize.height/50,width: screenSize.width/2.5,),
                Skeleton(height: screenSize.height/50,width: screenSize.width/2.8,),
              ],
            ),
          )
        ],
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class Skeleton extends StatelessWidget {
  const Skeleton({super.key, this.height, this.width});

  final double? height, width;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: height,
          width: width,
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
              color: Colors.black.withOpacity(.6),
              borderRadius:
                  const BorderRadius.all(Radius.circular(5))),
        ),
      ),
    );
  }
}

class SkelotonIndicator extends StatelessWidget {
  const SkelotonIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Skeleton(height: 120, width: 120),
        SizedBox(width: 5,),
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
                children:  [
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
          )
        )
      ],
    );
  }
}
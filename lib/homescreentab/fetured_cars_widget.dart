import 'package:flutter/material.dart';

class FeaturedCarsWidget extends StatelessWidget {
  const FeaturedCarsWidget({super.key,required this.screenSize});
  final Size screenSize;
  @override
  Widget build(BuildContext context) {
    
return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const Text('Featured cars',style: TextStyle(fontSize: 25,color: Color(0xFF424141),fontWeight: FontWeight.bold),),
                Container(
                height: 20,
                width: 50,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),color: Colors.green),
                child: const Center(child: Text('Promoted',style: TextStyle(fontSize: 10,color: Colors.white,fontWeight: FontWeight.bold),))
              ),
              ],
            ),
            TextButton(onPressed: (){}, child: const Text('View All',style: TextStyle(fontWeight: FontWeight.w600,color: Colors.blue),), )
          ],
        ),
        Container(
          height: screenSize.height/5.5,
          width: screenSize.width,
          child: ListView.builder(
            itemCount: 5,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: Container(  
                      height: screenSize.height/6,                 
                      width: screenSize.width/2.16,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        image: const DecorationImage(
                          image: NetworkImage('https://cdni.autocarindia.com/Utils/ImageResizer.ashx?n=https://cdni.autocarindia.com/ExtraImages/20230703022329_Virtus.jpg'),
                          fit: BoxFit.cover
                        )
                      ),
                    ),
                  ),
                  Positioned(
                  bottom: 0,
                  right: 0,
                    child: Container(
                      height: 30,
                      width: screenSize.width/2.15,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(50),color: Color(0xFFDBEDF5)),
                      child: const Center(child: Text('₹16.25 Lakh',style: TextStyle(fontWeight: FontWeight.bold,color: Color(0xFF424141)),)),
                    )
                  ),
                  Positioned(    
                    bottom: 33,
                    left: 7,                  
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.black45,
                      ),
                      child: const Text("volkswagen Virtus Gt",style: TextStyle(fontSize: 15,color: Colors.white,fontWeight: FontWeight.bold),)
                    ),
                  ),
                ],
              );
            },
          ),
        )
      ],
    );
  }
}
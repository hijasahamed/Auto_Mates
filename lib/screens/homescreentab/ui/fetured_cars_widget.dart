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
                SizedBox(width: screenSize.width/40,),
                Container(
                height: 20,
                width: 50,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),color: Colors.green),
                child: const Center(child: Text('Promoted',style: TextStyle(fontSize: 9,color: Colors.white,fontWeight: FontWeight.bold),))
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
                          image: NetworkImage('https://www.topgear.com/sites/default/files/cars-car/carousel/2021/05/210302sclassjl_0084.jpg'),
                          fit: BoxFit.cover
                        )
                      ),
                    ),
                  ),
                  Positioned(
                  bottom: 1,
                  right: 0,
                    child: Container(
                      height: 30,
                      width: screenSize.width/2.16,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(50),color: Color(0xFFDBEDF5)),
                      child: const Center(child: Text('₹1.65 Cr',style: TextStyle(fontWeight: FontWeight.bold,color: Color(0xFF424141)),)),
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
                      child: const Text("Mercedes-Benz S-Class",style: TextStyle(fontSize: 15,color: Colors.white,fontWeight: FontWeight.bold),)
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
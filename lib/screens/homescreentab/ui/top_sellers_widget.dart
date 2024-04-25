import 'package:flutter/material.dart';

class TopSellersWidget extends StatelessWidget {
  const TopSellersWidget({super.key,required this.screenSize});
  final Size screenSize;
  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Top sellers',style: TextStyle(fontSize: 25,color: Color(0xFF424141),fontWeight: FontWeight.bold),),             
            TextButton(onPressed: (){}, child: const Text('View All',style: TextStyle(fontWeight: FontWeight.w600,color: Colors.blue),), )
          ],
        ),
        SizedBox(
          height: screenSize.height/5.5,
          width: screenSize.width,
          child: ListView.builder(
            itemCount: 5,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context,index) {
              return Padding(
                padding: const EdgeInsets.all(4),
                child: Stack(
                  children: [
                    Container(                   
                      width: screenSize.width/1.6,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        image: const DecorationImage(
                          image: NetworkImage('https://www.spyne.ai/blogs/wp-content/uploads/2023/02/used-car-dealership-fi.jpg'),
                          fit: BoxFit.cover
                        )
                      ),
                    ),
                     Positioned(
                      bottom: 3,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.black45,
                        ),
                        child: const Text("Sini's AutoMates",style: TextStyle(fontSize: 15,color: Colors.white,fontWeight: FontWeight.bold),)
                      ),
                    ),
                    Positioned(
                      top: 9,
                      left: 5,
                      child: Container(
                        height: screenSize.height/32,
                        width: screenSize.width/8,
                        decoration: BoxDecoration(
                          color: const Color(0xFF1888FE),
                          borderRadius: BorderRadius.circular(2)
                        ),                        
                        child: const Row(
                          children: [
                            Icon(Icons.star,color: Colors.white,),
                            Text('4.2',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),)
                          ],
                        ),
                      )
                    )
                  ],
                ),
              );
            },
          ),
        )
      ],
    );
  }
}




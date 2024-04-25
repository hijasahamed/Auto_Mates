import 'package:flutter/material.dart';

class LatestCarUpdatesWidget extends StatelessWidget {
  const LatestCarUpdatesWidget({super.key,required this.screenSize});
  final Size screenSize;
  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Latest car updates',style: TextStyle(fontSize: 25,color: Color(0xFF424141),fontWeight: FontWeight.bold),),
            TextButton(onPressed: (){}, child: const Text('View All',style: TextStyle(fontWeight: FontWeight.w600,color: Colors.blue),), )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              height: screenSize.height/3.5,                 
              width: screenSize.width/2.3,
              decoration:  BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.white               
              ),
              child: Padding(
                padding: const EdgeInsets.all(2),
                child: Column(
                  children: [
                    Container(
                      height: screenSize.height/6,
                      width: double.maxFinite,
                      decoration:  BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        image: const DecorationImage(image: AssetImage('assets/images/road-accidents-pti.jpg'),fit: BoxFit.cover)
                      ),
                    ),
                    const Text("Mahindra safest car crash in Mumbai\nby BBC News India",style: TextStyle(fontWeight: FontWeight.w500,color:Color(0xFF424141)),),
                    const Spacer(),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text('Read more',style: TextStyle(color: Colors.blue,fontWeight: FontWeight.w600),),
                        Icon(Icons.arrow_forward_ios,color: Colors.blue,size: 18,)                         
                      ],
                    )
                  ],
                ),
              ),
            ),
            Container(
              height: screenSize.height/3.5,                 
              width: screenSize.width/2.3,
              decoration:  BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.white                
              ),
              child: Padding(
                padding: const EdgeInsets.all(2),
                child: Column(
                  children: [
                    Container(
                      height: screenSize.height/6,
                      width: double.maxFinite,
                      decoration:  BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        image: const DecorationImage(image: AssetImage('assets/images/news.webp'),fit: BoxFit.cover)
                      ),
                    ),
                    const Text("Latest Technology Advancements\nby Sagar Koottapuram",style: TextStyle(fontWeight: FontWeight.w500,color:Color(0xFF424141)),),
                    const Spacer(),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text('Read more',style: TextStyle(color: Colors.blue,fontWeight: FontWeight.w600),),
                        Icon(Icons.arrow_forward_ios,color: Colors.blue,size: 18,)                        
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
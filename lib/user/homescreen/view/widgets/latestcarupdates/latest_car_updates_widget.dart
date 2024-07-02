import 'package:auto_mates/user/commonwidgets/my_text_widget/my_text_widget.dart';
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
            MyTextWidget(text: 'Latest News', color: const Color(0xff424141), size: screenSize.width/16.5, weight: FontWeight.bold),
            TextButton(onPressed: (){}, child: MyTextWidget(text: 'View All', color: Colors.blue, size: screenSize.width/35, weight: FontWeight.bold) )
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
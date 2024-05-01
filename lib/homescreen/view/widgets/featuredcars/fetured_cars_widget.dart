import 'package:flutter/material.dart';

class FeaturedCarsWidget extends StatelessWidget {
  FeaturedCarsWidget({super.key,required this.screenSize});
  final Size screenSize;
  
  final List carList=[
    CarInfo(
     'https://stimg.cardekho.com/images/carexteriorimages/930x620/Maruti/Grand-Vitara/10505/1689588262879/front-left-side-47.jpg',
     'Grand Vitara',
     '₹13.56 Lakh'
    ),
    CarInfo(
     'https://spn-sta.spinny.com/blog/20220308152631/VW-Virtus-launch.jpg?compress=true&quality=80&w=600&dpr=2.6',
     'Volkswagen Virtus',
     '₹19.87 Lakh'
    ),
    CarInfo(
     'https://www.globalsuzuki.com/automobile/lineup/ignis/img/slide/key_img11.jpg',
     'Maruthi Ignis',
     '₹5.21 Lakh'
    ),
    CarInfo(
     'https://imgd.aeplcdn.com/664x374/n/cw/ec/158139/i20-n-line-exterior-left-front-three-quarter.jpeg?isig=0&q=80',
     'i20 N-Line',
     '₹8.10 Lakh'
    ),
    CarInfo(
     'https://www.carlelo.com/image/model/1693566474.webp',
     'Honda City',
     '₹14.21 Lakh'
    )
  ];
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
        SizedBox(
          height: screenSize.height/5.5,
          width: screenSize.width,
          child: ListView.builder(
            itemCount: carList.length,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: Container(  
                      height: screenSize.height/6,                 
                      width: screenSize.width/2.23,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        image: DecorationImage(
                          image: NetworkImage(carList[index].imageUrl),
                          fit: BoxFit.cover,
                          filterQuality: FilterQuality.high
                        )
                      ),
                    ),
                  ),
                  Positioned(
                  bottom: 1,
                  right: 0,
                    child: Container(
                      height: 30,
                      width: screenSize.width/2.23,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(50),color: Colors.white),
                      child:  Center(child: Text(carList[index].price,style: const TextStyle(fontWeight: FontWeight.bold,color: Color(0xFF424141)),)),
                    )
                  ),
                  Positioned(    
                    bottom: 33,
                    left: 7,                  
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.black,
                      ),
                      child: Text(carList[index].name,style: const TextStyle(fontSize: 15,color: Colors.white,fontWeight: FontWeight.bold),)
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


class CarInfo{
  final String imageUrl;
  final String name;
  final String price;

    CarInfo(this.imageUrl, this.name,this.price);
}
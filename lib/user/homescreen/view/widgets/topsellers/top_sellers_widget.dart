import 'package:auto_mates/user/commonwidgets/my_text_widget/my_text_widget.dart';
import 'package:flutter/material.dart';

class TopSellersWidget extends StatelessWidget {
  TopSellersWidget({super.key,required this.screenSize});
  final Size screenSize;
  final List topSellers=[
    TopSellers(
      'https://67cdn.co.uk/90/6/167300977163b81a6bc69c9_ccs-revisedhome.jpg?width=479&height=251&crop=auto',
      "CCS Cars",
      '4.5'
    ),
    TopSellers(
      'https://www.spyne.ai/blogs/wp-content/uploads/2023/02/used-car-dealership-fi.jpg',
      "Sini's Automates",
      '4.1'
    ),
    TopSellers(
      'https://etimg.etb2bimg.com/photo/74218074.cms',
      "J&J Motors",
      '3.8'
    ),    
  ];
  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            MyTextWidget(text: 'Top sellers', color: const Color(0xff424141), size: screenSize.width/16.5, weight: FontWeight.bold),            
            TextButton(onPressed: (){}, child: MyTextWidget(text: 'View All', color: Colors.blue, size: screenSize.width/35, weight: FontWeight.bold) )
          ],
        ),
        SizedBox(
          height: screenSize.height/5.5,
          width: screenSize.width,
          child: ListView.builder(
            itemCount: topSellers.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context,index) {
              return Padding(
                padding: const EdgeInsets.all(2.5),
                child: Stack(
                  children: [
                    Container(                   
                      width: screenSize.width/2.08,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        image: DecorationImage(
                          image: NetworkImage(topSellers[index].imageUrl),
                          fit: BoxFit.cover
                        )
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      child: Container(
                        width: screenSize.width/2.08,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(5),bottomRight: Radius.circular(5)),
                          color: Color.fromARGB(255, 238, 238, 238),
                        ),
                        child: Center(child: MyTextWidget(text: topSellers[index].name, color: Colors.blueGrey, size: screenSize.width/27, weight: FontWeight.bold))
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
                          borderRadius: BorderRadius.circular(5)
                        ),
                        child: Row(
                          children: [
                            Icon(Icons.star,color: Colors.white,size: screenSize.width/24,),                            
                            MyTextWidget(text: topSellers[index].rating, color: Colors.white, size: screenSize.width/24, weight: FontWeight.bold)
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

class TopSellers{
  final String imageUrl;
  final String name;
  final String rating;

  TopSellers(this.imageUrl,this.name,this.rating);
}




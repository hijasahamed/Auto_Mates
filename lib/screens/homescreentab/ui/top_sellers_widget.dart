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
            const Text('Top sellers',style: TextStyle(fontSize: 25,color: Color(0xFF424141),fontWeight: FontWeight.bold),),             
            TextButton(onPressed: (){}, child: const Text('View All',style: TextStyle(fontWeight: FontWeight.w600,color: Colors.blue),), )
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
                padding: const EdgeInsets.all(4),
                child: Stack(
                  children: [
                    Container(                   
                      width: screenSize.width/1.7,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        image: DecorationImage(
                          image: NetworkImage(topSellers[index].imageUrl),
                          fit: BoxFit.cover
                        )
                      ),
                    ),
                     Positioned(
                      bottom: 3,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.black54,
                        ),
                        child: Text(topSellers[index].name,style: const TextStyle(fontSize: 15,color: Colors.white,fontWeight: FontWeight.bold),)
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
                            const Icon(Icons.star,color: Colors.white,),
                            Text(topSellers[index].rating,style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),)
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




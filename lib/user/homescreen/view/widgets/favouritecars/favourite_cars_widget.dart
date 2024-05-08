import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class FavouriteCarsWidget extends StatefulWidget {
  const FavouriteCarsWidget({super.key, required this.screenSize});
  final Size screenSize;

  @override
  State<FavouriteCarsWidget> createState() => _FavouriteCarsWidgetState();
}

class _FavouriteCarsWidgetState extends State<FavouriteCarsWidget> {
  late CarouselController carouselController;
  @override
  void initState() {    
    super.initState();
    carouselController = CarouselController();
  }

  @override
  Widget build(BuildContext context) {

    List homeData = [
      "https://stimg.cardekho.com/images/carexteriorimages/930x620/Skoda/Superb-2024/11648/1712204642647/front-left-side-47.jpg",
      "https://spn-sta.spinny.com/blog/20230612165825/Audi-A6.webp?compress=true&quality=80&w=1024&dpr=2.6",
      "https://dealerinspire-image-library-prod.s3.us-east-1.amazonaws.com/images/Biuxbk7TtBO6vb3n0EqHA2515YSE91dLP3cUXBUD.jpg",
      "https://www.financialexpress.com/wp-content/uploads/2023/03/2023-Hyundai-Verna-Review-1.jpg",
    ];
    CarouselController carouselController = CarouselController();

    return Padding(
      padding: const EdgeInsets.only(left: 5,right: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('My Favourites',style: TextStyle(fontWeight: FontWeight.bold,color: Color(0xFF424141),fontSize: 25),),
          Stack(
            alignment: Alignment.center,
            children: [ 
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: CarouselSlider(
                  carouselController: carouselController,
                  items: homeData.map(
                    (imagePath) {
                      return SizedBox(
                        width: widget.screenSize.width,
                        child: Image.network(
                          imagePath,
                          fit: BoxFit.cover,
                          errorBuilder: (BuildContext context, Object exception,
                              StackTrace? stackTrace) {
                            return const Text('No Image');
                          },                    
                        ),
                      );
                    },
                  ).toList(),
                  options: CarouselOptions(
                    scrollDirection: Axis.horizontal,
                    viewportFraction: 1,
                    height: widget.screenSize.height/4.9,
                    autoPlay: false,
                  ),
                ),
              ),
              Positioned(
                left: 2,
                child: GestureDetector(
                  onTap: () {
                    carouselController.previousPage(curve: Curves.easeIn);
                  },
                  child: CircleAvatar(
                    radius: 25,
                    backgroundColor: Colors.white.withOpacity(.7),
                    child: const Icon(Icons.arrow_back_ios),
                  ),
                ),
              ),
              Positioned(
                right: 2,
                child: GestureDetector(
                  onTap: () {
                    carouselController.nextPage(curve: Curves.easeIn);
                  },
                  child: CircleAvatar(
                    radius: 25,
                    backgroundColor: Colors.white.withOpacity(.7),
                    child: const Icon(Icons.arrow_forward_ios),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

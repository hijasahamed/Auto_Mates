import 'package:auto_mates/user/buyscreentab/view/seller_details_screen.dart';
import 'package:auto_mates/user/buyscreentab/view/widgets/sorting_filter_widget.dart';
import 'package:flutter/material.dart';

class BuyScreen extends StatelessWidget {
  const BuyScreen({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final List carDetails = [
      AllCars(
          "https://spn-sta.spinny.com/blog/20230612165825/Audi-A6.webp?compress=true&quality=80&w=1024&dpr=2.6",
          'Audi A8',
          '2023 Model',
          '8,320Km',
          '₹89.52 Lakh'),
      AllCars(
          "https://www.financialexpress.com/wp-content/uploads/2016/03/Mercedes-Benz-S-Class-2021-india-launch-amg-line.jpg?w=1024",
          'Benz S class',
          '2023 Model',
          '9,563Km',
          '₹1.52 Cr'),
      AllCars(
          'https://images.carandbike.com/cms/articles/2023/3/3206096/2023_Honda_City_Facelift_IVTEC_Static_2_ae3a3bc71c.jpg',
          'Honda City',
          '2024 Model',
          '5,136Km',
          '₹21.82 Lakh'),
      AllCars(
          "https://stimg.cardekho.com/images/carexteriorimages/930x620/Skoda/Superb-2024/11648/1712204642647/front-left-side-47.jpg",
          'Skoda Superb',
          '2019 Model',
          '24,320Km',
          '₹27.21 Lakh'),
      AllCars(
          "https://www.financialexpress.com/wp-content/uploads/2023/03/2023-Hyundai-Verna-Review-1.jpg",
          'Hyundai Verna',
          '2023 Model',
          '2,310Km',
          '₹17.82 Lakh'),
      AllCars(
          'https://stimg.cardekho.com/images/carexteriorimages/930x620/Maruti/Grand-Vitara/10505/1689588262879/front-left-side-47.jpg',
          'Grand Vitara',
          '2023 Model',
          '9556Km',
          '₹15.65 Lakh'),
      AllCars(
          'https://spn-sta.spinny.com/blog/20220308152631/VW-Virtus-launch.jpg?compress=true&quality=80&w=600&dpr=2.6',
          'VW-Virtus',
          '2021 Model',
          '43,310Km',
          '₹13.82 Lakh'),
      AllCars(
          'https://www.globalsuzuki.com/automobile/lineup/ignis/img/slide/key_img11.jpg',
          'Ignis',
          '2018 Model',
          '38,896Km',
          '₹7.8 Lakh'),
      AllCars(
          'https://imgd.aeplcdn.com/664x374/n/cw/ec/158139/i20-n-line-exterior-left-front-three-quarter.jpeg?isig=0&q=80',
          'i20 Nline',
          '2023 Model',
          '29,310Km',
          '₹8.82 Lakh'),
    ];
    return Scaffold(
        body: Padding(
            padding:
            const EdgeInsets.only(top: 0, bottom: 0, left: 5, right: 5),
            child: Column(
              children: [
                SortingFilteringWidget(screenSize: screenSize),
                Expanded(
                  child: GridView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: carDetails.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: .75,
                      mainAxisSpacing: 3,
                      crossAxisSpacing: 3,
                      crossAxisCount: 2,
                    ),
                    itemBuilder: (context, index) {
                      return Card(
                        elevation: 5,
                        color: const Color(0xFFDBEDF5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Stack(
                              children: [
                                Container(
                                  height: screenSize.height / 7.5,
                                  width: screenSize.width,
                                  decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(5),
                                          topRight: Radius.circular(4)),
                                      color: Colors.transparent,
                                      image: DecorationImage(
                                          image: NetworkImage(
                                              carDetails[index].imageurl),
                                          fit: BoxFit.cover,
                                          filterQuality: FilterQuality.high)),
                                ),
                                const Positioned(
                                  top: 5,
                                  right: 5,
                                  child: CircleAvatar(
                                    backgroundColor: Colors.white,
                                    radius: 15,
                                    child: Icon(Icons.favorite_outline_rounded,size: 20,color: Colors.red,),
                                  )
                                )
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 4),
                              child: Text(
                                carDetails[index].name,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF424141)),
                              ),
                            ),
                            const Spacer(),
                            Padding(
                              padding: const EdgeInsets.only(left: 4),
                              child: Text(
                                carDetails[index].model,
                                style: const TextStyle(
                                    color: Color.fromARGB(255, 83, 83, 83),
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 4),
                              child: Text(
                                carDetails[index].kilometers,
                                style: const TextStyle(
                                    color: Color.fromARGB(255, 83, 83, 83),
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 4),
                              child: Text(
                                carDetails[index].price,
                                style: const TextStyle(
                                    color: Color.fromARGB(255, 83, 83, 83),
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            const Spacer(),
                            Padding(
                              padding: const EdgeInsets.only(left: 4, bottom: 4),
                              child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                                      return SellerDetailsScreen(screenSize: screenSize,data: carDetails[index],);
                                    },));
                                  },
                                  child: const Text(
                                    'More Details',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  )),
                            )
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            )));
  }
}

class AllCars {
  String imageurl;
  String name;
  String model;
  String kilometers;
  String price;
  AllCars(this.imageurl, this.name, this.model, this.kilometers, this.price);
}

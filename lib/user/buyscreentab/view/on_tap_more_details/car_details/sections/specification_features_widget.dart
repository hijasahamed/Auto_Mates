import 'package:auto_mates/user/buyscreentab/view/on_tap_more_details/car_details/sections/tab_bar_view_list_tile.dart';
import 'package:flutter/material.dart';

class SpecificationFeaturesWidget extends StatelessWidget {
  const SpecificationFeaturesWidget({super.key,required this.screenSize,required this.data});
  final Size screenSize;
  final dynamic data;
  @override
  Widget build(BuildContext context) {
    ScrollController controller = ScrollController();
    return DefaultTabController(
      length: 3,
      initialIndex: 0,       
      child: Column(
        children: [
          const TabBar(
            indicatorColor: Color(0xFF00BAAB),
            tabs: [
              Tab(child: Text('Specifications',style: TextStyle(fontWeight: FontWeight.bold,color: Color.fromARGB(255, 118, 118, 118)),),),
              Tab(child: Text('Features',style: TextStyle(fontWeight: FontWeight.bold,color: Color.fromARGB(255, 118, 118, 118)),),),
              Tab(child: Text('Overview',style: TextStyle(fontWeight: FontWeight.bold,color: Color.fromARGB(255, 118, 118, 118)),),),
            ]
          ),
          SizedBox(
            height: screenSize.height/2.434,
            width: screenSize.width,
            child: TabBarView(
              children: [
                Scrollbar(
                  controller: controller,
                  thumbVisibility: true,
                  radius: const Radius.circular(10),
                  child: ListView(
                    scrollDirection: Axis.vertical,
                    children: [
                     TabBarViewListTile(leading: 'Price', title: '${data['price']} Lakhs',screenSize: screenSize ),
                     TabBarViewListTile(leading: 'Year', title: data['year'],screenSize: screenSize,),
                     TabBarViewListTile(leading: 'Kilometer', title: data['kilometer'],screenSize: screenSize,),
                     TabBarViewListTile(leading: 'Fuel ', title: data['fuel'],screenSize: screenSize,),
                     TabBarViewListTile(leading: 'Transmission', title: data['transmission'],screenSize: screenSize,),
                     TabBarViewListTile(leading: 'No.of Owner', title: data['noOfOwners'],screenSize: screenSize,),
                     TabBarViewListTile(leading: 'Insurance', title: data['insurance'],screenSize: screenSize,),
                     TabBarViewListTile(leading: 'Color', title: data['color'],screenSize: screenSize,),
                     TabBarViewListTile(leading: 'Body Type', title: data['bodytype'],screenSize: screenSize,),
                     TabBarViewListTile(leading: 'Reg.Num', title: data['regNumber'],screenSize: screenSize,),
                    ],
                  ),
                ),
                Scrollbar(
                  controller: controller,
                  thumbVisibility: true,
                  radius: const Radius.circular(10),
                  child: ListView(
                    children: [
                     TabBarViewListTile(leading: 'Air Bag', title: data['airbag'],screenSize: screenSize ),
                     TabBarViewListTile(leading: 'Air Conditioner', title: data['airconditioner'],screenSize: screenSize,),
                     TabBarViewListTile(leading: 'Alloy Wheel', title: data['alloywheel'],screenSize: screenSize,),
                     TabBarViewListTile(leading: 'BootSpace', title: '${data['bootspace']} litres',screenSize: screenSize,),
                     TabBarViewListTile(leading: 'Height', title: '${data['carheight']} mm',screenSize: screenSize,),
                     TabBarViewListTile(leading: 'Width', title: '${data['carwidth']} mm',screenSize: screenSize,),
                     TabBarViewListTile(leading: 'Length', title: '${data['carlength']} mm',screenSize: screenSize,),
                     TabBarViewListTile(leading: 'Wheelbase', title: '${data['groundclearance']} mm',screenSize: screenSize,),
                     TabBarViewListTile(leading: 'Fuel Capacity', title: '${data['fueltank']} litres',screenSize: screenSize,),
                     TabBarViewListTile(leading: 'Infotainment', title: '${data['infotainment']} Type',screenSize: screenSize ),
                     TabBarViewListTile(leading: 'Milage', title: '${data['milage']} kmpl',screenSize: screenSize ),
                     TabBarViewListTile(leading: 'Power Window', title: data['powerwindow'],screenSize: screenSize ),
                     TabBarViewListTile(leading: 'Seat Capacity', title: '${data['seat']} seater',screenSize: screenSize ),
                     TabBarViewListTile(leading: 'Sun Roof', title: data['sunroof'],screenSize: screenSize ),
                    ],
                  ),
                ),
                Scrollbar(
                  controller: controller,
                  thumbVisibility: true,
                  radius: const Radius.circular(10),
                  child: ListView(
                    children:  [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(data['overview'],style: const TextStyle(
                          color: Color.fromARGB(255, 118, 118, 118), fontSize: 15, fontWeight: FontWeight.w500
                        ),),
                      )
                    ],
                  ),
                ),
              ]
            ),
          )
        ],
      ),
    );
  }
}
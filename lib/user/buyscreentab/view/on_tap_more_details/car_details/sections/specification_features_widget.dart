import 'package:auto_mates/user/buyscreentab/view/on_tap_more_details/car_details/sections/tab_bar_view_list_tile.dart';
import 'package:flutter/material.dart';

class SpecificationFeaturesWidget extends StatelessWidget {
  const SpecificationFeaturesWidget({super.key,required this.screenSize});
  final Size screenSize;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: 0,       
      child: Column(
        children: [
          const TabBar(
            indicatorColor: Color(0xFF00BAAB),
            tabs: [
              Tab(child: Text('Overview',style: TextStyle(fontWeight: FontWeight.bold,color: Color.fromARGB(255, 118, 118, 118)),),),
              Tab(child: Text('Features',style: TextStyle(fontWeight: FontWeight.bold,color: Color.fromARGB(255, 118, 118, 118)),),),
              Tab(child: Text('Specifications',style: TextStyle(fontWeight: FontWeight.bold,color: Color.fromARGB(255, 118, 118, 118)),),),
            ]
          ),
          SizedBox(
            height: screenSize.height/2.434,
            width: screenSize.width,
            child: TabBarView(
              children: [
                Column(
                  children: [
                   TabBarViewListTile(leading: 'Price', title: '45.23 Lakh',screenSize: screenSize ),
                   TabBarViewListTile(leading: 'Year', title: '2021',screenSize: screenSize,),
                   TabBarViewListTile(leading: 'Kilometer', title: '24,242',screenSize: screenSize,),
                   TabBarViewListTile(leading: 'Fuel ', title: 'Petrol',screenSize: screenSize,),
                   TabBarViewListTile(leading: 'Transmission', title: 'Manual',screenSize: screenSize,),
                   TabBarViewListTile(leading: 'No.of Owner', title: '2',screenSize: screenSize,),
                   TabBarViewListTile(leading: 'Insurance', title: 'Nov 2024',screenSize: screenSize,),
                  ],
                ),
                ListView(
                  children: const [
                    
                  ],
                ),
                ListView(
                  children: const [
                    
                  ],
                ),
              ]
            ),
          )
        ],
      ),
    );
  }
}
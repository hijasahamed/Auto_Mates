// ignore_for_file: library_private_types_in_public_api

import 'package:auto_mates/user/buyscreentab/view/bloc/buy_screen_bloc.dart';
import 'package:auto_mates/user/buyscreentab/view/buy_screen/on_tap_more_details/car_details/sections/tab_bar_view_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SpecificationFeaturesWidget extends StatefulWidget {
  const SpecificationFeaturesWidget(
      {super.key, required this.screenSize, required this.data});
  final Size screenSize;
  final dynamic data;

  @override
  _SpecificationFeaturesWidgetState createState() =>
      _SpecificationFeaturesWidgetState();
}

class _SpecificationFeaturesWidgetState
    extends State<SpecificationFeaturesWidget>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final BuyScreenBloc tabBarBlocInstance = BuyScreenBloc();
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() {
      tabBarBlocInstance.add(TabBarViewRefreshEvent());
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ScrollController specificationsController = ScrollController();
    ScrollController featuresController = ScrollController();

    return BlocBuilder<BuyScreenBloc, BuyScreenState>(
      bloc: tabBarBlocInstance,
      builder: (context, state) {
        return DefaultTabController(
          length: 2,
          initialIndex: 0,
          child: Column(
            children: [
              TabBar(
                controller: _tabController,
                indicatorColor: const Color.fromARGB(255, 27, 202, 161),
                indicatorWeight: .5,
                tabs: [
                  Tab(
                    child: Text(
                      'SPECIFICATIONS',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: _tabController.index == 0
                            ? const Color.fromARGB(255, 27, 202, 161)
                            : const Color.fromARGB(255, 118, 118, 118),
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Tab(
                    child: Text(
                      'FEATURES',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: _tabController.index == 1
                            ? const Color.fromARGB(255, 27, 202, 161)
                            : const Color.fromARGB(255, 118, 118, 118),
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: widget.screenSize.height / 2.434,
                width: widget.screenSize.width,
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    Scrollbar(
                      controller: specificationsController,
                      thumbVisibility: true,
                      radius: const Radius.circular(10),
                      child: ListView(
                        controller: specificationsController,
                        scrollDirection: Axis.vertical,
                        children: [
                          TabBarViewListTile(
                              leading: 'Price',
                              title: '${widget.data['price']} Lakhs',
                              screenSize: widget.screenSize),
                          TabBarViewListTile(
                              leading: 'Year',
                              title: widget.data['year'],
                              screenSize: widget.screenSize),
                          TabBarViewListTile(
                              leading: 'Kilometer',
                              title: widget.data['kilometer'],
                              screenSize: widget.screenSize),
                          TabBarViewListTile(
                              leading: 'Fuel ',
                              title: widget.data['fuel'],
                              screenSize: widget.screenSize),
                          TabBarViewListTile(
                              leading: 'Transmission',
                              title: widget.data['transmission'],
                              screenSize: widget.screenSize),
                          TabBarViewListTile(
                              leading: 'No.of Owner',
                              title: widget.data['noOfOwners'],
                              screenSize: widget.screenSize),
                          TabBarViewListTile(
                              leading: 'Insurance',
                              title: widget.data['insurance'],
                              screenSize: widget.screenSize),
                          TabBarViewListTile(
                              leading: 'Color',
                              title: widget.data['color'],
                              screenSize: widget.screenSize),
                          TabBarViewListTile(
                              leading: 'Body Type',
                              title: widget.data['bodytype'],
                              screenSize: widget.screenSize),
                          TabBarViewListTile(
                              leading: 'Reg.Num',
                              title: widget.data['regNumber'],
                              screenSize: widget.screenSize),
                        ],
                      ),
                    ),
                    Scrollbar(
                      controller: featuresController,
                      thumbVisibility: true,
                      radius: const Radius.circular(10),
                      child: ListView(
                        controller: featuresController,
                        scrollDirection: Axis.vertical,
                        children: [
                          TabBarViewListTile(
                              leading: 'Air Bag',
                              title: widget.data['airbag'],
                              screenSize: widget.screenSize),
                          TabBarViewListTile(
                              leading: 'Air Conditioner',
                              title: widget.data['airconditioner'],
                              screenSize: widget.screenSize),
                          TabBarViewListTile(
                              leading: 'Alloy Wheel',
                              title: widget.data['alloywheel'],
                              screenSize: widget.screenSize),
                          TabBarViewListTile(
                              leading: 'BootSpace',
                              title: '${widget.data['bootspace']} litres',
                              screenSize: widget.screenSize),
                          TabBarViewListTile(
                              leading: 'Height',
                              title: '${widget.data['carheight']} mm',
                              screenSize: widget.screenSize),
                          TabBarViewListTile(
                              leading: 'Width',
                              title: '${widget.data['carwidth']} mm',
                              screenSize: widget.screenSize),
                          TabBarViewListTile(
                              leading: 'Length',
                              title: '${widget.data['carlength']} mm',
                              screenSize: widget.screenSize),
                          TabBarViewListTile(
                              leading: 'Wheelbase',
                              title: '${widget.data['groundclearance']} mm',
                              screenSize: widget.screenSize),
                          TabBarViewListTile(
                              leading: 'Fuel Capacity',
                              title: '${widget.data['fueltank']} litres',
                              screenSize: widget.screenSize),
                          TabBarViewListTile(
                              leading: 'Infotainment',
                              title: '${widget.data['infotainment']} Type',
                              screenSize: widget.screenSize),
                          TabBarViewListTile(
                              leading: 'Milage',
                              title: '${widget.data['milage']} kmpl',
                              screenSize: widget.screenSize),
                          TabBarViewListTile(
                              leading: 'Power Window',
                              title: widget.data['powerwindow'],
                              screenSize: widget.screenSize),
                          TabBarViewListTile(
                              leading: 'Seat Capacity',
                              title: '${widget.data['seat']} seater',
                              screenSize: widget.screenSize),
                          TabBarViewListTile(
                              leading: 'Sun Roof',
                              title: widget.data['sunroof'],
                              screenSize: widget.screenSize),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}

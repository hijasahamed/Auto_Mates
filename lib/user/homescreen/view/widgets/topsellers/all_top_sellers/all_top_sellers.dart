import 'package:auto_mates/user/appbarbottombar/view/widgets/normal_app_bar/normal_app_bar.dart';
import 'package:auto_mates/user/homescreen/controllers/functions/functions.dart';
import 'package:auto_mates/user/homescreen/view/widgets/topsellers/all_top_sellers/all_top_sellers_list_holder/all_top_sellers_list_holder.dart';
import 'package:flutter/material.dart';

class AllTopSellers extends StatelessWidget {
  const AllTopSellers({super.key,required this.screenSize});
  final Size screenSize;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(50), 
        child: NormalAppBar(
          title: 'Top Rated Sellers'
        )
      ),
      body: StreamBuilder(
        stream: findTopRatedSellers(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(
                child: Text('Error loading top-rated sellers'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No sellers found'));
          }
          else{
            List<Map<String, dynamic>> sellers = snapshot.data!;
            return AllTopSellersListHolder(sellers: sellers,screenSize: screenSize,);
          }
        },
      ),
    );
  }
}
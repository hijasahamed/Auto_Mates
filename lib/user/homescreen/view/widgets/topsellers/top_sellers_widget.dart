import 'package:auto_mates/user/commonwidgets/my_text_widget/my_text_widget.dart';
import 'package:auto_mates/user/homescreen/controllers/home_screen_controller/functions.dart';
import 'package:auto_mates/user/homescreen/view/bloc/homescreen_bloc.dart';
import 'package:auto_mates/user/homescreen/view/widgets/topsellers/all_top_sellers/all_top_sellers.dart';
import 'package:auto_mates/user/homescreen/view/widgets/topsellers/topsellers_list_holder/topsellers_list_holder.dart';
import 'package:auto_mates/user/homescreen/view/widgets/topsellers/topsellers_top_bar/topsellers_top_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TopSellersWidget extends StatelessWidget {
  const TopSellersWidget({super.key, required this.screenSize});
  final Size screenSize;
  @override
  Widget build(BuildContext context) {
    HomescreenBloc homescreenBloc = HomescreenBloc();
    return BlocConsumer<HomescreenBloc, HomescreenState>(
      bloc: homescreenBloc,
      listener: (context, state) {
        if(state is TopSellersAllListNavigateState){
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return AllTopSellers(screenSize: screenSize,);
          },));
        }
      },
      builder: (context, state) {
        return Card(
          elevation: 5,
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(3),
            child: SizedBox(
              height: screenSize.height/3.6,
              width: screenSize.width,
              child: Column(
                children: [
                  TopsellersTopBar(screenSize: screenSize,homescreenBloc: homescreenBloc,),
                  SizedBox(
                    height: screenSize.height / 4.7,
                    width: screenSize.width,
                    child: StreamBuilder<List<Map<String, dynamic>>>(
                      stream: findTopRatedSellers(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.waiting) {
                          return const Center(child: CircularProgressIndicator());
                        } else if (snapshot.hasError) {
                          return Center(child: MyTextWidget(
                            text: 'No seller is been rated by the buyers.We will show the top rated sellers once the buyers start rating the sellers.', 
                            color: Colors.blueGrey,maxline: true,alignTextCenter: true, 
                            size: screenSize.width/31, weight: FontWeight.bold)); 
                        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                          return const Center(child: Text('No sellers found'));
                        } else {
                          List<Map<String, dynamic>> sellers = snapshot.data!;
                          return TopsellersListHolder(screenSize: screenSize, sellers: sellers);
                        }
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

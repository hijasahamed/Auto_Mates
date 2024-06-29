import 'package:auto_mates/user/commonwidgets/my_text_widget/my_text_widget.dart';
import 'package:auto_mates/user/profilescreen/controller/functions.dart';
import 'package:auto_mates/user/profilescreen/view/bloc/profile_screen_bloc.dart';
import 'package:flutter/material.dart';

class AllCarsToSelect extends StatelessWidget {
  const AllCarsToSelect({super.key,required this.screenSize,this.listOne,required this.compareCarsBlocInstance});
  final Size screenSize;
  final bool? listOne;
  final ProfileScreenBloc compareCarsBlocInstance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  }, 
                  icon: const Icon(Icons.clear)
                ),
                MyTextWidget(text: 'select car for comparison', color: Colors.grey, size: screenSize.width/30, weight: FontWeight.bold)
              ],
            ),
            Expanded(
              child: FutureBuilder(
                future: fetchAllCarsForComparing(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator(color: Colors.blue,));
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Center(child: Text('No Cars Available'));
                  } else {
                    List<Map<String, dynamic>> cars = snapshot.data!;
                    return ListView.builder(
                      itemCount: cars.length,
                      itemBuilder: (context, index) {
                        final car = cars[index];
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: () {                             
                            if(listOne==true){
                              carForComparing1.clear();
                              carForComparing1.add(car);
                              Navigator.pop(context);
                              compareCarsBlocInstance.add(CompareCarScreenRefreshEvent());
                            }
                            else if(listOne==false){
                              carForComparing2.clear();
                              carForComparing2.add(car);
                              Navigator.pop(context);
                              compareCarsBlocInstance.add(CompareCarScreenRefreshEvent());
                            }
                            },
                            child: Container(
                              height: screenSize.height/7,
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 237, 237, 237),
                                borderRadius: BorderRadius.circular(5)
                              ),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(5),
                                      child: FadeInImage(
                                      fadeInDuration: const Duration(milliseconds: 750),
                                      width: screenSize.width/2.5,
                                      height: screenSize.height,
                                      placeholder: const AssetImage(
                                        'assets/images/image placeholder.jpeg',
                                      ),
                                      placeholderFit: BoxFit.cover,
                                      imageErrorBuilder: (context, error, stackTrace) {
                                        return const CircularProgressIndicator(
                                          color: Colors.blue,
                                        );
                                      },
                                      image: NetworkImage(car['thumbnail']),
                                      fit: BoxFit.cover,
                                      filterQuality: FilterQuality.high),
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      MyTextWidget(text: car['brand'], color: const Color(0xff424141), size: screenSize.width/30, weight: FontWeight.bold),
                                      SizedBox(width: screenSize.width/100,),
                                      MyTextWidget(text: car['modelName'], color: const Color(0xff424141), size: screenSize.width/30, weight: FontWeight.bold),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

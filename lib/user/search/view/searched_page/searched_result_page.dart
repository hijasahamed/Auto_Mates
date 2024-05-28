import 'package:auto_mates/user/buyscreentab/view/on_tap_more_details/seller_details/seller_details_screen.dart';
import 'package:auto_mates/user/search/controllers/functions.dart';
import 'package:auto_mates/user/search/view/searched_page/searched_result_holder/searched_result_holder.dart';
import 'package:flutter/material.dart';

class SearchedResultPage extends StatelessWidget {
  const SearchedResultPage({super.key, required this.screenSize, required this.searchnotifier,});
  final Size screenSize;
  final ValueNotifier<TextEditingController> searchnotifier;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<TextEditingController>(
      valueListenable: searchnotifier,
      builder: (context, controller, _) {
        return FutureBuilder<List<Map<String, dynamic>>>(
          future: getSearchingCars(query: controller.text.trim()),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.blue,
                ),
              );
            } else if (snapshot.hasError || !snapshot.hasData) {
              return const Center(
                child: Text('Something Went Wrong'),
              );
            }
            final results = snapshot.data ?? [];
            if (results.isEmpty) {
              return const Center(
                child: Text(
                  'No Results Found',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
                ),
              );
            }
            final queryText = controller.text.trim().toLowerCase();
            final filteredData = results
            .where((data) {
              final modelName = data['modelName'].toString().toLowerCase();
              final brand = data['brand'].toString().toLowerCase();
              return modelName.contains(queryText) || brand.contains(queryText);
            })
            .toList();
            if(filteredData.isEmpty){
              return const Center(
                child: Text(
                  'No Results Found',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
                ),
              );
            }
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                shrinkWrap: true,
                itemCount: filteredData.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 3,
                  crossAxisSpacing: 3,
                  childAspectRatio: 1.05,
                ),
                itemBuilder: (context, index) {
                  final data = filteredData[index];
                  return GestureDetector(
                    onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) {
                      return SellerDetailsScreen(
                        screenSize: screenSize,
                        data: data,
                          );
                        },
                    ));
                    },
                    child: SearchedResultHolder(screenSize: screenSize,data: data,)
                  );
                },
              ),
            );
          },
        );
      },
    );
  }
}

import 'package:auto_mates/user/buyscreentab/view/on_tap_more_details/seller_details/seller_details_screen.dart';
import 'package:auto_mates/user/commonwidgets/common_widgets/common_widgets.dart';
import 'package:auto_mates/user/search/controllers/functions.dart';
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
          future: getAllCars(query: controller.text.trim()),
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
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(width: 1, color: Colors.grey),
                      ),
                      child: Column(
                        children: [
                          FadeInImage(
                        fadeInDuration: const Duration(milliseconds: 750),
                        height: screenSize.height / 6,
                        width: screenSize.width,
                        placeholder: const AssetImage(
                          'assets/images/image placeholder.jpeg',
                        ),
                        placeholderFit: BoxFit.cover,
                        imageErrorBuilder: (context, error, stackTrace) {
                          return const CircularProgressIndicator(
                            color: Colors.blue,
                          );
                        },
                        image: NetworkImage(data['image']),
                        fit: BoxFit.cover,
                        filterQuality: FilterQuality.high),
                          Padding(
                            padding: const EdgeInsets.only(left: 4),
                            child: Row(
                              children: [
                                MyTextWidget(
                                  text: '${data['brand']}',
                                  color: Colors.black,
                                  size: 20,
                                  weight: FontWeight.bold,
                                ),
                                SizedBox(
                                  width: screenSize.width / 100,
                                ),
                                Expanded(
                                  child: MyTextWidget(
                                    text: '${data['modelName']}',
                                    color: Colors.black,
                                    size: 19,
                                    weight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
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

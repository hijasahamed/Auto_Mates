import 'package:auto_mates/user/commonwidgets/common_widgets/common_widgets.dart';
import 'package:auto_mates/user/search/controllers/functions.dart';
import 'package:flutter/material.dart';

class SearchedResultPage extends StatelessWidget {
  const SearchedResultPage({super.key, required this.screenSize, required this.searchnotifier});
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
            print(results);
            if (results.isEmpty) {
              return const Center(
                child: Text(
                  'No Results Found',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
                ),
              );
            }
            final filteredData =results
                  .where((data) =>
                      data['name'].toLowerCase().contains(controller.text.toLowerCase()))
                  .toList();
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                shrinkWrap: true,
                itemCount: filteredData.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  mainAxisSpacing: 5,
                  crossAxisSpacing: 5,
                  childAspectRatio: 2.19,
                ),
                itemBuilder: (context, index) {
                  final data = filteredData[index];
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(width: 1, color: Colors.grey),
                    ),
                    child: Column(
                      children: [
                        Container(
                          height: screenSize.height / 6,
                          width: screenSize.width,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(data['image']),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                            ),
                          ),
                        ),
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

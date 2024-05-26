import 'package:flutter/material.dart';

class SearchBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const SearchBarWidget({super.key, required this.screenSize, required this.searchnotifier});
  final Size screenSize;
  final ValueNotifier<TextEditingController>? searchnotifier;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: screenSize.height / 15,
      width: screenSize.width,
      child: Row(
        children: [
          const Icon(
            Icons.search,
            color: Colors.white,
            size: 30,
          ),
          SizedBox(
            width: screenSize.width / 50,
          ),
          Expanded(
            child: TextField(
              controller: searchnotifier!.value,
              style: const TextStyle(
                color: Colors.white,
                decoration: TextDecoration.none,
              ),
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: 'Search cars',
                hintStyle: TextStyle(color: Colors.white, decoration: TextDecoration.none),
              ),
              onChanged: (value) {
                searchnotifier!.notifyListeners();
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50.0);
}

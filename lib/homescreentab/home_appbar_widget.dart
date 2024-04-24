import 'package:flutter/material.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key, required this.screenSize});
  final Size screenSize;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color(0xFFDBEDF5),
      leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.menu_outlined,
            color: Colors.white,
            size: 40,
          )),
      title: Container(
        height: screenSize.height / 21,
        width: screenSize.width / 2,
        decoration: const BoxDecoration(
            color: Color.fromARGB(255, 82, 170, 161),
            borderRadius: BorderRadius.all(Radius.circular(60))),
        child: Row(
          children: [
            SizedBox(
              width: screenSize.width / 50,
            ),
            const Icon(
              Icons.search,
              color: Colors.white,
              size: 25,
            ),
            SizedBox(
              width: screenSize.width / 22,
            ),
            const Text(
              'Search',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
      actions: [
        Stack(
          children: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.notifications,
                  color: Colors.white,
                  size: 40,
                )),
            const Positioned(
                right: 11,
                top: 14,
                child: CircleAvatar(
                  radius: 10,
                  backgroundColor: Color.fromARGB(255, 0, 112, 248),
                )),
            const Positioned(
                right: 13,
                top: 16,
                child: CircleAvatar(
                  radius: 8,
                  backgroundColor: Colors.green,
                ))
          ],
        )
      ],
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20)),
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              Color.fromARGB(255, 76, 207, 239),
              Color.fromARGB(255, 80, 171, 250)
            ],
          ),
        ),
      ),
    );
  }
}

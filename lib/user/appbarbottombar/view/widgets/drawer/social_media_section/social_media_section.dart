import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SocialMediaSection extends StatelessWidget {
  const SocialMediaSection({super.key, required this.screenSize});
  final Size screenSize;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: screenSize.height / 16,
      child: GridView.builder(
        scrollDirection: Axis.horizontal,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          mainAxisSpacing: 1,
        ),
        itemCount: 4,
        itemBuilder: (context, index) {
          List<IconData> icons = [
            FontAwesomeIcons.facebook,
            FontAwesomeIcons.twitter,
            FontAwesomeIcons.instagram,
            FontAwesomeIcons.google,
          ];
          return Center(
              child:
                  GestureDetector(onTap: () {}, child: FaIcon(icons[index],color: const Color.fromARGB(255, 107, 107, 107),)));
        },
      ),
    );
  }
}

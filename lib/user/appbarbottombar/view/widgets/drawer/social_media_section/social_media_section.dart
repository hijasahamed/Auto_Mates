import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher_string.dart';

class SocialMediaSection extends StatelessWidget {
  SocialMediaSection({super.key, required this.screenSize});
  final Size screenSize;

  final List<String> socialMediaUrls = [
    'https://www.facebook.com/',
    'https://twitter.com/',
    'https://www.instagram.com/',
    'https://www.google.com/',
  ];

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
        itemCount: socialMediaUrls.length,
        itemBuilder: (context, index) {
          final iconData = getIconData(index);
          return Center(
            child: GestureDetector(
              onTap: () => launchSocialMedia(url: socialMediaUrls[index],context: context),
              child: FaIcon(
                iconData,
                color: const Color.fromARGB(255, 107, 107, 107),
              ),
            ),
          );
        },
      ),
    );
  }

  IconData getIconData(int index) {
    switch (index) {
      case 0:
        return FontAwesomeIcons.facebook;
      case 1:
        return FontAwesomeIcons.twitter;
      case 2:
        return FontAwesomeIcons.instagram;
      case 3:
        return FontAwesomeIcons.google;
      default:
        throw Exception('Invalid social media index');
    }
  }

  Future<void> launchSocialMedia({url,context}) async {
    if (await canLaunchUrlString(url)) {
      await launchUrlString(url, mode: LaunchMode.externalApplication);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Could not launch $url'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }
}
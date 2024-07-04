import 'package:auto_mates/seller/authentications/controllers/functions.dart';
import 'package:auto_mates/user/appbarbottombar/view/widgets/normal_app_bar/normal_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:open_street_map_search_and_pick/open_street_map_search_and_pick.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({super.key,required this.locationController});
  final TextEditingController locationController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(50), 
        child: NormalAppBar(title: 'Select Your Location',isMapScreen: true,)
      ),
      body: OpenStreetMapSearchAndPick(
            buttonWidth: 130,
            zoomInIcon: Icons.zoom_in_sharp,
            zoomOutIcon: Icons.zoom_out,
            locationPinIconColor: Colors.blueGrey,
            locationPinTextStyle: const TextStyle(color: Colors.blueGrey, fontSize: 14,fontWeight: FontWeight.bold),
            buttonColor: Colors.blue,
            buttonText: 'Pick Location',
            buttonTextStyle: const TextStyle(color: Colors.white, fontSize: 14,fontWeight: FontWeight.bold),
            onPicked: (pickedData) {
              final data = {
                'lat': pickedData.latLong.latitude,
                'long': pickedData.latLong.longitude
              };
              locationLatLon = data;
              address = pickedData.address;
              String district = address['state_district'];
              String val= district.split(' ').toList().removeAt(0).toString();
              locationController.text=val;
              Navigator.pop(context);
            }),
    );
  }
}
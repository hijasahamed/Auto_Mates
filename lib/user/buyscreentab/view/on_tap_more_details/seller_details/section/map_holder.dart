import 'package:auto_mates/user/buyscreentab/controller/functions.dart';
import 'package:auto_mates/user/commonwidgets/my_text_widget/my_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class MapHolder extends StatelessWidget {
  const MapHolder({super.key, required this.screenSize,required this.sellerData});
  final Size screenSize;
  final dynamic sellerData;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      color: Colors.white,
      child: SizedBox(
        height: screenSize.height / 5,
        width: screenSize.width / 2,
        child: FutureBuilder<Map<String, double>?>(
          future: getMapLocationFromSeller(sellerData['sellerId']),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child:  MyTextWidget(text: 'No Location Available', color: Colors.blueGrey, size: screenSize.width/30, weight: FontWeight.bold));
            } else if (!snapshot.hasData || snapshot.data == null) {
              return Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(11),
                  image: const DecorationImage(image: AssetImage('assets/images/gmap.png'),fit: BoxFit.cover)
                ),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(11),
                    color: Colors.black45
                  ),
                  child: Center(child: MyTextWidget(text: 'No Location Available', color: Colors.white, size: screenSize.width/30, weight: FontWeight.bold)))
              );
            } else {
              final mapLocation = snapshot.data!;
              final lat = mapLocation['lat']!;
              final long = mapLocation['long']!;
              return ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: FlutterMap(
                  options: MapOptions(
                    onTap: (tapPosition, point) {
                      checkLocationPermissionToViewSellerMap(lat, long);
                    },
                    initialZoom: 12,
                    initialCenter: LatLng(
                      lat,
                      long
                    ),
                    interactionOptions: const InteractionOptions(
                      flags: ~InteractiveFlag.doubleTapDragZoom
                    )
                  ), 
                    children: [
                    openmap,
                    MarkerLayer(markers: [
                      Marker(
                          point: LatLng(
                              lat,
                              long),
                          width: 60,
                          height: 60,
                          alignment: Alignment.center,
                          child: const Icon(
                            Icons.location_on,
                            size: 37,
                            color: Colors.blue
                          ))
                    ])
                  ]
                ),
              );
            }
          },
        ),
      ),
      );
  }
}
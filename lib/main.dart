import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TDU Campus',
      home: MapSample(),
    );
  }
}

class MapSample extends StatefulWidget {
  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  Completer<GoogleMapController> _controller = Completer();



  static final CameraPosition _kCampus = CameraPosition(
    target: LatLng(41.142245, 29.101899),
    zoom: 17.4736,
  );

  static final Marker _kTDBBMarker = Marker(
      markerId: MarkerId('_kTDBBMarker'),
      infoWindow: InfoWindow(title: 'TDBB Gebäude'),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
      position: LatLng(41.1426929, 29.1019262)
  );

  static final Marker _kKantineNr1 = Marker(
      markerId: MarkerId('_kKantineNr1'),
      infoWindow: InfoWindow(title: 'Kantine'),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
      position: LatLng(41.1437645, 29.1013556)
  );
  static final Marker _kMensa = Marker(
      markerId: MarkerId('_kMensa'),
      infoWindow: InfoWindow(title: 'Mensa'),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
      position: LatLng(41.1419984, 29.1021187)
  );
  static final Marker _kZentrumFS = Marker(
      markerId: MarkerId('_kZentrumFS'),
      infoWindow: InfoWindow(title: 'Zentrum für Fremdsprachen'),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
      position: LatLng(41.143379, 29.101625)
  );


  static final CameraPosition _kEntry = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(41.142245, 29.101899),
      tilt: 59.440717697143555,
      zoom: 21.161926040649414);



  static final Marker _kSozialWS = Marker(
      markerId: MarkerId('_kSozialWS'),
      infoWindow: InfoWindow(title: 'Gebäude der Sozialwissenschaften'),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
      position: LatLng(41.14338888, 29.1006361)
  );

  static final Marker _kFakultaeten = Marker(
      markerId: MarkerId('_kFakultaeten'),
      infoWindow: InfoWindow(title: 'Fakultäten Gebäude'),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
      position: LatLng(41.141607, 29.102710)
  );

  static final Marker _kALUAM = Marker(
      markerId: MarkerId('_kALUAM'),
      infoWindow: InfoWindow(title: 'ALUAM'),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
      position: LatLng(41.140649, 29.102048)
  );
  static final Marker _kAllianz = Marker(
      markerId: MarkerId('_kAllianz'),
      infoWindow: InfoWindow(title: 'Allianz Technik'),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
      position: LatLng(41.140031, 29.103206)
  );

  static final Marker _kDorm = Marker(
      markerId: MarkerId('_kDorm'),
      infoWindow: InfoWindow(title: 'Mädchenschlafsaal'),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
      position: LatLng(41.139602, 29.101647)
  );


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(title: Text('Türkische-Deutsche Universität Campus'),
          backgroundColor: Colors.black12,
      ),
      body: SafeArea(
        child :GoogleMap(
          mapType: MapType.satellite,
          markers:  {_kTDBBMarker, _kSozialWS, _kZentrumFS, _kKantineNr1,
            _kMensa, _kALUAM, _kAllianz, _kFakultaeten, _kDorm } ,
          initialCameraPosition: _kCampus,
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.map_sharp),
        onPressed: ()async{
          GoogleMapController controller = await _controller.future;
          controller.animateCamera(CameraUpdate.newCameraPosition(
            CameraPosition(target: LatLng(41.1419984, 29.1021187),
            zoom: 16.55
            )
          ));
          setState(() {

          });
        },
      ),
    );
  }



  Future<void> _goToKarte() async {
    //final GoogleMapController controller = await _controller.future;
    //controller.animateCamera(CameraUpdate.newCameraPosition(target: newlatlang);
  }


}
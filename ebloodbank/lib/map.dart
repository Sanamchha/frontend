import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class Sanam extends StatefulWidget {
  @override
  _SanamState createState() => _SanamState();
}

class _SanamState extends State<Sanam> {
  LatLng _initialcameraposition = LatLng(27.664337, 85.423231);
  GoogleMapController _controller;
  Location _location = Location();

  void _onMapCreated(GoogleMapController _cntlr)
  {
    _controller = _cntlr;
    _location.onLocationChanged.listen((l) { 
        _controller.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(target: LatLng(l.latitude, l.longitude),zoom: 15),
          ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar (
        title: Text("Sanam Map"),
      ),
        body: Container(
        child: 
        GoogleMap(
                    initialCameraPosition: CameraPosition(target: _initialcameraposition),
                    mapType: MapType.normal,
                    onMapCreated: _onMapCreated,
                    myLocationEnabled: true,
                  ),
      ),
    );
  }
}
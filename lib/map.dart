import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';
import 'package:geolocator/geolocator.dart';

void main() {
  return runApp(Map());
}
//
//var geolocator = Geolocator();
//var locationOption = LocationOptions(
//    accuracy: LocationAccuracy.high, distanceFilter: 10);


class Map extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MapPage(),
    );
  }
}

class MapPage extends StatefulWidget {
  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {

  var currentLocation = <String, double>{};

//  Future<Position> position = Geolocator().getCurrentPosition(
//      desiredAccuracy: LocationAccuracy.high);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Position>(
//        future: position,
        builder: (BuildContext context, AsyncSnapshot<Position> snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return Text('LOad again');
            case ConnectionState.active:
            case ConnectionState.waiting:
              return Text('Awaiting result....');
            case ConnectionState.done:
              if (snapshot.hasError) return Text('Error: ${snapshot.error}');
              return Scaffold(
                body: FlutterMap(
                  options: MapOptions(center: LatLng(
                      snapshot.data.latitude, snapshot.data.longitude),
                      minZoom: 1.0),
                  layers: [
                    TileLayerOptions(
                        urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                        subdomains: ['a', 'b', 'c']),
                    MarkerLayerOptions(markers: [
                      Marker(
                          width: 45.0,
                          height: 45.0,
                          point: LatLng(
                              snapshot.data.latitude, snapshot.data.longitude),
                          builder: (context) =>
                              Container(
                                child: IconButton(
                                    icon: Icon(Icons.location_on),
                                    color: Colors.deepOrange,
                                    iconSize: 45.0,
                                    onPressed: () {
                                      print('Market tapped');
                                    }),
                              ))
                    ])
                  ],
                ),
              );
          }
        });
  }
}

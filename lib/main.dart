//Dart
import 'package:flutter/material.dart';
import 'dart:async';

//Third Party Import
// -Google flutter team
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  Completer<GoogleMapController> _controller = Completer();

  static const LatLng _center = const LatLng(3.0760, 101.5860);

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          brightness: Brightness.light,
          primarySwatch: Colors.deepOrange,
          accentColor: Colors.deepOrangeAccent,
        ),
        home: Scaffold(
          drawer: Drawer(
            child: Column(
              children: <Widget>[
                Container(
                  color: Theme.of(context).accentColor,
                  height: 250.0,
                ),
                ListTile(
                  title: Text('My Pocket'),
                  onTap: (){},
                )
              ],
            ),
          ),
          appBar: AppBar(
            title: Text('OPark'),
          ),
          body: GoogleMap(
            onMapCreated: _onMapCreated,
            initialCameraPosition: CameraPosition(target: _center, zoom: 15.0),
          ),
        ));
  }
}

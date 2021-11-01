import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:markers_task/app_state.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<AppState>();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Map markers demo"),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            ListTile(
              title: const Text('Markers'),
              onTap: () {
                Navigator.popAndPushNamed(context, "/markers");
              },
            ),
          ],
        ),
      ),
      body: GoogleMap(
        initialCameraPosition: const CameraPosition(
          target: LatLng(48.46121102934964, 35.00584614545477),
          zoom: 11,
        ),
        markers: appState.markers.toSet(),
      ),
    );
  }
}

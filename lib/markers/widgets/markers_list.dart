import 'package:flutter/material.dart';
import 'package:markers_task/app_state.dart';
import 'package:provider/provider.dart';

class MarkersList extends StatefulWidget {
  const MarkersList({Key? key}) : super(key: key);

  @override
  State<MarkersList> createState() => _MarkersListState();
}

class _MarkersListState extends State<MarkersList> {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<AppState>();

    return Expanded(
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: appState.markers.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(
              appState.markers[index].infoWindow.title!,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            leading: const Icon(Icons.map),
            trailing: IconButton(
              onPressed: () {
                appState.removeMarker(appState.markers[index]);
              },
              icon: const Icon(Icons.remove),
            ),
            subtitle: Text(
              appState.markers[index].position.toString(),
              style: const TextStyle(fontWeight: FontWeight.w300),
            ),
          );
        },
      ),
    );
  }
}

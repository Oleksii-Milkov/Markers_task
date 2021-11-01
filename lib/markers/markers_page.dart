import 'package:flutter/material.dart';
import 'package:markers_task/markers/widgets/markers_form.dart';
import 'package:markers_task/markers/widgets/markers_list.dart';

class MarkersPage extends StatelessWidget {
  const MarkersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Markers"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: const [
            MarkersForm(),
            Divider(
              height: 10,
              thickness: 1,
            ),
            MarkersList(),
          ],
        ),
      ),
    );
  }
}



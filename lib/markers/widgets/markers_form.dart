import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:markers_task/app_state.dart';
import 'package:provider/provider.dart';

class MarkersForm extends StatefulWidget {
  const MarkersForm({Key? key}) : super(key: key);

  @override
  State<MarkersForm> createState() => _MarkersFormState();
}

class _MarkersFormState extends State<MarkersForm> {
  final _formKey = GlobalKey<FormState>();

  final _longitude = TextEditingController();
  final _latitude = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var appState = (context).watch<AppState>();

    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: TextFormField(
                        keyboardType: const TextInputType.numberWithOptions(
                            decimal: true),
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Enter the latitude",
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Not valid";
                          } else if (double.parse(value) < -90 ||
                              double.parse(value) > 90) {
                            return "Value must be in diapason [-90, 90]";
                          }
                          return null;
                        },
                        controller: _latitude,
                      ),
                    ),
                    TextFormField(
                      keyboardType:
                          const TextInputType.numberWithOptions(decimal: true),
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Enter the longitude"),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Not valid";
                        } else if (double.parse(value) < -90 ||
                            double.parse(value) > 90) {
                          return "Value must be in diapason [-90, 90]";
                        }
                        return null;
                      },
                      controller: _longitude,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: IconButton(
                  onPressed: () {
                    _latitude.text = appState.generateLatLng();
                    _longitude.text = appState.generateLatLng();
                  },
                  icon: const Icon(Icons.android),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        appState.addMarker(
                          LatLng(
                            double.parse(_latitude.text),
                            double.parse(_longitude.text),
                          ),
                        );
                        FocusScope.of(context).unfocus();
                      }
                    },
                    child: const Text("Submit"),
                  ),
                ),
                OutlinedButton(
                  onPressed: () {
                    _longitude.clear();
                    _latitude.clear();
                  },
                  child: const Text("Clear"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

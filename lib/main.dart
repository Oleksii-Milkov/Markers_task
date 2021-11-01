import 'package:flutter/material.dart';
import 'package:markers_task/app_state.dart';
import 'package:markers_task/home/home_page.dart';
import 'package:markers_task/markers/markers_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AppState(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: "/",
        routes: {
          "/": (context) => const HomePage(),
          "/markers": (context) => const MarkersPage(),
        },
      ),
    );
  }
}

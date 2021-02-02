import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_google_maps/home_page.dart';
import 'package:test_google_maps/notifiers/home_notifier.dart';

void main() => runApp(
      ChangeNotifierProvider(
        create: (context) => HomeNotifier(),
        child: MyApp(),
      ),
    );

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Google Maps Test",
      home: HomePage(),
    );
  }
}

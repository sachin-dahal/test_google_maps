import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_google_maps/notifiers/home_notifier.dart';
import 'package:test_google_maps/notifiers/open_map_notifier.dart';
import 'package:test_google_maps/screens/home_page.dart';
import 'package:test_google_maps/screens/open_map_page.dart';

void main() => runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => HomeNotifier()),
          ChangeNotifierProvider(create: (_) => OpenMapNotifier()),
        ],
        child: MyApp(),
      ),
    );

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Google Maps Test",
      home: HomePage(),
      //home: OpenMapPage(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spacex_app/providers/ships.dart';
import 'package:spacex_app/screens/ships_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => Ships(),
      child: MaterialApp(
        title: 'SpaceX',
        theme: ThemeData(
          primarySwatch: Colors.blueGrey,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          textTheme: ThemeData.light().textTheme.copyWith(
                headline6: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
        ),
        home: ShipsScreen(),
      ),
    );
  }
}

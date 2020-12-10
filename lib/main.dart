import 'package:flutter/material.dart';
import 'package:restaurant_app/pages/home.dart';
import 'package:restaurant_app/pages/resto_detail.dart';
import 'theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'Nunito',
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: appTextTheme,
      ),
      initialRoute: HomePage.routeName,
      routes: {
        HomePage.routeName: (context) => HomePage(),
        DetailRestaurant.routeName: (context) => DetailRestaurant(
              restaurant: ModalRoute.of(context).settings.arguments,
            ),
      },
      home: HomePage(),
    );
  }
}

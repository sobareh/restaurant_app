import 'package:flutter/material.dart';
import 'package:restaurant_app/models/restaurant_model.dart';
import 'package:restaurant_app/services/restaurant_services.dart';
import 'package:restaurant_app/widgets/header.dart';
import 'package:restaurant_app/widgets/list_restaurant.dart';
import 'package:restaurant_app/widgets/menu_tile.dart';
import 'package:restaurant_app/widgets/popular_tile.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedItemIndex = 0;
  List<RestaurantElement> restaurants;
  bool loading;

  @override
  void initState() {
    super.initState();
    loading = true;
    RestaurantService.loadRestaurants().then((list) {
      setState(() {
        restaurants = list;
        loading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            child: Column(
              children: [
                HeaderWidget(),
                MenuTileWidget(),
                SizedBox(height: 24),
                PopularTile(),
                SizedBox(height: 24),
                ListRestaurantWidget(restaurants: restaurants),
                // SizedBox(height: 8),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          buildNavBarItem('assets/icon/bar1.png', 0),
          buildNavBarItem('assets/icon/bar2.png', 1),
          buildNavBarItem('assets/icon/bar3.png', 2),
          buildNavBarItem('assets/icon/bar4.png', 3),
        ],
      ),
    );
  }

  Widget buildNavBarItem(String imageData, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedItemIndex = index;
          print(_selectedItemIndex);
        });
      },
      child: Container(
        height: 60,
        decoration: index == _selectedItemIndex
            ? BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    width: 3,
                    color: Color(0xff54A5DA),
                  ),
                ),
              )
            : null,
        child: Image.asset(
          imageData,
          height: 32,
          width: 32,
          color: index == _selectedItemIndex
              ? Color(0xff54A5DA)
              : Color(0xff747474),
        ),
      ),
    );
  }
}

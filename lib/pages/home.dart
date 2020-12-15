import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/providers/restaurant_provider.dart';
import 'package:restaurant_app/services/restaurant_services.dart';
import 'package:restaurant_app/widgets/header.dart';
import 'package:restaurant_app/widgets/list_restaurant.dart';
import 'package:restaurant_app/widgets/menu_tile.dart';
import 'package:restaurant_app/widgets/popular_tile.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/restaurant_home';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedItemIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          buildNavBarItem('assets/icon/bar1.png', 0),
          buildNavBarItem('assets/icon/bar2.png', 1),
          buildNavBarItem('assets/icon/bar3.png', 2),
          buildNavBarItem('assets/icon/bar4.png', 3),
        ],
      ),
      body: ChangeNotifierProvider<RestoProvider>(
        create: (_) => RestoProvider(loadRestaurant: RestaurantService()),
        child: SafeArea(
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
                  Consumer<RestoProvider>(
                    builder: (context, state, _) {
                      if (state.state == RestoState.Loading) {
                        return Center(child: CircularProgressIndicator());
                      } else if (state.state == RestoState.HasData) {
                        return ListRestaurantWidget(
                          restaurants: state.result.restaurants,
                        );
                      } else if (state.state == RestoState.NoData) {
                        return Center(child: Text(state.message));
                      } else if (state.state == RestoState.Error) {
                        return Center(child: Text(state.message));
                      } else {
                        return Center(child: Text(''));
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
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
                    color: Colors.orange.withOpacity(0.9),
                  ),
                ),
              )
            : null,
        child: Image.asset(
          imageData,
          height: 32,
          width: 32,
          color: index == _selectedItemIndex
              ? Colors.orange.withOpacity(0.9)
              : Color(0xff747474),
        ),
      ),
    );
  }
}

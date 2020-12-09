import 'package:flutter/material.dart';
import 'package:restaurant_app/widgets/category_menu_tile.dart';

class MenuTileWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 3),
      height: 175.0,
      child: ListView(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          CategoryMenuWidget(
            subtitle: 'Sweets - 12 Item',
            urlImage: 'assets/image/icecream1.png',
          ),
          CategoryMenuWidget(
            subtitle: 'Beverages - 42 Item',
            urlImage: 'assets/image/icecream2.png',
          ),
          CategoryMenuWidget(
            subtitle: 'Snack - 25 Item',
            urlImage: 'assets/image/icecream3.png',
          ),
          CategoryMenuWidget(
            subtitle: 'Sour - 17 Item',
            urlImage: 'assets/image/icecream1.png',
          ),
          CategoryMenuWidget(
            subtitle: 'Desserts - 19 Item',
            urlImage: 'assets/image/icecream2.png',
          ),
        ],
      ),
    );
  }
}

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
            urlImage:
                'https://images.pexels.com/photos/974229/pexels-photo-974229.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
          ),
          CategoryMenuWidget(
            subtitle: 'Beverages - 11 Item',
            urlImage:
                'https://images.pexels.com/photos/1200348/pexels-photo-1200348.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
          ),
          CategoryMenuWidget(
            subtitle: 'Snack - 9 Item',
            urlImage:
                'https://images.pexels.com/photos/5446513/pexels-photo-5446513.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
          ),
          CategoryMenuWidget(
            subtitle: 'Foods - 23 Item',
            urlImage:
                'https://images.pexels.com/photos/2641886/pexels-photo-2641886.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=750&w=1260',
          ),
          CategoryMenuWidget(
            subtitle: 'Desserts - 15 Item',
            urlImage:
                'https://images.pexels.com/photos/5765719/pexels-photo-5765719.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
          ),
        ],
      ),
    );
  }
}

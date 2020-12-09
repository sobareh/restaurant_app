import 'package:flutter/material.dart';
import 'package:restaurant_app/models/restaurant_model.dart';
import 'package:restaurant_app/widgets/restaurant_item.dart';

class ListRestaurantWidget extends StatelessWidget {
  const ListRestaurantWidget({
    Key key,
    @required this.restaurants,
  }) : super(key: key);

  final List<RestaurantElement> restaurants;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(vertical: 3),
      child: ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: restaurants == null ? 0 : restaurants.length,
        itemBuilder: (context, index) {
          RestaurantElement restaurant = restaurants[index];
          return RestaurantItem(
              name: restaurant.name,
              pictureId: restaurant.pictureId,
              city: restaurant.city,
              rating: restaurant.rating.toString());
        },
      ),
    );
  }
}

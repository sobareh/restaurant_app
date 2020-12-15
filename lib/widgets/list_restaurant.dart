import 'package:flutter/material.dart';
import 'package:restaurant_app/models/restaurant_model.dart';
import 'package:restaurant_app/pages/resto_detail.dart';

class ListRestaurantWidget extends StatelessWidget {
  ListRestaurantWidget({@required this.restaurants});

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
          return buildBuildRestaurantItem(context, restaurant);
        },
      ),
    );
  }

  Widget buildBuildRestaurantItem(
      BuildContext context, RestaurantElement restaurant) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          DetailRestaurant.routeName,
          arguments: restaurant.id,
        );   
      },
      child: Container(
        margin: EdgeInsets.fromLTRB(15, 3, 15, 5),
        padding: EdgeInsets.symmetric(horizontal: 25, vertical: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.grey[350],
                spreadRadius: 1,
                blurRadius: 5,
                offset: Offset(0, 3))
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 80.0,
              width: 120.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    'https://restaurant-api.dicoding.dev/images/medium/' +
                        restaurant.pictureId,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 14,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  restaurant.name,
                  style: TextStyle(fontWeight: FontWeight.w900, fontSize: 14),
                ),
                SizedBox(height: 3),
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.place,
                      size: 20,
                      color: Color(0xffFA5D5D),
                    ),
                    SizedBox(width: 4),
                    Text(
                      restaurant.city,
                      style:
                          TextStyle(fontWeight: FontWeight.w300, fontSize: 12),
                    ),
                  ],
                ),
                SizedBox(height: 2),
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.star,
                      size: 20,
                      color: Colors.orangeAccent,
                    ),
                    SizedBox(width: 4),
                    Text(
                      restaurant.rating.toString(),
                      style:
                          TextStyle(fontWeight: FontWeight.w300, fontSize: 11),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

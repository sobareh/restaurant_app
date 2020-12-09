import 'package:flutter/material.dart';

class RestaurantItem extends StatelessWidget {
  final String name;
  final String pictureId;
  final String city;
  final String rating;

  RestaurantItem({this.name, this.pictureId, this.city, this.rating});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        margin: EdgeInsets.fromLTRB(15, 3, 15, 5),
        padding: EdgeInsets.symmetric(horizontal: 25, vertical: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
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
            Image.network(
              pictureId,
              width: 100,
              height: 100,
            ),
            SizedBox(
              width: 14,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
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
                      city,
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
                      rating,
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

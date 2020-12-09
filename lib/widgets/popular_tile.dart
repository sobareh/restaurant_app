import 'package:flutter/material.dart';

class PopularTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 14),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(width: 10),
          Icon(
            Icons.favorite,
            color: Color(0xffFA5D5D),
            size: 42.0,
          ),
          SizedBox(width: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Popular',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              Text(
                'Let’s choose, our popular Restaurant',
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 13),
              ),
            ],
          ),
          SizedBox(width: 30),
          Image.asset(
            'assets/icon/heart.png',
            height: 30,
            width: 30,
          )
        ],
      ),
    );
  }
}

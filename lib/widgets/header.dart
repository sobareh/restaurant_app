import 'package:flutter/material.dart';
import 'package:restaurant_app/pages/search_resto.dart';

class HeaderWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Text(
              'What do you want to eat today?',
              style: Theme.of(context).textTheme.headline5,
            ),
          ),
          SizedBox(
            width: 18,
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, SearchResto.routeName);
            },
            child: Image.asset(
              'assets/icon/search.png',
              width: 103,
              height: 103,
            ),
          ),
        ],
      ),
    );
  }
}

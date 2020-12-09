import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({
    Key key,
  }) : super(key: key);

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
          Image.asset(
            'assets/icon/search.png',
            width: 103,
            height: 103,
          ),
        ],
      ),
    );
  }
}

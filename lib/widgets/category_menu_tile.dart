import 'package:flutter/material.dart';

class CategoryMenuWidget extends StatelessWidget {
  final String subtitle;
  final String urlImage;

  CategoryMenuWidget({@required this.subtitle, @required this.urlImage});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: 13),
      child: Column(
        children: <Widget>[
          Image.asset(
            urlImage,
            width: 140,
            height: 140,
          ),
          SizedBox(
            height: 8,
          ),
          Text(subtitle, style: Theme.of(context).textTheme.caption)
        ],
      ),
    );
  }
}

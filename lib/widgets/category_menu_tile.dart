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
          Container(
            height: 140.0,
            width: 140.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(urlImage),
              ),
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            subtitle,
            style: Theme.of(context).textTheme.caption,
          ),
        ],
      ),
    );
  }
}

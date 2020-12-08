import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 18),
          color: Colors.white,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
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
                      width: 100,
                      height: 100,
                    ),
                  ],
                ),
                MenuTileWidget(),
                SizedBox(height: 24),
                Container(
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
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Popular',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          Text(
                            'Let’s choose, and enjoy the food',
                            style: TextStyle(
                                fontWeight: FontWeight.w400, fontSize: 14),
                          ),
                        ],
                      ),
                      SizedBox(width: 49),
                      Image.asset(
                        'assets/icon/heart.png',
                        height: 30,
                        width: 30,
                      )
                    ],
                  ),
                ),
                SizedBox(height: 24),
                RestaurantTile(),
                SizedBox(height: 8),
                RestaurantTile(),
                SizedBox(height: 8),
                RestaurantTile(),
                SizedBox(height: 8),
                RestaurantTile(),
                SizedBox(height: 8),
                RestaurantTile(),
                SizedBox(height: 8),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MenuTileWidget extends StatelessWidget {
  const MenuTileWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 167,
      child: Flexible(
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
              subtitle: 'Snack - 42 Item',
              urlImage: 'assets/image/icecream3.png',
            ),
            CategoryMenuWidget(
              subtitle: 'Sweets - 42 Item',
              urlImage: 'assets/image/icecream1.png',
            ),
            CategoryMenuWidget(
              subtitle: 'Snack - 42 Item',
              urlImage: 'assets/image/icecream2.png',
            ),
          ],
        ),
      ),
    );
  }
}

class RestaurantTile extends StatelessWidget {
  const RestaurantTile({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey[350],
            spreadRadius: 1,
            blurRadius: 12,
          )
        ],
      ),
      child: InkWell(
        onTap: () {
          print('test 123');
        },
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 11, vertical: 10),
          child: Row(
            children: [
              Image.network(
                'https://restaurant-api.dicoding.dev/images/medium/14',
                width: 85,
                height: 85,
              ),
              SizedBox(
                width: 14,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Restoran Melted Milk',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  SizedBox(height: 3),
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.star,
                        size: 20,
                        color: Colors.orangeAccent,
                      ),
                      SizedBox(width: 4),
                      Text(
                        '4.2 Rating',
                        style: TextStyle(
                            fontWeight: FontWeight.w300, fontSize: 13),
                      ),
                    ],
                  ),
                  SizedBox(height: 2),
                  Text(
                    'assets/image/icecream1.png',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CategoryMenuWidget extends StatelessWidget {
  final String subtitle;
  final String urlImage;

  CategoryMenuWidget({@required this.subtitle, @required this.urlImage});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(right: 13),
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
      ),
    );
  }
}

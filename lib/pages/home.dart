import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedItemIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.white,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
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
                ),
                MenuTileWidget(),
                SizedBox(height: 24),
                PopularMenuWidget(),
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
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          buildNavBarItem('assets/icon/bar1.png', 0),
          buildNavBarItem('assets/icon/bar2.png', 1),
          buildNavBarItem('assets/icon/bar3.png', 2),
          buildNavBarItem('assets/icon/bar4.png', 3),
        ],
      ),
    );
  }

  Widget buildNavBarItem(String imageData, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedItemIndex = index;
          print(_selectedItemIndex);
        });
      },
      child: Container(
        height: 60,
        decoration: index == _selectedItemIndex
            ? BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    width: 3,
                    color: Color(0xffF58342),
                  ),
                ),
              )
            : null,
        child: Image.asset(
          imageData,
          height: 32,
          width: 32,
          color: index == _selectedItemIndex
              ? Color(0xffF58342)
              : Color(0xff747474),
        ),
      ),
    );
  }
}

class PopularMenuWidget extends StatelessWidget {
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
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              Text(
                'Let’s choose, and enjoy the food',
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
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
    );
  }
}

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
    );
  }
}

class RestaurantTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        final snackBar = SnackBar(content: Text("Tap"));

        Scaffold.of(context).showSnackBar(snackBar);
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 15),
        padding: EdgeInsets.symmetric(horizontal: 11, vertical: 10),
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
                      'Iskandar Muda, Sunggal, Medan',
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
                      '4.2 Rating',
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

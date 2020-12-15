import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/models/restaurant_detail_model.dart';
import 'package:restaurant_app/providers/restaurant_detail_provider.dart';
import 'package:restaurant_app/services/restaurant_services.dart';

class DetailRestaurant extends StatelessWidget {
  static const routeName = '/restaurant_detail';

  final String restaurantId;

  const DetailRestaurant({@required this.restaurantId});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => DetailRestoProvider(getDetailRestaurant: RestaurantService(), id: restaurantId),
      child: Scaffold(
          body: Consumer<DetailRestoProvider>(
            builder: (context, state, _) {
              if (state.state == DetailRestoState.Loading) {
                return Center(child: CircularProgressIndicator());
              } else if (state.state == DetailRestoState.HasData) {
                return RestoDetailItemWidget(
                  restaurant: state.result.restaurant
                );
              } else if (state.state == DetailRestoState.NoData) {
                return Center(child: Text(state.message));
              } else if (state.state == DetailRestoState.Error) {
                return Center(child: Text(state.message));
              } else if (state.state == DetailRestoState.BadRequest) {
                return Center(child: Text(state.message)); 
              }
              else {
                return Center(child: Text(''));
              }
            },
            
          ),
        ),
    );
  }

  // Container buildMenuItem(BuildContext context, Drink food) {
  //   return Container(
  //     padding: EdgeInsets.only(bottom: 10.0),
  //     child: Row(
  //       children: <Widget>[
  //         Container(
  //           height: 100.0,
  //           width: 100.0,
  //           decoration: BoxDecoration(
  //             borderRadius: BorderRadius.circular(15.0),
  //             image: DecorationImage(
  //               fit: BoxFit.cover,
  //               image: NetworkImage(
  //                 _isActive
  //                     ? 'https://images.pexels.com/photos/2641886/pexels-photo-2641886.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=750&w=1260'
  //                     : 'https://images.pexels.com/photos/792613/pexels-photo-792613.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
  //               ),
  //             ),
  //           ),
  //         ),
  //         SizedBox(width: 10.0),
  //         Column(
  //           crossAxisAlignment: CrossAxisAlignment.start,
  //           children: <Widget>[
  //             Text(
  //               food.name,
  //               style: TextStyle(
  //                   fontSize: 22,
  //                   fontWeight: FontWeight.bold,
  //                   color: Colors.grey[600]),
  //             ),
  //             SizedBox(height: 5.0),
  //             Container(
  //               width: MediaQuery.of(context).size.width - 150,
  //               child: Text(
  //                 'you should consume ${food.name} per day according to the daily newspaper.',
  //                 style: TextStyle(
  //                     fontSize: 14,
  //                     fontWeight: FontWeight.bold,
  //                     color: Colors.grey[600]),
  //               ),
  //             ),
  //           ],
  //         )
  //       ],
  //     ),
  //   );
  // }
}

class RestoDetailItemWidget extends StatelessWidget {
 
 RestoDetailItemWidget({
    @required this.restaurant
  });

 final RestaurantItem restaurant;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage('https://restaurant-api.dicoding.dev/images/medium/' + restaurant.pictureId),
                fit: BoxFit.cover),
          ),
        ),
        Positioned(
          top: 55,
          right: 25,
          child: CircleAvatar(
            backgroundColor: Colors.grey.withOpacity(0.4),
            child: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ),
        Positioned(
          top: MediaQuery.of(context).size.height * 0.32,
          left: 25.0,
          child: Container(
            padding: EdgeInsets.all(5),
            width: MediaQuery.of(context).size.width / 6,
            height: 40.0,
            decoration: BoxDecoration(
              color: Colors.orange.withOpacity(0.9),
              borderRadius: BorderRadius.circular(20.0),
              border: Border.all(width: 1.0, color: Colors.white),
            ),
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Icons.star,
                  color: Colors.white,
                ),
                Text(
                  restaurant.rating.toString(),
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: MediaQuery.of(context).size.height * 0.38,
          left: 25.0,
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Kota ${restaurant.city}',
                  style: TextStyle(
                    fontSize: 17.0,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 5.0,
                ),
                Container(
                  width: MediaQuery.of(context).size.width - 10,
                  child: Text(
                    restaurant.name,
                    style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 0.0,
          child: Container(
            padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 15.0),
            height: MediaQuery.of(context).size.height * 0.46,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15.0),
                topRight: Radius.circular(15.0),
              ),
              color: Colors.white,
            ),
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(bottom: 7.0),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          width: 2.0,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Description',
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[800]),
                        ),
                        SizedBox(height: 5.0),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          child: Text(
                           restaurant.description,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[600],
                            ),
                            textAlign: TextAlign.justify,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 5),
                  Container(
                    child: Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            FlatButton(
                              onPressed: () {
                                // setState(() {
                                //   _isActive = true;
                                // });
                              },
                              child: Text(
                                'Foods',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                    color: Colors.white),
                              ),
                              color: Colors.orange.withOpacity(0.9),
                            ),
                            SizedBox(width: 10.0),
                            FlatButton(
                              onPressed: () {
                                // setState(() {
                                //   _isActive = false;
                                // });
                              },
                              child: Text(
                                'Drinks',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                    color: Colors.white),
                              ),
                              color: Colors.orange.withOpacity(0.9),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        // MediaQuery.removePadding(
                        //   context: context,
                        //   removeTop: true,
                        //   child: _isActive
                        //       ? ListView.builder(
                        //           physics: NeverScrollableScrollPhysics(),
                        //           shrinkWrap: true,
                        //           itemCount:
                        //               widget.restaurant.menus.foods.length,
                        //           itemBuilder: (context, index) {
                        //             Drink food =
                        //                 widget.restaurant.menus.foods[index];
                        //             return buildMenuItem(context, food);
                        //           },
                        //         )
                        //       : ListView.builder(
                        //           physics: NeverScrollableScrollPhysics(),
                        //           shrinkWrap: true,
                        //           itemCount:
                        //               widget.restaurant.menus.drinks.length,
                        //           itemBuilder: (context, index) {
                        //             Drink drink =
                        //                 widget.restaurant.menus.drinks[index];
                        //             return buildMenuItem(context, drink);
                        //           },
                        //         ),
                        // ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
            );
      }      
  }

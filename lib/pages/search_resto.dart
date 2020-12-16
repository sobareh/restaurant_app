import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/providers/search_restaurant.dart';
import 'package:restaurant_app/services/restaurant_services.dart';

class SearchResto extends StatefulWidget {
  static const routeName = '/search_restaurant';

  @override
  _SearchRestoState createState() => _SearchRestoState();
}

class _SearchRestoState extends State<SearchResto> {
  String keyword;
  bool showListView = true;

  Future _searchResto;

  @override
  Widget build(BuildContext context) {
    var builder2 = (context, snapshot) {
  switch (snapshot.connectionState) {
        case ConnectionState.none:
          return  Container(
                            height: MediaQuery.of(context).size.height / 2,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                            Image.asset('assets/image/resto.png',width: 175,
                              height: 175,),
                            Center(child: Text('type and search your favourite restaurant..', style: TextStyle(
                              color: Colors.grey[600],
                            ),
                          ),
                          ),
                        ],
                      ),
                    );
        case ConnectionState.waiting:
          print("waiting");
          return Center(child: CircularProgressIndicator());
        case ConnectionState.active:
          print("active");
          return Center(child: CircularProgressIndicator());
        case ConnectionState.done:
          if (snapshot.hasError) {
            print("has Error");
            return Text(
              '${snapshot.error}',
              style: TextStyle(color: Colors.red),
            );
          } else if(snapshot.hasData) {
            return Container(
                height: MediaQuery.of(context).size.height,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: snapshot.data.restaurants.length == null ? 0 : snapshot.data.restaurants.length,
                itemBuilder: (context, index) {
                  var data = snapshot.data.restaurants[index];
                  return Container(
                    padding: EdgeInsets.only(bottom: 10.0),
                    child: Row(
                      children: <Widget>[
                        Container(
                          height: 100.0,
                          width: 100.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                'https://restaurant-api.dicoding.dev/images/medium/'+ data.pictureId
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 10.0),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              data.name,
                              style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey[600]),
                            ),
                            SizedBox(height: 5.0),
                            Container(
                              width: MediaQuery.of(context).size.width - 150,
                              child: Text(
                                'you should consume ${data.name} per day according to the daily newspaper.',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey[600]),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  );
                },),
            );
          }
      }
  };
        return Scaffold(
          body: ChangeNotifierProvider<SearchRestoProvider>(
            create: (_) => SearchRestoProvider(searchRestaurant: RestaurantService(), keyword: keyword),
            child: SafeArea(
            child: SingleChildScrollView(
                  child: Column(
                  children:[ 
                    Container(
                      height: 70,
                      padding: EdgeInsets.fromLTRB(10,8,10,4),
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                          color: Colors.grey[300], 
                          width: 0.4),
                            ),
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                            blurRadius: 7,
                            color: Colors.grey[300],
                            offset: Offset(0.0, 0.75)
                            )
                        ],
                        color: Colors.white,  
                        ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            child: GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Icon(Icons.arrow_back, color: Colors.orange),)
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25.0),
                              color: Colors.grey[300].withOpacity(0.5)
                            ),
                            height: 45,
                            width: MediaQuery.of(context).size.width * 0.78,
                            child: TextField(
                              onChanged: (value) {
                                 keyword = value;
                              },
                              onSubmitted: (value) {
                                keyword = value;
                                setState(() {
                                    _searchResto = RestaurantService.searchRestaurant(keyword);
                                    showListView = !showListView;
                                  });
                              },
                              cursorColor: Colors.orange,
                              style: TextStyle(decoration: TextDecoration.none),
                              decoration: InputDecoration.collapsed(
                                border: InputBorder.none,
                                hintText: 'Search restaurant...',
                              ),
                              maxLines: 1,
                            ),
                          ),
                          Container(
                            child: GestureDetector(
                              onTap: () {                              
                                  setState(() {
                                    _searchResto = RestaurantService.searchRestaurant(keyword);
                                    showListView = !showListView;
                                  });
                                }
                              ,
                                child: Icon(Icons.search_sharp, color: Colors.orange),),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    FutureBuilder(
                                future: _searchResto,
                                builder: builder2
                  )
                
            ],
          ),
        ),
      ),
    )
    );
  }
}

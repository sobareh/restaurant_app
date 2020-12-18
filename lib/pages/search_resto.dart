import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/models/restaurant_search_model.dart';
import 'package:restaurant_app/providers/search_restaurant_provider.dart';

class SearchResto extends StatelessWidget {
  static var routeName = '/search_restaurant';
  String keyword;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider<SearchRestoProvider>(
        create: (_) => SearchRestoProvider(),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 70,
                  padding: EdgeInsets.fromLTRB(10, 8, 10, 4),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: Colors.grey[300], width: 0.4),
                    ),
                    boxShadow: <BoxShadow>[
                      BoxShadow(blurRadius: 7, color: Colors.grey[300], offset: Offset(0.0, 0.75))
                    ],
                    color: Colors.white,
                  ),
                  child: Consumer<SearchRestoProvider>(
                    builder: (context, state, _) {
                      return Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                              child: GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Icon(Icons.arrow_back, color: Colors.orange),
                          )),
                          Container(
                            padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25.0),
                                color: Colors.grey[300].withOpacity(0.5)),
                            height: 45,
                            width: MediaQuery.of(context).size.width * 0.78,
                            child: TextField(
                              onChanged: (value) {
                                keyword = value;
                              },
                              onSubmitted: (value) {
                                keyword = value;
                                state.getResto(SearchRestoState.Start, keyword);
                                state.showSearchResult();
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
                                state.getResto(SearchRestoState.Start, keyword);
                                state.showSearchResult();
                              },
                              child: Icon(Icons.search_sharp, color: Colors.orange),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
                SizedBox(height: 10),
                Consumer<SearchRestoProvider>(
                  builder: (context, state, _) {
                    if (state.isActive == false) {
                      return Container(
                        height: MediaQuery.of(context).size.height / 2,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/image/resto.png',
                              width: 175,
                              height: 175,
                            ),
                            Center(
                              child: Text(
                                'type and search your favourite restaurant..',
                                style: TextStyle(
                                  color: Colors.grey[600],
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    } else if (state.state == SearchRestoState.Loading) {
                      return Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      );
                    } else if (state.state == SearchRestoState.HasData) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.symmetric(vertical: 3),
                        child: ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: state.result.restaurants == null
                              ? 0
                              : state.result.restaurants.length,
                          itemBuilder: (context, index) {
                            RestaurantItemSearch restaurant = state.result.restaurants[index];
                            return SearchRestoItemWidget(data: restaurant);
                          },
                        ),
                      );
                    } else if (state.state == SearchRestoState.NoData) {
                      return Container(
                        height: MediaQuery.of(context).size.height / 2,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.search_off_outlined,
                              color: Colors.grey[350],
                              size: 175,
                            ),
                            Center(
                              child: Text(
                                'Oops.. Resto not found',
                                style: TextStyle(color: Colors.grey[600], fontSize: 18),
                              ),
                            ),
                          ],
                        ),
                      );
                    } else if (state.state == SearchRestoState.Error) {
                      return Center(child: Text(state.message));
                    } else {
                      return Center(child: Text(''));
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SearchRestoItemWidget extends StatelessWidget {
  const SearchRestoItemWidget({
    @required this.data,
  });

  final RestaurantItemSearch data;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 10.0),
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
                    'https://restaurant-api.dicoding.dev/images/medium/' + data.pictureId),
              ),
            ),
          ),
          SizedBox(width: 10.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                data.name,
                style:
                    TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.grey[600]),
              ),
              SizedBox(height: 5.0),
              Container(
                width: MediaQuery.of(context).size.width - 150,
                child: Text(
                  'you should consume ${data.name} per day according to the daily newspaper.',
                  style:
                      TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.grey[600]),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

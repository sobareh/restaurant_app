import 'package:flutter/foundation.dart';
import 'package:restaurant_app/models/restaurant_model.dart';
import 'package:restaurant_app/services/restaurant_services.dart';

enum SearchRestoState {Loading, NoData, HasData, Error, BadRequest}

class SearchRestoProvider extends ChangeNotifier {
  final RestaurantService searchRestaurant;
  final String keyword;

  SearchRestoProvider({@required this.searchRestaurant, @required this.keyword}){
    _searchRestaurant(keyword);
  }

  Restaurant _restaurantList;
  String _message;
  SearchRestoState _state;

  String get message => _message;

  Restaurant get result => _restaurantList;

  SearchRestoState get state => _state;

  Future<dynamic> _searchRestaurant(String keyword) async {
     try {
      _state = SearchRestoState.Loading;
      notifyListeners();

      final Restaurant restaurantList = await RestaurantService.searchRestaurant(keyword);

      if (restaurantList.restaurants.isEmpty) {
        _state = SearchRestoState.NoData;
        notifyListeners();
        return _message = 'Empty Data';
      } else {
        _state = SearchRestoState.HasData;
        notifyListeners();
        return _restaurantList = restaurantList;
      }
    } catch (e) {
      _state = SearchRestoState.Error;
      notifyListeners();
      return _message = 'Error --> $e';
    }
  }
}

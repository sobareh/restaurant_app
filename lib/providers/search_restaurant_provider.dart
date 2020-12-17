import 'package:flutter/foundation.dart';
import 'package:restaurant_app/models/restaurant_search_model.dart';
import 'package:restaurant_app/services/restaurant_services.dart';

enum SearchRestoState {
  Start,
  Loading,
  NoData,
  HasData,
  Error,
  BadRequest,
}

class SearchRestoProvider extends ChangeNotifier {
  final String keyword;

  SearchRestoProvider({this.keyword});

  SearchRestaurant _restaurantList;
  String _message;
  SearchRestoState _state;

  String get message => _message;

  SearchRestaurant get result => _restaurantList;

  SearchRestoState get state => _state;

  void getResto(SearchRestoState begin, String keyword) {
    _state = begin;
    _searchRestaurant(keyword);
    print(_state);
    notifyListeners();
  }

  Future<dynamic> _searchRestaurant(String keyword) async {
    try {
      _state = SearchRestoState.Loading;
      notifyListeners();

      final SearchRestaurant restaurantList =
          await RestaurantService.searchRestaurant(keyword);

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

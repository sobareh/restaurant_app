import 'package:flutter/foundation.dart';
import 'package:restaurant_app/models/restaurant_model.dart';
import 'package:restaurant_app/services/restaurant_services.dart';

enum RestoState { Loading, NoData, HasData, Error }

class RestoProvider extends ChangeNotifier {
  final RestaurantService loadRestaurant;

  RestoProvider({@required this.loadRestaurant}) {
    _loadRestaurant();
  }

  Restaurant _restoResult;
  String _message;
  RestoState _state;

  String get message => _message;

  Restaurant get result => _restoResult;

  RestoState get state => _state;

  Future<dynamic> _loadRestaurant() async {
    try {
      _state = RestoState.Loading;
      notifyListeners();

      final restaurant = await RestaurantService.loadRestaurants();

      if (restaurant.restaurants.isEmpty) {
        _state = RestoState.NoData;
        notifyListeners();
        return _message = 'Empty Data';
      } else {
        _state = RestoState.HasData;
        notifyListeners();
        return _restoResult = restaurant;
      }
    } catch (e) {
      _state = RestoState.Error;
      notifyListeners();
      return _message = 'Error --> $e';
    }
  }
}

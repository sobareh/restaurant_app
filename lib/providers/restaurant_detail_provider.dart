import 'package:flutter/foundation.dart';
import 'package:restaurant_app/models/restaurant_detail_model.dart';
import 'package:restaurant_app/services/restaurant_services.dart';

enum DetailRestoState {Loading, NoData, HasData, Error, BadRequest}

class DetailRestoProvider extends ChangeNotifier {
  final RestaurantService getDetailRestaurant;
  final String id;

  DetailRestoProvider({@required this.getDetailRestaurant, @required this.id}){
    _getDetailRestaurant(id);
  }

  RestaurantDetail _restaurantDetail;
  String _message;
  DetailRestoState _state;

  String get message => _message;

  RestaurantDetail get result => _restaurantDetail;

  DetailRestoState get state => _state;

  Future<dynamic> _getDetailRestaurant(String id) async {
     try {
      _state = DetailRestoState.Loading;
      notifyListeners();

      final RestaurantDetail restaurantItem = await RestaurantService.getDetailRestaurant(id);

      if (restaurantItem.restaurant.id.isEmpty) {
        _state = DetailRestoState.NoData;
        notifyListeners();
        return _message = 'Empty Data';
      } else if(restaurantItem.error == true && restaurantItem.restaurant == null) {
        _state = DetailRestoState.BadRequest;
        notifyListeners();
        return _message = 'something went wrong went you call the server';
      } else {
        _state = DetailRestoState.HasData;
        notifyListeners();
        return _restaurantDetail = restaurantItem;
      }
    } catch (e) {
      _state = DetailRestoState.Error;
      notifyListeners();
      return _message = 'Error --> $e';
    }
  }
}

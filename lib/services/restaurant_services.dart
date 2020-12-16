import 'package:http/http.dart' as http;
import 'package:restaurant_app/models/restaurant_model.dart';
import 'package:restaurant_app/models/restaurant_detail_model.dart';
import 'package:restaurant_app/models/restaurant_search_model.dart';

class RestaurantService {
  static String url = 'https://restaurant-api.dicoding.dev/';

  static Future loadRestaurants() async {
    try {
      var response = await http.get('${url}list');

      if (response.statusCode == 200) {
        return restaurantFromJson(response.body);
      } else {
        throw Exception('Failed to load list restaurants.');
      }
    } catch (e) {
      throw Exception(
          'cannot get data from internet. connection refused or error.');
    }
  }

  static Future getDetailRestaurant(String id) async {
    try {
      var response = await http.get('${url}detail/' + id);

      if (response.statusCode == 200) {
        return restaurantDetailFromJson(response.body);
      } else {
        throw Exception('Failed to load detail restaurant.');
      }
    } catch (e) {
      throw Exception(
          'cannot get data from internet. connection refused or error.');
    }
  }

  static Future searchRestaurant(String keyword) async {
     try {
      var response = await http.get('https://restaurant-api.dicoding.dev/search?q=' + keyword);

      if (response.statusCode == 200) {
        return searchRestaurantFromJson(response.body);
      } else {
        throw Exception('Failed to load restaurant..');
      }
    } catch (e) {
      throw Exception(
          'cannot get data from internet. connection refused or error.');
    }
  }
}

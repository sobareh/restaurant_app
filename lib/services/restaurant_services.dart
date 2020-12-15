import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:restaurant_app/models/restaurant_model.dart';
import 'package:restaurant_app/models/restaurant_detail_model.dart';

class RestaurantService {
  static Future loadRestaurants() async {
    try {
      var response = await http.get('https://restaurant-api.dicoding.dev/list');
      var jsonObject = json.decode(response.body);

      if (response.statusCode == 200) {
        return Restaurant.fromJson(jsonObject);
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
      var response = await http.get('https://restaurant-api.dicoding.dev/detail/' + id);

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
}

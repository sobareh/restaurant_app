import 'dart:convert';

import '../models/restaurant_model.dart';
import 'package:flutter/services.dart' show rootBundle;

class RestaurantService {
  static Future<String> _loadRestaurantAsset() async {
    return await rootBundle.loadString('assets/local_restaurant.json');
  }

  static Future<List<RestaurantElement>> loadRestaurants() async {
    try {
      String jsonRestaurants = await _loadRestaurantAsset();

      var jsonObject = json.decode(jsonRestaurants);

      List<dynamic> listResto =
          (jsonObject as Map<String, dynamic>)['restaurants'];

      List<RestaurantElement> restos = [];
      for (int i = 0; i < listResto.length; i++) {
        restos.add(RestaurantElement.fromJson(listResto[i]));
      }

      return restos;
    } catch (e) {
      return null;
    }
  }
}

import 'package:meta/meta.dart';
import 'dart:convert';

SearchRestaurant searchRestaurantFromJson(String str) => SearchRestaurant.fromJson(json.decode(str));

class SearchRestaurant {
    SearchRestaurant({
        @required this.error,
        @required this.founded,
        @required this.restaurants,
    });

    bool error;
    int founded;
    List<RestaurantItemSearch> restaurants;

    factory SearchRestaurant.fromJson(Map<String, dynamic> json) => SearchRestaurant(
        error: json["error"],
        founded: json["founded"],
        restaurants: List<RestaurantItemSearch>.from(json["restaurants"].map((x) => RestaurantItemSearch.fromJson(x))),
    );
}

class RestaurantItemSearch {
    RestaurantItemSearch({
        @required this.id,
        @required this.name,
        @required this.description,
        @required this.pictureId,
        @required this.city,
        @required this.rating,
    });

    String id;
    String name;
    String description;
    String pictureId;
    String city;
    double rating;

    factory RestaurantItemSearch.fromJson(Map<String, dynamic> json) => RestaurantItemSearch(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        pictureId: json["pictureId"],
        city: json["city"],
        rating: json["rating"].toDouble(),
    );
}
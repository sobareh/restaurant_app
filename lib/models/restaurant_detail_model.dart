import 'dart:convert';

RestaurantDetail restaurantDetailFromJson(String str) => RestaurantDetail.fromJson(json.decode(str));

class RestaurantDetail {
    RestaurantDetail({
        this.error,
        this.message,
        this.restaurant,
    });

    bool error;
    String message;
    RestaurantItem restaurant;

    factory RestaurantDetail.fromJson(Map<String, dynamic> json) => RestaurantDetail(
        error: json["error"],
        message: json["message"],
        restaurant: RestaurantItem.fromJson(json["restaurant"]),
    );
}

class RestaurantItem {
    RestaurantItem({
        this.id,
        this.name,
        this.description,
        this.city,
        this.address,
        this.pictureId,
        this.categories,
        this.menus,
        this.rating,
        this.customerReviews,
    });

    String id;
    String name;
    String description;
    String city;
    String address;
    String pictureId;
    List<Category> categories;
    Menus menus;
    double rating;
    List<CustomerReview> customerReviews;

    factory RestaurantItem.fromJson(Map<String, dynamic> json) => RestaurantItem(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        city: json["city"],
        address: json["address"],
        pictureId: json["pictureId"],
        categories: List<Category>.from(json["categories"].map((x) => Category.fromJson(x))),
        menus: Menus.fromJson(json["menus"]),
        rating: json["rating"].toDouble(),
        customerReviews: List<CustomerReview>.from(json["customerReviews"].map((x) => CustomerReview.fromJson(x))),
    );
}

class Category {
    Category({
        this.name,
    });

    String name;

    factory Category.fromJson(Map<String, dynamic> json) => Category(
        name: json["name"],
    );
}

class CustomerReview {
    CustomerReview({
        this.name,
        this.review,
        this.date,
    });

    String name;
    String review;
    String date;

    factory CustomerReview.fromJson(Map<String, dynamic> json) => CustomerReview(
        name: json["name"],
        review: json["review"],
        date: json["date"],
    );
}

class Menus {
    Menus({
        this.foods,
        this.drinks,
    });

    List<Category> foods;
    List<Category> drinks;

    factory Menus.fromJson(Map<String, dynamic> json) => Menus(
        foods: List<Category>.from(json["foods"].map((x) => Category.fromJson(x))),
        drinks: List<Category>.from(json["drinks"].map((x) => Category.fromJson(x))),
    );
}
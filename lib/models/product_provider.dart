import 'package:flutter/foundation.dart';

class Product with ChangeNotifier {
  Product(
      {@required this.id,
      @required this.description,
      @required this.imageUrl,
      @required this.price,
      @required this.title,
      this.isFavorite = false});

  final String id;
  final String title;
  final String description;
  final double price;
  final String imageUrl;
  bool isFavorite = false;

  void toggleFavoriteStatus() {
    isFavorite = !isFavorite;
    notifyListeners();
  }
}

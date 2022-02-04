import 'package:get/get.dart';

class Product {
  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.shelfLife,
    required this.composition,
    required this.price,
    required this.weight,
    required this.imagePath
  });

  final String id;
  final String name;
  final String description;
  final String shelfLife;
  final String composition;
  final String weight;
  final double price;
  final String imagePath;

  String get priceToString {
    return price.toStringAsFixed(0) + ' ' + 'rub'.tr;
  }
}
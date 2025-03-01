import 'package:hive/hive.dart';

part 'cart_hive.g.dart';

@HiveType(typeId: 0)
class Product extends HiveObject {
  @HiveField(0)
  final String image;

  @HiveField(1)
  final double price;

  @HiveField(2)
  final String title;

  @HiveField(3)
  final String description;

  Product({
    required this.image,
    required this.price,
    required this.title,
    required this.description,
  });
}

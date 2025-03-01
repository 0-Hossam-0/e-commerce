class Categories {
  final String title;
  final double price;
  final String image;
  final int count;
  Categories({required this.title, required this.price, required this.image, required this.count});
  factory Categories.fromJson(Map<String, dynamic> json) {
    return Categories(
      title: json['title'] as String,
      price: (json['price'] as num).toDouble(),
      image: json['image'] as String,
      count: json['rating'] != null ? (json['rating']['count'] as num).toInt() : 0,
    );
  }
}
class Search {
  final String title;
  final double price;
  final String image;
  final int count;
  final double rate;
  Search({required this.title, required this.price, required this.image, required this.count, required this.rate});
  factory Search.fromJson(Map<String, dynamic> json) {
    return Search(
      title: json['title'] as String,
      price: (json['price'] as num).toDouble(),
      image: json['image'] as String,
      count: json['rating'] != null ? (json['rating']['count'] as num).toInt() : 0,
      rate: json['rating'] != null ? (json['rating']['rate'] as num).toDouble() : 0,
    );
  }
}
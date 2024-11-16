class Course {
  final String title;
  final String description;
  final String imageUrl;
  final double price;
  final String creatorName;

  Course({
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.price,
    required this.creatorName,
  });

  // Factory method to create a Course from a JSON response
  factory Course.fromJson(Map<String, dynamic> json) {
    return Course(
      title: json['title'],
      description: json['description'],
      imageUrl: json['imageUrl'],
      price: json['price'].toDouble(),
      creatorName: json['creatorName'],
    );
  }
}

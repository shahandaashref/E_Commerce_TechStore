

class ProductData {
  int id;
  String title;
  double price;
  String description;
  String category;
  String image;
  Rating rating;
  
  ProductData({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.rating,
  });
  
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'price': price,
      'description': description,
      'category': category,
      'image': image,
      'rating': {
        'rate': rating.rate,
        'count': rating.count,
      },
    };
  }
  
  ProductData.fromMap(Map<String, dynamic> map)
      : id = map['id'] as int,
        title = map['title'] as String,
        price = (map['price'] is int) 
            ? (map['price'] as int).toDouble() 
            : map['price'] as double,
        description = map['description'] as String,
        category = map['category'] as String,
        image = map['image'] as String,
        rating = Rating(
          rate: (map['rating']['rate'] is int)
              ? (map['rating']['rate'] as int).toDouble()
              : map['rating']['rate'] as double,
          count: map['rating']['count'] as int,
        );
}

class Rating {
  double rate;
  int count;
  
  Rating({
    required this.rate,
    required this.count,
  });

  Map<String, dynamic> toJson() {
    return {
      'rate': rate,
      'count': count,
    };
  }
}
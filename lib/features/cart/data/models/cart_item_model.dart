import 'package:e_commerce/features/home/data/datasources/home_remote_datasource.dart';

class CartItem {
  final String id;
  final int productId;
  final String title;
  final String image;
  final double price;
  int quantity;
  final String category;
  final String description;
  final Rating rating;

  CartItem({
    required this.id,
    required this.productId,
    required this.title,
    required this.image,
    required this.price,
    this.quantity = 1,
    required this.category,
    required this.description,
    required this.rating,
  });

  // Create CartItem from ProductData
  factory CartItem.fromProductData(ProductData product, {int quantity = 1}) {
    return CartItem(
      id: 'cart_${product.id}_${DateTime.now().millisecondsSinceEpoch}',
      productId: product.id,
      title: product.title,
      image: product.image,
      price: product.price,
      quantity: quantity,
      category: product.category,
      description: product.description,
      rating: product.rating,
    );
  }

  factory CartItem.fromJson(Map<String, dynamic> json) {
    return CartItem(
      id: json['id'] ?? '',
      productId: json['product_id'] ?? 0,
      title: json['title'] ?? '',
      image: json['image'] ?? '',
      price: (json['price'] ?? 0).toDouble(),
      quantity: json['quantity'] ?? 1,
      category: json['category'] ?? '',
      description: json['description'] ?? '',
      rating: Rating(
        rate: (json['rating']?['rate'] ?? 0).toDouble(),
        count: json['rating']?['count'] ?? 0,
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'product_id': productId,
      'title': title,
      'image': image,
      'price': price,
      'quantity': quantity,
      'category': category,
      'description': description,
      'rating': {
        'rate': rating.rate,
        'count': rating.count,
      },
    };
  }

  double get totalPrice => price * quantity;

  CartItem copyWith({
    String? id,
    int? productId,
    String? title,
    String? image,
    double? price,
    int? quantity,
    String? category,
    String? description,
    Rating? rating,
  }) {
    return CartItem(
      id: id ?? this.id,
      productId: productId ?? this.productId,
      title: title ?? this.title,
      image: image ?? this.image,
      price: price ?? this.price,
      quantity: quantity ?? this.quantity,
      category: category ?? this.category,
      description: description ?? this.description,
      rating: rating ?? this.rating,
    );
  }
}


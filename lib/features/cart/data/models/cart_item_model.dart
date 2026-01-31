import 'package:e_commerce/core/api/app_model.dart';

class CartItem {
  final String id;
  final String title;
  final String image;
  final double price;
  int quantity;


  CartItem({
    required this.id,
    required this.title,
    required this.image,
    required this.price,
    this.quantity = 1,
  });

  // Create CartItem from ProductData
  factory CartItem.fromProductData(ProductData product, {int quantity = 1}) {
    return CartItem(
      id: 'cart_${product.id}_${DateTime.now().millisecondsSinceEpoch}',
      title: product.title,
      image: product.image,
      price: product.price,
      quantity: quantity,
    );
  }

  factory CartItem.fromJson(Map<String, dynamic> json) {
    return CartItem(
      id: json['id'] ?? '',
      title: json['title'] ?? '',
      image: json['image'] ?? '',
      price: (json['price'] ?? 0).toDouble(),
      quantity: json['quantity'] ?? 1,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'image': image,
      'price': price,
      'quantity': quantity,
    };
  }

  double get totalPrice => price * quantity;

  CartItem copyWith({
    String? id,
    String? title,
    String? image,
    double? price,
    int? quantity,
  }) {
    return CartItem(
      id: id ?? this.id,
      title: title ?? this.title,
      image: image ?? this.image,
      price: price ?? this.price,
      quantity: quantity ?? this.quantity,
    );
  }
}


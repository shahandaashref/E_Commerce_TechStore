import 'package:e_commerce/features/cart/data/models/cart_item_model.dart';
import 'package:flutter/material.dart';


class CartProvider extends ChangeNotifier {

  final Map<String, CartItem> _items = {};


  Map<String, CartItem> get items => _items;


  int get itemCount => _items.length;


  double get totalAmount {
    var total = 0.0;
    _items.forEach((key, cartItem) {
      total += cartItem.price * cartItem.quantity;
    });
    return total;
  }

  void addToCart(String productId, double price, String title, String imageUrl) {
    if (_items.containsKey(productId)) {
      _items.update(
        productId,
        (existingItem) => CartItem(
          id: existingItem.id,
          title: existingItem.title,
          price: existingItem.price,
          image: existingItem.image,
          quantity: existingItem.quantity + 1, 
        ),
      );
    } else {
      _items.putIfAbsent(
        productId,
        () => CartItem(
          id: DateTime.now().toString(),
          title: title,
          price: price,
          image: imageUrl,
          quantity: 1,
        ),
      );
    }
    notifyListeners();
  }


  void incrementQuantity(String productId) {
    if (_items.containsKey(productId)) {
      _items.update(
        productId,
        (existingItem) => CartItem(
          id: existingItem.id,
          title: existingItem.title,
          price: existingItem.price,
          image: existingItem.image,
          quantity: existingItem.quantity + 1,
        ),
      );
      notifyListeners();
    }
  }

  // --- دالة تنقيص الكمية ---
  void decrementQuantity(String productId) {
    if (!_items.containsKey(productId)) return;

    if (_items[productId]!.quantity > 1) {
      _items.update(
        productId,
        (existingItem) => CartItem(
          id: existingItem.id,
          title: existingItem.title,
          price: existingItem.price,
          image: existingItem.image,
          quantity: existingItem.quantity - 1,
        ),
      );
    } else {

      _items.remove(productId);
    }
    notifyListeners();
  }


  void removeFromCart(String productId) {
    _items.remove(productId);
    notifyListeners();
  }


  void clearCart() {
    _items.clear();
    notifyListeners();
  }
}
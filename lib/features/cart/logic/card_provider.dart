import 'package:e_commerce/features/cart/data/models/cart_item_model.dart';
import 'package:e_commerce/features/cart/data/repositories/cart_repository_impl.dart';
import 'package:e_commerce/features/home/data/datasources/home_remote_datasource.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class CartProvider with ChangeNotifier {
  final CartApiService _apiService = CartApiService();
  final int userId;

  List<CartItem> _items = [];
  bool _isLoading = false;
  String? _error;
  int? _cartId;

  CartProvider({required this.userId}) {
    _loadCartFromLocal();
  }

  // Getters
  List<CartItem> get items => [..._items];
  bool get isLoading => _isLoading;
  String? get error => _error;

  int get itemCount => _items.fold(0, (sum, item) => sum + item.quantity);

  double get subtotal => _items.fold(
        0.0,
        (sum, item) => sum + item.totalPrice,
      );

  double get shippingCost => subtotal > 500 ? 0.0 : 15.0;

  double get tax => subtotal * 0.08;

  double get total => subtotal + shippingCost + tax;

  double get amountForFreeShipping {
    final remaining = 500 - subtotal;
    return remaining > 0 ? remaining : 0.0;
  }

  bool get hasFreeShipping => subtotal >= 500;

  // Load cart from SharedPreferences (local storage)
  Future<void> _loadCartFromLocal() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final cartData = prefs.getString('cart_$userId');
      
      if (cartData != null) {
        final List<dynamic> decoded = json.decode(cartData);
        _items = decoded.map((item) => CartItem.fromJson(item)).toList();
        notifyListeners();
      }
    } catch (e) {
      print('Error loading cart from local: $e');
    }
  }

  // Save cart to SharedPreferences
  Future<void> _saveCartToLocal() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final cartData = json.encode(_items.map((item) => item.toJson()).toList());
      await prefs.setString('cart_$userId', cartData);
    } catch (e) {
      print('Error saving cart to local: $e');
    }
  }

  // Load cart from API
  Future<void> loadCartFromApi() async {
    _setLoading(true);
    _setError(null);

    try {
      _items = await _apiService.getCartItems(userId);
      await _saveCartToLocal();
      notifyListeners();
    } catch (e) {
      _setError(e.toString());
      // If API fails, keep local data
      await _loadCartFromLocal();
    } finally {
      _setLoading(false);
    }
  }

  // Sync cart to API
  Future<void> _syncToApi() async {
    try {
      final products = _items.map((item) => {
        'productId': item.productId,
        'quantity': item.quantity,
      }).toList();

      final result = await _apiService.updateCart(
        userId: userId,
        products: products,
        cartId: _cartId,
      );

      _cartId = result['id'];
    } catch (e) {
      print('Error syncing to API: $e');
      // Don't throw error, just log it
    }
  }

  // Add item to cart
  Future<void> addItem(ProductData product, {int quantity = 1}) async {
    try {
      // Check if item already exists
      final existingIndex = _items.indexWhere(
        (item) => item.productId == product.id,
      );

      if (existingIndex >= 0) {
        // Update quantity
        _items[existingIndex].quantity += quantity;
      } else {
        // Add new item
        final cartItem = CartItem.fromProductData(product, quantity: quantity);
        _items.add(cartItem);
      }

      await _saveCartToLocal();
      await _syncToApi();
      notifyListeners();
    } catch (e) {
      _setError(e.toString());
      rethrow;
    }
  }

  // Update item quantity
  Future<void> updateQuantity(String itemId, int quantity) async {
    if (quantity < 1) return;

    final index = _items.indexWhere((item) => item.id == itemId);
    if (index == -1) return;

    // Optimistic update
    final oldQuantity = _items[index].quantity;
    _items[index].quantity = quantity;
    notifyListeners();

    try {
      await _saveCartToLocal();
      await _syncToApi();
    } catch (e) {
      // Revert on error
      _items[index].quantity = oldQuantity;
      notifyListeners();
      _setError(e.toString());
      rethrow;
    }
  }

  // Increment quantity
  Future<void> incrementQuantity(String itemId) async {
    final item = _items.firstWhere((item) => item.id == itemId);
    await updateQuantity(itemId, item.quantity + 1);
  }

  // Decrement quantity
  Future<void> decrementQuantity(String itemId) async {
    final item = _items.firstWhere((item) => item.id == itemId);
    if (item.quantity > 1) {
      await updateQuantity(itemId, item.quantity - 1);
    }
  }

  // Remove item from cart
  Future<void> removeItem(String itemId) async {
    final index = _items.indexWhere((item) => item.id == itemId);
    if (index == -1) return;

    // Optimistic delete
    final removedItem = _items.removeAt(index);
    notifyListeners();

    try {
      await _saveCartToLocal();
      await _syncToApi();
    } catch (e) {
      // Revert on error
      _items.insert(index, removedItem);
      notifyListeners();
      _setError(e.toString());
      rethrow;
    }
  }

  // Clear cart
  Future<void> clearCart() async {
    // Optimistic clear
    final oldItems = [..._items];
    _items.clear();
    notifyListeners();

    try {
      await _saveCartToLocal();
      
      if (_cartId != null) {
        await _apiService.deleteCart(_cartId!);
        _cartId = null;
      }
    } catch (e) {
      // Revert on error
      _items = oldItems;
      notifyListeners();
      _setError(e.toString());
      rethrow;
    }
  }

  // Check if product is in cart
  bool isInCart(int productId) {
    return _items.any((item) => item.productId == productId);
  }

  // Get cart item by product ID
  CartItem? getCartItemByProductId(int productId) {
    try {
      return _items.firstWhere((item) => item.productId == productId);
    } catch (e) {
      return null;
    }
  }

  // Get quantity of specific product
  int getProductQuantity(int productId) {
    final item = getCartItemByProductId(productId);
    return item?.quantity ?? 0;
  }

  // Helper methods
  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  void _setError(String? value) {
    _error = value;
    if (value != null) {
      notifyListeners();
    }
  }

  void clearError() {
    _error = null;
    notifyListeners();
  }
}
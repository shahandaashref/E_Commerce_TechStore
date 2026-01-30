import 'package:dio/dio.dart';
import 'package:e_commerce/features/cart/data/models/cart_item_model.dart';
import 'package:e_commerce/features/home/data/datasources/home_remote_datasource.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class CartApiService {
  static const String baseUrl = 'https://fakestoreapi.com/';
  final Dio dio = Dio();

  CartApiService() {
    dio.options = BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: const Duration(milliseconds: 5000),
      receiveTimeout: const Duration(milliseconds: 5000),
      sendTimeout: const Duration(milliseconds: 5000),
      headers: {'Content-Type': 'application/json'},
    );
    
    dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90,
      ),
    );
  }

  // Get user's cart
  // Endpoint: GET /carts/user/{userId}
  Future<List<CartItem>> getCartItems(int userId) async {
    try {
      final response = await dio.get('carts/user/$userId');
      
      if (response.statusCode == 200) {
        final List<dynamic> carts = response.data;
        
        if (carts.isEmpty) {
          return [];
        }

        // Get the first (most recent) cart
        final cartData = carts.first;
        final List<dynamic> products = cartData['products'] ?? [];

        // Fetch full product details for each item in cart
        List<CartItem> cartItems = [];
        for (var item in products) {
          final productId = item['productId'];
          final quantity = item['quantity'];
          
          try {
            final productResponse = await dio.get('products/$productId');
            if (productResponse.statusCode == 200) {
              final productData = ProductData.fromMap(productResponse.data);
              final cartItem = CartItem.fromProductData(
                productData,
                quantity: quantity,
              );
              cartItems.add(cartItem);
            }
          } catch (e) {
            print('Error fetching product $productId: $e');
          }
        }
        
        return cartItems;
      } else {
        throw Exception('Failed to load cart');
      }
    } catch (e) {
      throw Exception('Error fetching cart: $e');
    }
  }

  // Add/Update cart for user
  // Endpoint: POST /carts or PUT /carts/{cartId}
  Future<Map<String, dynamic>> updateCart({
    required int userId,
    required List<Map<String, dynamic>> products,
    int? cartId,
  }) async {
    try {
      final endpoint = cartId != null ? 'carts/$cartId' : 'carts';
      final method = cartId != null ? 'put' : 'post';
      
      final data = {
        'userId': userId,
        'date': DateTime.now().toIso8601String(),
        'products': products,
      };

      final response = method == 'post'
          ? await dio.post(endpoint, data: data)
          : await dio.put(endpoint, data: data);

      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.data;
      } else {
        throw Exception('Failed to update cart');
      }
    } catch (e) {
      throw Exception('Error updating cart: $e');
    }
  }

  // Delete cart
  // Endpoint: DELETE /carts/{cartId}
  Future<void> deleteCart(int cartId) async {
    try {
      final response = await dio.delete('carts/$cartId');
      
      if (response.statusCode != 200 && response.statusCode != 204) {
        throw Exception('Failed to delete cart');
      }
    } catch (e) {
      throw Exception('Error deleting cart: $e');
    }
  }

  // Get single product (helper method)
  Future<ProductData> getProduct(int productId) async {
    try {
      final response = await dio.get('products/$productId');
      
      if (response.statusCode == 200) {
        return ProductData.fromMap(response.data);
      } else {
        throw Exception('Failed to load product');
      }
    } catch (e) {
      throw Exception('Error fetching product: $e');
    }
  }

  // Get all products (for browsing)
  Future<List<ProductData>> getAllProducts() async {
    try {
      final response = await dio.get('products');
      
      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;
        return data.map((item) => ProductData.fromMap(item)).toList();
      } else {
        throw Exception('Failed to load products');
      }
    } catch (e) {
      throw Exception('Error fetching products: $e');
    }
  }

  // Get products by category
  Future<List<ProductData>> getProductsByCategory(String category) async {
    try {
      final response = await dio.get('products/category/$category');
      
      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;
        return data.map((item) => ProductData.fromMap(item)).toList();
      } else {
        throw Exception('Failed to load products');
      }
    } catch (e) {
      throw Exception('Error fetching products: $e');
    }
  }

  // Get all categories
  Future<List<String>> getCategories() async {
    try {
      final response = await dio.get('products/categories');
      
      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;
        return data.map((item) => item.toString()).toList();
      } else {
        throw Exception('Failed to load categories');
      }
    } catch (e) {
      throw Exception('Error fetching categories: $e');
    }
  }
}
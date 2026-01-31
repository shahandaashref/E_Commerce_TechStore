import 'package:e_commerce/core/api/app_api_general.dart';
import 'package:e_commerce/core/api/app_model.dart';
import 'package:flutter/material.dart';

class ProductProvider extends ChangeNotifier{
  final ProductDataApi _productDataApi = ProductDataApi();
  List<dynamic> _products = [];
  bool _isLoading = false;
  String _errorMessage = '';
  List<dynamic> get products => _products;
  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;


  // Fetch products from API
  Future<void> fetchProducts() async {
    _isLoading = true;
    _errorMessage = '';
    notifyListeners();
    try {
      _products = await _productDataApi.fetchProducts();
      notifyListeners();
    } catch (e) {
      _errorMessage = e.toString();
      notifyListeners();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // Add a new product
  Future<void> addProduct(ProductData product) async {
    try {
      final newProduct = await _productDataApi.addProduct(product);
      _products.add(newProduct);
      notifyListeners();
    } catch (e) {
      rethrow;
    }
  }
  // Delete a product
  Future<void> deleteProduct(int id) async {
    try {
      await _productDataApi.deleteProduct(id);
      _products.removeWhere((product) => product.id == id);
      notifyListeners();
    } catch (e) {
      rethrow;
    }
  }
}
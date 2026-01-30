import 'package:e_commerce/features/home/data/repositories/home_repository_impl.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/features/home/data/datasources/home_remote_datasource.dart'; 

class ProductsProvider extends ChangeNotifier {
  final ProductDataApi api = ProductDataApi();
  
  List<ProductData> _products = [];
  bool _isLoading = false;
  String _errorMessage = '';


  List<ProductData> get products => _products;
  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;


  Future<void> getAllProducts() async {
    _isLoading = true;
    _errorMessage = '';
    notifyListeners(); 

    try {
      _products = await api.fetchProducts();
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }


  Future<void> addNewProduct(ProductData product) async {

    try {
      final newProduct = await api.addProduct(product);
      

      _products.add(newProduct); 
      
      notifyListeners();
    } catch (e) {

      rethrow; 
    }
  }
}
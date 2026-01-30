import 'package:dio/dio.dart';
import 'package:e_commerce/features/home/data/datasources/home_remote_datasource.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class ProductDataApi {
  //TODO: Implement API calls

  static const String baseUrl = 'https://fakestoreapi.com/';
  final Dio dio =Dio(); 
  ProductDataApi() {
    dio.options = BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: Duration(milliseconds: 3000),
      receiveTimeout: Duration(milliseconds: 3000),
      sendTimeout: Duration(milliseconds: 3000),
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
  Future<List<ProductData>> fetchProducts() async {
    try {
      final response = await dio.get('products');
      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;
        final products = data.map((item) => ProductData.fromMap(item)).toList();
        return products;
      }
    } catch (e) {
      throw Exception('Failed to load products: $e');
    }
    return <ProductData>[];
  }

  //add products, update products, delete products methods here
  Future<ProductData> addProduct(ProductData product) async {
    try {
      final response = await dio.post('products', data: product.toMap());
      if (response.statusCode == 200) {
        return ProductData.fromMap(response.data);
      } else {
        throw Exception('Failed to add product');
      }
    } catch (e) {
      throw Exception('Failed to add product: $e');
    }
  }
}

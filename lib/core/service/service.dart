import 'dart:io';

import 'package:dio/dio.dart';

import '../../features/home/model/categories/category_model.dart';
import '../../features/home/model/product/product_model.dart';

part 'service_endpoint.dart';

class ProductService {
  ProductService._();
  static final ProductService _instance = ProductService._();
  static ProductService get instance => _instance;
  final Dio _dio = Dio();

  Future<Categories> fetchAllCategories() async {
    final response = await _dio.get(_ServiceEndPoints.CATEGORIES.rawValue);
    List<String> categories = [];
    if (response.statusCode == HttpStatus.ok) {
      final data = response.data;
      if (data is List) {
        for (var item in data) {
          categories.add(item);
        }
        return Categories(categories);
      }
    }
    return Categories(categories);
  }

  Future<List<Product>> fetchAllProduct() async {
    try {
      final response = await _dio.get(_ServiceEndPoints.PRODUCTS.rawValue);
      if (response.statusCode == HttpStatus.ok) {
        final data = response.data;
        if (data is List) {
          return data.map((e) => Product.fromJson(e)).toList();
        }
      }
    } catch (e) {
      print(e);
    }
    return [];
  }

  Future<List<Product>> fetchAllProductByCategory(String category) async {
    try {
      final response =
          await _dio.get(_ServiceEndPoints.GETINCATEGORY.rawValue + category);
      if (response.statusCode == HttpStatus.ok) {
        final data = response.data;
        if (data is List) {
          return data.map((e) => Product.fromJson(e)).toList();
        }
      }
    } catch (e) {
      print(e);
    }
    return [];
  }
}

part of 'service.dart';

enum _ServiceEndPoints { PRODUCTS, CATEGORIES, GETINCATEGORY }

extension ServiceEndPintsExtension on _ServiceEndPoints {
  String get rawValue {
    switch (this) {
      case _ServiceEndPoints.PRODUCTS:
        return 'https://fakestoreapi.com/products';
      case _ServiceEndPoints.CATEGORIES:
        return 'https://fakestoreapi.com/products/categories';
      case _ServiceEndPoints.GETINCATEGORY:
        return 'https://fakestoreapi.com/products/category/';
    }
  }
}

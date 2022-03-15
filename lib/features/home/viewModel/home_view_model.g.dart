// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeViewModel on _HomeViewModelBase, Store {
  final _$categoryIndexAtom = Atom(name: '_HomeViewModelBase.categoryIndex');

  @override
  int get categoryIndex {
    _$categoryIndexAtom.reportRead();
    return super.categoryIndex;
  }

  @override
  set categoryIndex(int value) {
    _$categoryIndexAtom.reportWrite(value, super.categoryIndex, () {
      super.categoryIndex = value;
    });
  }

  final _$categoriesAtom = Atom(name: '_HomeViewModelBase.categories');

  @override
  Categories get categories {
    _$categoriesAtom.reportRead();
    return super.categories;
  }

  @override
  set categories(Categories value) {
    _$categoriesAtom.reportWrite(value, super.categories, () {
      super.categories = value;
    });
  }

  final _$productItemsAtom = Atom(name: '_HomeViewModelBase.productItems');

  @override
  List<Product> get productItems {
    _$productItemsAtom.reportRead();
    return super.productItems;
  }

  @override
  set productItems(List<Product> value) {
    _$productItemsAtom.reportWrite(value, super.productItems, () {
      super.productItems = value;
    });
  }

  final _$fetchCategoriesAsyncAction =
      AsyncAction('_HomeViewModelBase.fetchCategories');

  @override
  Future<void> fetchCategories() {
    return _$fetchCategoriesAsyncAction.run(() => super.fetchCategories());
  }

  final _$fetchProductsAsyncAction =
      AsyncAction('_HomeViewModelBase.fetchProducts');

  @override
  Future<void> fetchProducts() {
    return _$fetchProductsAsyncAction.run(() => super.fetchProducts());
  }

  final _$fetchProductsByCategoryAsyncAction =
      AsyncAction('_HomeViewModelBase.fetchProductsByCategory');

  @override
  Future<void> fetchProductsByCategory(String category) {
    return _$fetchProductsByCategoryAsyncAction
        .run(() => super.fetchProductsByCategory(category));
  }

  @override
  String toString() {
    return '''
categoryIndex: ${categoryIndex},
categories: ${categories},
productItems: ${productItems}
    ''';
  }
}

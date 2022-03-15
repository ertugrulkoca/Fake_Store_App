import 'package:fake_shopping_app/features/home/model/categories/category_model.dart';
import 'package:fake_shopping_app/features/home/model/product/product_model.dart';
import 'package:flutter/material.dart';
import '../../../core/service/service.dart';
import 'package:mobx/mobx.dart';
part 'home_view_model.g.dart';

class HomeViewModel = _HomeViewModelBase with _$HomeViewModel;

abstract class _HomeViewModelBase with Store {
  @observable
  int categoryIndex = -1;

  BuildContext? context;
  void setContext(BuildContext? context) {
    this.context = context;
    fetchCategories();
    fetchProducts();
  }

  @observable
  Categories categories = Categories([]);
  @action
  Future<void> fetchCategories() async {
    print("fetchCategories");
    categories = await ProductService.instance.fetchAllCategories();
  }

  @observable
  List<Product> productItems = [];

  @action
  Future<void> fetchProducts() async {
    print("fetchProducts");
    productItems = await ProductService.instance.fetchAllProduct();
  }

  @action
  Future<void> fetchProductsByCategory(String category) async {
    print("fetchProductsByCategory");
    productItems =
        await ProductService.instance.fetchAllProductByCategory(category);
  }
}

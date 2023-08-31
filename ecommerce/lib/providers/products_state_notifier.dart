import 'package:ecommerce/services/product_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/product.dart';
import '../services/dio_helper.dart';

final productsStateNotifierProvider =
    StateNotifierProvider<ProductsNotifier, List<Product>>((ref) {
  return ProductsNotifier();
});

class ProductsNotifier extends StateNotifier<List<Product>> {
  ProductsNotifier() : super([]) {
    getData();
  }

  Future<void> getData() async {
    List<Product> products = [];
    List productsList = await DioHelper().getProducts(
      path: "https://dummyjson.com/products",
    );

    products = Product.convertToProducts(productsList);
    state = products;
  }

  void addToFavourite(Product selectedProduct) {
    state = [
      for (final product in state)
        if (product.id == selectedProduct.id)
          selectedProduct.copyWith(isFav: true)
        else
          product
    ];
  }

  void removeToFavourite(Product selectedProduct) {
    state = [
      for (final product in state)
        if (product.id == selectedProduct.id)
          selectedProduct.copyWith(isFav: false)
        else
          product
    ];
  }

  void addToCart(Product selectedProduct) {
    state = [
      for (final product in state)
        if (product.id == selectedProduct.id)
          selectedProduct.copyWith(inCart: true)
        else
          product
    ];
  }

  void removeToCart(Product selectedProduct) {
    state = [
      for (final product in state)
        if (product.id == selectedProduct.id)
          selectedProduct.copyWith(inCart: false)
        else
          product
    ];
  }
}

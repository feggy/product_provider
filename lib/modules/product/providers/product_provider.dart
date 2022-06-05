import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:product_provider/data/models/res_product/res_product.dart';
import 'package:product_provider/data/services/product_service.dart';

class ProductProvider extends ChangeNotifier {
  final List<Product> _products = []; // initial data list product
  var _isLoading = true; // initial loading
  var limit = 20; // initial limit untuk request ke api nanti
  var totalData = 0; // initial untuk mendapatkan total data dari response

  // untuk mendapatkan nilai _product biar bisa di tampilkan di halaman Widget nanti
  List<Product> get products => _products;
  // fungsi ini nanti di panggil untuk set nilai dari _products
  set setProducts(List<Product> products) {
    // ini logika untuk memperbarui nilai _products yang akan di tampilkan saat manggil products
    _products.clear();
    _products.addAll(products);
    notifyListeners(); // setelah algoritma selesai nanti datanya berubah
  }

  bool get isLoading => _isLoading;
  set setLoading(bool status) {
    _isLoading = status;
    notifyListeners();
  }

  // ini nanti di panggil di initstate sebagai initial data
  void init() {
    Future.microtask(() =>
        // Future microtask ini, untuk menjalankan fungsi Future pada getProducts
        getProducts());
  }

  // fungsi ini menghubungkan dengan service getproducts
  Future getProducts() async {
    try {
      setLoading = true;
      final data = await ProductService().getProducts(limit);
      totalData = data.total;
      setProducts = data.products;
      setLoading = false;
    } catch (e) {
      log(e.toString());
    }
  }

  // ini gunanya nanti untuk infinite loading, yang dibawah nya itu ada loading, nanti dia me load data lebih banyak
  Future loadMoreProducts() async {
    // limitnya di tambah 20
    limit += 20;

    // jadi nanti pas hit ke api limitnya bertambah
    final data = await ProductService().getProducts(limit);

    // setelah itu kita set kembali nilai products nya
    setProducts = data.products;
  }
}

import 'dart:convert';

import 'package:product_provider/data/models/res_product/res_product.dart';
import 'package:http/http.dart' as http;

class ProductService {
  final String baseUrl = 'https://dummyjson.com/';

  Future<ResProduct> getProducts(int limit) async {
    var url = Uri.parse('${baseUrl}products?limit=$limit');
    var response = await http.get(url);

    var result = ResProduct.fromJson(jsonDecode(response.body));

    return result;
  }
}

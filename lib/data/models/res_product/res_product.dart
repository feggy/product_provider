import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'res_product.freezed.dart';
part 'res_product.g.dart';

ResProduct resProductFromJson(String str) =>
    ResProduct.fromJson(json.decode(str));

String resProductToJson(ResProduct data) => json.encode(data.toJson());

@freezed
abstract class ResProduct with _$ResProduct {
  const factory ResProduct({
    required List<Product> products,
    required int total,
    required int skip,
    required int limit,
  }) = _ResProduct;

  factory ResProduct.fromJson(Map<String, dynamic> json) =>
      _$ResProductFromJson(json);
}

@freezed
abstract class Product with _$Product {
  const factory Product({
    required int id,
    required String title,
    required String description,
    required int price,
    required double discountPercentage,
    required double rating,
    required int stock,
    required String brand,
    required String category,
    required String thumbnail,
    required List<String> images,
  }) = _Product;

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);
}

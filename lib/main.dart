import 'package:flutter/material.dart';
import 'package:product_provider/modules/product/pages/product_page.dart';
import 'package:product_provider/modules/product/providers/product_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'Product',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ChangeNotifierProvider(
        create: (context) => ProductProvider(),
        child: const ProductPage(),
      ),
    ),
  );
}

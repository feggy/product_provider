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
      // ChangeNotifierProvider itu sama dengan MultiProvider, Hanya saja ChangeNotifieProvider di gunakan untuk deklarasikan 1 Provider, Kalau MultiProvider itu untuk deklarasikan lebih dari 1 Provider, ChangeNotiferProvider di deklarasikan di ProductPage, artinya ProdutProvider hanya akan dapat digunakan di ProductPage
      home: ChangeNotifierProvider(
        create: (context) => ProductProvider(),
        child: const ProductPage(),
      ),
    ),
  );
}

import 'package:flutter/material.dart';
import 'package:product_provider/modules/product/providers/product_provider.dart';
import 'package:product_provider/modules/product/widgets/item_product_widget.dart';
import 'package:provider/provider.dart';

class ListProductWidget extends StatelessWidget {
  const ListProductWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);
    final products = productProvider.products;

    return GridView.builder(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 15,
      ),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 1.1,
      ),
      // biar kita bisa load more, kita cek dulu dari total data yang di dapat itu panjang data dari products (products.length) itu sama gak sama total data
      itemCount: products.length == productProvider.totalData
          // kalau sama berarti kita gak perlu load more lagi
          ? products.length
          // kalau gak sama kita tambahkan 1 biar nanti ada widget tambahan sebagai loading item di list
          : products.length + 1,
      itemBuilder: (context, index) {
        // kita cek dulu indexnya sekarang ini lebih besar gak dari panjang data products (products.length)?
        if (index >= products.length) {
          // kalau iya berarti kita jalankan perintah load more untuk mendapatkan lebih banyak data
          productProvider
              .loadMoreProducts(); // ini fungsi udah di buat di provider
          return const CircularProgressIndicator
              .adaptive(); // ini yang kita lebihin 1 tadi
        }
        return ItemProductWidget(
            product: products[index]); // ini widget yang ditampilkan
      },
    );
  }
}

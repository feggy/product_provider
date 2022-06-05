import 'package:flutter/material.dart';
import 'package:product_provider/modules/product/providers/product_provider.dart';
import 'package:product_provider/modules/product/widgets/list_product_widget.dart';
import 'package:provider/provider.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({
    Key? key,
  }) : super(key: key);

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  @override
  void initState() {
    super.initState();
    Provider.of<ProductProvider>(context, listen: false).init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Product')),
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: Consumer<ProductProvider>(builder: (context, state, widget) {
          if (state.isLoading) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          }
          return const ListProductWidget();
        }),
      ),
    );
  }
}

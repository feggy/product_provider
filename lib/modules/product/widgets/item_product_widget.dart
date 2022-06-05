import 'package:flutter/material.dart';
import 'package:product_provider/data/models/res_product/res_product.dart';

class ItemProductWidget extends StatelessWidget {
  const ItemProductWidget({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.white,
      ),
      child: Column(
        children: [
          Image.network(
            product.thumbnail,
            width: 150,
            height: 100,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 5),
          Text(
            product.title,
            maxLines: 1,
          ),
          Text('\$${product.price}'),
        ],
      ),
    );
  }
}

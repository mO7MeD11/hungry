import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project/features/home/data/product_model.dart';

class CustomProductItem extends StatelessWidget {
  const CustomProductItem({super.key, required this.product});
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(12),
      child: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Center(
                child: Image.asset(
                  product.image,
                  width: 100,
                  height: 100,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Text(
              product.title,
              maxLines: 1,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Text(product.subTitle, maxLines: 1),
            Row(
              children: [
                Icon(Icons.star, color: Colors.yellow),
                Text(product.rate),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

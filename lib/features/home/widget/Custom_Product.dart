import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project/features/home/data/product_model.dart';
import 'package:project/features/home/views/home_view.dart';
import 'package:project/features/home/widget/Custom_Product_Item.dart';
import 'package:project/features/product/views/product_details.dart';

class CustomProducts extends StatelessWidget {
  CustomProducts({super.key});
  List<ProductModel> products = [
    ProductModel(
      image: 'assets/image1.png',
      title: 'Cheeseburger ',
      rate: '3.4',
      subTitle: 'Wendy\'s Burger',
    ),
    ProductModel(
      image: 'assets/image3.png',
      title: 'Hamburger ',
      rate: '2.4',
      subTitle: 'Veggie Burger',
    ),
    ProductModel(
      image: 'assets/image5.png',
      title: 'Hamburger ',
      rate: '4.4',
      subTitle: 'Chicken Burger',
    ),
    ProductModel(
      image: 'assets/image6.png',
      title: 'Hamburger ',
      rate: '1.4',
      subTitle: 'Fried Chicken Burger ',
    ),
    ProductModel(
      image: 'assets/image6.png',
      title: 'Hamburger ',
      rate: '1.4',
      subTitle: 'Fried Chicken Burger ',
    ),
    ProductModel(
      image: 'assets/image6.png',
      title: 'Hamburger ',
      rate: '1.4',
      subTitle: 'Fried Chicken Burger ',
    ),
    ProductModel(
      image: 'assets/image6.png',
      title: 'Hamburger ',
      rate: '1.4',
      subTitle: 'Fried Chicken Burger ',
    ),
    ProductModel(
      image: 'assets/image6.png',
      title: 'Hamburger ',
      rate: '1.4',
      subTitle: 'Fried Chicken Burger ',
    ),
    ProductModel(
      image: 'assets/image6.png',
      title: 'Hamburger ',
      rate: '1.4',
      subTitle: 'Fried Chicken Burger ',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: products.length,

      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 20,
        crossAxisSpacing: 12,
      ),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return ProductDetails(product: products[index]);
                },
              ),
            );
          },
          child: CustomProductItem(product: products[index]),
        );
      },
    );
  }
}

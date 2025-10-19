import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:project/core/constants/app_colors.dart';
import 'package:project/features/checkout/views/checkout.dart';
import 'package:project/features/product/views/product_details.dart';
import 'package:project/shared/custom_text.dart';

class CartListView extends StatelessWidget {
  const CartListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      scrollDirection: Axis.vertical,
      itemBuilder: (context, index) {
        return CartItem();
      },
    );
  }
}

class CartItem extends StatefulWidget {
  const CartItem({super.key});

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  int number = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Card(
        color: Colors.white,

        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Image.asset('assets/image5.png'),
                  CustomText(
                    text: 'Hamburger \nVeggie Burger',
                    color: Colors.black,
                    size: 16,
                    weight: FontWeight.bold,
                  ),
                ],
              ),
              Column(
                children: [
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: AppColors.kPColor,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: IconButton(
                          icon: Icon(Icons.remove, color: Colors.white),
                          onPressed: () {
                            setState(() {
                              if (number >= 1) number = number - 1;
                            });
                          },
                        ),
                      ),
                      Gap(30),
                      CustomText(
                        text: '$number',
                        color: Colors.black,
                        size: 16,
                        weight: FontWeight.bold,
                      ),
                      Gap(30),
                      Container(
                        decoration: BoxDecoration(
                          color: AppColors.kPColor,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: IconButton(
                          icon: Icon(Icons.add, color: Colors.white),
                          onPressed: () {
                            setState(() {
                              number = number + 1;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                  Gap(20),
                  CustomConfirmButton(
                    height: 50,
                    width: 160,
                    text: 'Add to cart',
                    onPressed: () {},
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

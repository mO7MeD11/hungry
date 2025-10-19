import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:project/features/cart/widgets/custom_card_list.dart';
import 'package:project/features/product/views/product_details.dart';
import 'package:project/shared/custom_text.dart';

class OrderHistoryView extends StatelessWidget {
  const OrderHistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              ...List.generate(10, (index) {
                return Card(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 30,
                      horizontal: 10,
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Image.asset('assets/image3.png'),
                            Column(
                              children: [
                                CustomText(
                                  text: 'Hamburger Veggie Burger',
                                  color: Colors.black,
                                  size: 15,
                                  weight: FontWeight.bold,
                                ),
                                CustomText(
                                  text: '  Veggie Burger',
                                  color: Colors.black,
                                  size: 15,
                                  weight: FontWeight.w500,
                                ),
                                CustomText(
                                  text: '  price 12\$',
                                  color: Colors.black,
                                  size: 15,
                                  weight: FontWeight.w500,
                                ),
                              ],
                            ),
                          ],
                        ),
                        Gap(40),
                        CustomConfirmButton(
                          height: 40,
                          width: 400,
                          text: 'order again',
                          onPressed: () {
                            
                          },
                        ),
                      ],
                    ),
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}

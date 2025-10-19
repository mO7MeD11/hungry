import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:project/core/constants/app_colors.dart';
import 'package:project/features/cart/widgets/custom_card_list.dart';
import 'package:project/features/checkout/views/checkout.dart';
import 'package:project/features/product/views/product_details.dart';
import 'package:project/shared/custom_text.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Column(
              children: [
                Expanded(child: CartListView()),
                Gap(30),

                TotalAndConfirmRow(),
                Gap(30),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class TotalAndConfirmRow extends StatelessWidget {
  const TotalAndConfirmRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          CustomText(
            text: 'Total \n \$18.19',
            color: Colors.black,
            size: 16,
            weight: FontWeight.w500,
          ),
          Spacer(),
          CustomConfirmButton(
            height: 60,
            width: 150,
            text: 'Checkout',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return Checkout();
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

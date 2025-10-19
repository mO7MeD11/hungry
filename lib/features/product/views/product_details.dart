import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:project/core/constants/app_colors.dart';
import 'package:project/features/home/data/product_model.dart';
import 'package:project/features/product/widgets/CustomListItem.dart';
import 'package:project/features/product/widgets/spicy_slider.dart';
import 'package:project/shared/custom_text.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({super.key, required this.product});
  final ProductModel product;

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  double value = .7;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gap(100),
            SpicySlider(
              onChanged: (d) {
                value = d;
                setState(() {});
              },
              value: value,
            ),
            Gap(30),
            Text('Toppings'),
            Gap(20),
            CustomListItems(),

            Gap(30),
            Text('Side options'),
            Gap(20),
            CustomListItems(),
            Gap(30),
            Row(
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
                  text: 'Add to cart',
                  onPressed: () {
                    
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CustomConfirmButton extends StatelessWidget {
  const CustomConfirmButton({
    super.key,
    required this.height,
    required this.width,
    required this.text,
    required this.onPressed,
  });
  final double height;
  final double width;
  final String text;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(backgroundColor: AppColors.kPColor),
        child: CustomText(
          text: text,
          color: Colors.white,
          size: 16,
          weight: FontWeight.w500,
        ),
      ),
    );
  }
}

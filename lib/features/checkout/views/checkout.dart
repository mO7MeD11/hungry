import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:project/features/product/views/product_details.dart';
import 'package:project/shared/custom_text.dart';

class Checkout extends StatefulWidget {
  const Checkout({super.key});

  @override
  State<Checkout> createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  var isSelected = 'cash';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              OrderDetails(),
              Gap(50),
              CustomText(
                text: 'Payment methods',
                color: Colors.black,
                size: 20,
                weight: FontWeight.bold,
              ),
              Gap(10),

              ListTile(
                contentPadding: EdgeInsets.all(6),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusGeometry.circular(12),
                ),
                tileColor: Colors.brown.shade900,
                leading: Image.asset('assets/dollar.png'),
                title: CustomText(
                  text: 'cash on delivery',
                  color: Colors.white,
                  size: 15,
                  weight: FontWeight.bold,
                ),
                trailing: Radio<String>(
                  value: 'cash',
                  groupValue: isSelected,
                  activeColor: Colors.white,
                  onChanged: (v) {
                    setState(() {
                      isSelected = v!;
                    });
                  },
                ),
              ),
              Gap(10),

              ListTile(
                contentPadding: EdgeInsets.all(6),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusGeometry.circular(12),
                ),
                tileColor: Colors.blue.shade900,
                leading: Image.asset('assets/visa.png', width: 100, height: 90),
                title: CustomText(
                  text: 'cash on delivery',
                  color: Colors.white,
                  size: 15,
                  weight: FontWeight.bold,
                ),
                trailing: Radio<String>(
                  value: 'visa',
                  groupValue: isSelected,
                  activeColor: Colors.white,
                  onChanged: (v) {
                    isSelected = v!;
                    setState(() {});
                  },
                ),
              ),

              Row(
                children: [
                  Checkbox(value: false, onChanged: (v) {}),
                  CustomText(
                    text: 'Save card details for future payments',
                    color: Colors.black,
                    size: 16,
                    weight: FontWeight.w400,
                  ),
                ],
              ),
              Spacer(),
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
                    text: 'pay now',
                    onPressed: () async {
                      await showDialog(
                        context: context,
                        barrierDismissible: true,

                        builder: (context) => const ShowDialog(),
                      );
                    },
                  ),
                ],
              ),
              Gap(100),
            ],
          ),
        ),
      ),
    );
  }
}

class OrderDetails extends StatelessWidget {
  const OrderDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          text: 'Order summary',
          color: Colors.black,
          size: 20,
          weight: FontWeight.w600,
        ),
        Gap(10),
        Row(
          children: [
            CustomText(
              text: 'Order',
              color: Colors.grey.shade600,
              size: 18,
              weight: FontWeight.w400,
            ),
            Spacer(),
            CustomText(
              text: '\$16.48',
              color: Colors.grey.shade600,
              size: 18,
              weight: FontWeight.w400,
            ),
          ],
        ),
        Gap(10),
        Row(
          children: [
            CustomText(
              text: 'Taxes',
              color: Colors.grey.shade600,
              size: 18,
              weight: FontWeight.w400,
            ),
            Spacer(),
            CustomText(
              text: '\$0.3',
              color: Colors.grey.shade600,
              size: 18,
              weight: FontWeight.w400,
            ),
          ],
        ),
        Gap(10),
        Row(
          children: [
            CustomText(
              text: 'Delivery fees',
              color: Colors.grey.shade600,
              size: 18,
              weight: FontWeight.w400,
            ),
            Spacer(),
            CustomText(
              text: '\$1.5',
              color: Colors.grey.shade600,
              size: 18,
              weight: FontWeight.w400,
            ),
          ],
        ),

        Gap(6),
        Divider(),
        Row(
          children: [
            CustomText(
              text: 'Total:',
              color: Colors.black,
              size: 18,
              weight: FontWeight.w700,
            ),
            Spacer(),
            CustomText(
              text: '\$18.19',
              color: Colors.black,
              size: 18,
              weight: FontWeight.w700,
            ),
          ],
        ),
        Gap(10),
        Row(
          children: [
            CustomText(
              text: 'Estimated delivery time:',
              color: Colors.black,
              size: 14,
              weight: FontWeight.w600,
            ),
            Spacer(),
            CustomText(
              text: '\$15 - 30 mins',
              color: Colors.black,
              size: 14,
              weight: FontWeight.w600,
            ),
          ],
        ),
      ],
    );
  }
}

class ShowDialog extends StatelessWidget {
  const ShowDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Icon(Icons.check_circle, color: Colors.green, size: 80),
            SizedBox(height: 16),
            Text(
              'Success!',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project/core/constants/app_colors.dart';
import 'package:project/features/auth/views/profile_view.dart';
import 'package:project/features/cart/views/cart_view.dart';
import 'package:project/features/home/views/home_view.dart';
import 'package:project/features/orderHistory/views/order_history_view.dart';

class Root extends StatefulWidget {
  const Root({super.key});

  @override
  State<Root> createState() => _RootState();
}

class _RootState extends State<Root> {
  List<Widget> screens = [
    HomeView(),
    CartView(),
    OrderHistoryView(),
    ProfileView(),
  ];
  int currentIndex = 0;
  PageController controller = PageController();

  @override
  void initState() {
    controller = PageController(initialPage: currentIndex);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: controller,
        physics: NeverScrollableScrollPhysics(),
        children: screens,
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: AppColors.kPColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(18),
            topRight: Radius.circular(18),
          ),
        ),
        child: BottomNavigationBar(
          currentIndex: currentIndex,

          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey.shade600,
          elevation: 0,
          type: BottomNavigationBarType.fixed,
          backgroundColor: AppColors.kPColor,
          onTap: (index) {
            currentIndex = index;
            controller.jumpToPage(currentIndex);
            setState(() {});
          },

          items: [
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.cart),
              label: 'Cart',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.local_restaurant_sharp),
              label: 'order history',
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.profile_circled),
              label: 'profile',
            ),
          ],
        ),
      ),
    );
  }
}

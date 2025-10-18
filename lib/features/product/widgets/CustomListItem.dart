import 'package:flutter/material.dart';

class CustomListItems extends StatelessWidget {
  const CustomListItems({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(10, (index) {
          return Padding(
            padding: EdgeInsets.only(left: index != 0 ? 8 : 0),
            child: CustomItem(),
          );
        }),
      ),
    );
  }
}

class CustomItem extends StatelessWidget {
  const CustomItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xff3C2F2F),
        borderRadius: BorderRadius.circular(16),
      ),
      width: 100,
      height: 110,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 23),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Image.asset('assets/tomato.png', width: 55, height: 45),
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Row(
              children: [
                Text(
                  'tomato',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Spacer(),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Icon(Icons.add, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:furniture_app/theme.dart';

class ProductGridItem extends StatelessWidget {
  final String imageUrl;
  final String title;
  final int price;
  final bool isWishlist;

  const ProductGridItem(
      {required this.imageUrl,
      required this.title,
      required this.price,
      required this.isWishlist,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
        10,
      )),
      child: Container(
        width: (MediaQuery.of(context).size.width - 82) / 2,
        padding: const EdgeInsets.all(
          20,
        ),
        child: Column(
          children: [
            Image.asset(imageUrl),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Poan Chair',
              style: blackTextStyle.copyWith(
                fontSize: 16,
                fontWeight: semibold,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '\$$price',
                  style: blackTextStyle.copyWith(
                    fontSize: 18,
                    fontWeight: semibold,
                  ),
                ),
                Image.asset(
                  isWishlist
                      ? 'assets/button_wishlist_active.png'
                      : 'assets/button_wishlist.png',
                  width: 44,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

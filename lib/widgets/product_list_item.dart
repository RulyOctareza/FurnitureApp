import 'package:flutter/material.dart';
import 'package:furniture_app/theme.dart';

class ProductListItem extends StatelessWidget {
  final String title;
  final String imageUrl;
  final int price;

  const ProductListItem(
      {required this.imageUrl,
      required this.title,
      required this.price,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(
        bottom: 16,
        right: 18,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: kWhiteColor,
      ),
      child: Row(
        children: [
          Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  imageUrl,
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 12,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: blackTextStyle.copyWith(fontWeight: semibold),
              ),
              const SizedBox(
                height: 6,
              ),
              Text(
                "\$$price",
                style: blackTextStyle.copyWith(fontWeight: semibold),
              ),
            ],
          )
        ],
      ),
    );
  }
}

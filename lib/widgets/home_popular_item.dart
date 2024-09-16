import 'package:flutter/material.dart';
import 'package:furniture_app/theme.dart';

class HomePopularItem extends StatelessWidget {
  final String title;
  final String imageUrl;
  final int price;
  final bool isWhislist;

  const HomePopularItem(
      {required this.title,
      required this.imageUrl,
      required this.isWhislist,
      required this.price,
      super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350,
      child: Card(
        color: kWhiteColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            10,
          ),
        ),
        margin: const EdgeInsets.only(
          left: 24,
          right: 24,
        ),
        child: Column(
          children: [
            Container(
              height: 180,
              width: 200,
              decoration: BoxDecoration(
                color: kWhiteGreyColor,
                borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(10), bottom: Radius.circular(10)),
              ),
              child: Center(
                child: Image.asset(
                  imageUrl,
                  width: 160,
                  height: 140,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
                width: 200,
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: blackTextStyle.copyWith(
                        fontSize: 18,
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
                          "\$$price",
                          style: blackTextStyle.copyWith(
                            fontSize: 18,
                            fontWeight: semibold,
                          ),
                        ),
                        InkWell(
                          onTap: () {},
                          child: Image.asset(
                            isWhislist
                                ? 'assets/button_wishlist.png'
                                : 'assets/button_wishlist_active.png',
                            width: 44,
                          ),
                        )
                      ],
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}

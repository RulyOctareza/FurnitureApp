import 'package:flutter/material.dart';
import 'package:furniture_app/theme.dart';

class HomeItemCategory extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String subtitle;

  const HomeItemCategory(
      {required this.imageUrl,
      required this.title,
      required this.subtitle,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: MediaQuery.of(context).size.width - (2 * 24),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 100,
              decoration: BoxDecoration(
                color: kWhiteColor,
                borderRadius: BorderRadius.circular(14),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 100,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: blackTextStyle.copyWith(
                            fontSize: 18, fontWeight: semibold),
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        subtitle,
                        style: greyTextStyle.copyWith(fontSize: 16),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Image.asset(
            imageUrl,
            width: 140,
          ),
        ],
      ),
    );
  }
}

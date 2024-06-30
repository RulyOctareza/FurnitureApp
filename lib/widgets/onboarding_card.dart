import 'package:flutter/material.dart';
import 'package:furniture_app/theme.dart';

class OnboardingCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String subtitle;

  const OnboardingCard({
    required this.imageUrl,
    required this.title,
    required this.subtitle,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 100,
        ),
        Image.asset(
          imageUrl,
          width: double.infinity,
          height: 322,
        ),
        const SizedBox(
          height: 127,
        ),
        Text(
          title,
          style: blackTextStyle.copyWith(fontSize: 26),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          subtitle,
          style: greyTextStyle.copyWith(
            fontSize: 16,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

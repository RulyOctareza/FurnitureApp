import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:furniture_app/theme.dart';
import 'package:furniture_app/widgets/onboarding_card.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  State<OnBoardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnBoardingPage> {
  int currentIndex = 0;
  CarouselSliderControllerImpl controller = CarouselSliderControllerImpl();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: CarouselSlider(
              items: const [
                OnboardingCard(
                  imageUrl: 'assets/image_onboarding1.png',
                  title: 'Buy Furniture Easily',
                  subtitle:
                      'Aliqua id fugiat nostxrud irure ex duis ea\nquis id quis ad et. Sunt qui esse',
                ),
                OnboardingCard(
                  imageUrl: 'assets/image_onboarding2.png',
                  title: 'Buy Furniture Easily',
                  subtitle:
                      'Aliqua id fugiat nostxrud irure ex duis ea\nquis id quis ad et. Sunt qui esse',
                ),
                OnboardingCard(
                  imageUrl: 'assets/image_onboarding3.png',
                  title: 'Buy Furniture Easily',
                  subtitle:
                      'Aliqua id fugiat nostxrud irure ex duis ea\nquis id quis ad et. Sunt qui esse',
                ),
              ],
              options: CarouselOptions(
                initialPage: currentIndex,
                height: double.infinity,
                viewportFraction: 1,
                enableInfiniteScroll: false,
                onPageChanged: (index, _) {
                  setState(() {
                    currentIndex = index;
                  });
                },
              ),
              carouselController: controller,
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 40,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                    onPressed: () {
                      controller.animateToPage(2);
                    },
                    child: Text(
                      'SKIP',
                      style: blackTextStyle.copyWith(fontSize: 18),
                    )),
                Row(
                  children: [
                    Container(
                      width: 10,
                      height: 10,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: currentIndex == 0 ? kBlackColor : kLineDarkColor,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      width: 10,
                      height: 10,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: currentIndex == 1 ? kBlackColor : kLineDarkColor,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      width: 10,
                      height: 10,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: currentIndex == 2 ? kBlackColor : kLineDarkColor,
                      ),
                    ),
                  ],
                ),
                TextButton(
                  onPressed: () {
                    if (currentIndex == 2) {
                      Navigator.pushNamed(context, '/sign-in');
                    } else {
                      controller.nextPage();
                    }
                  },
                  child: Text(
                    'NEXT',
                    style: blackTextStyle.copyWith(fontSize: 18),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 29,
          )
        ],
      ),
    );
  }
}

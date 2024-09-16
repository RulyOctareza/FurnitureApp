import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:furniture_app/theme.dart';
import 'package:furniture_app/widgets/button_navbar.dart';
import 'package:furniture_app/widgets/home_item_category.dart';
import 'package:furniture_app/widgets/home_popular_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  CarouselController controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Image.asset(
              'assets/image_background.png',
              alignment: Alignment.topCenter,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 24,
              ),
              child: ListView(
                children: [
                  logoCart(),
                  searchBar(),
                  categoryTitle(),
                  categoryItem(),
                  populerItem(),
                ],
              ),
            ),
          ],
        ),
      ),
      backgroundColor: kWhiteGreyColor,
      bottomNavigationBar: const ButtonNavbar(),
    );
  }

  Widget populerItem() {
    return Container(
      margin: const EdgeInsets.only(top: 25),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
        color: kWhiteColor,
      ),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(
              top: 24,
              left: 24,
              right: 24,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Populer',
                    style: blackTextStyle.copyWith(
                      fontWeight: semibold,
                      fontSize: 20,
                    )),
                TextButton(
                    onPressed: () {},
                    child: Text(
                      'Show All',
                      style: blackTextStyle,
                    )),
              ],
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          const SizedBox(
            height: 320,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  HomePopularItem(
                    title: 'Poan Chair',
                    imageUrl: 'assets/image_product_popular1.png',
                    isWhislist: true,
                    price: 34,
                  ),
                  HomePopularItem(
                    title: 'Poan Chair',
                    imageUrl: 'assets/image_product_popular2.png',
                    isWhislist: true,
                    price: 34,
                  ),
                  HomePopularItem(
                    title: 'Poan Chair',
                    imageUrl: 'assets/image_product_popular3.png',
                    isWhislist: true,
                    price: 34,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 50,
          )
        ],
      ),
    );
  }

  Widget categoryItem() {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: Column(
        children: [
          CarouselSlider(
            items: const [
              HomeItemCategory(
                  imageUrl: 'assets/image_product_category1.png',
                  title: 'Minimalis Chair',
                  subtitle: 'Chair'),
              HomeItemCategory(
                  imageUrl: 'assets/image_product_category2.png',
                  title: 'Minimalis Table',
                  subtitle: 'Table'),
              HomeItemCategory(
                  imageUrl: 'assets/image_product_category3.png',
                  title: 'Minimalis Chair',
                  subtitle: 'Chair'),
            ],
            options: CarouselOptions(
              height: 90,
              scrollDirection: Axis.horizontal,
              enableInfiniteScroll: false,
              viewportFraction: 1,
              onPageChanged: (index, _) {
                setState(() {
                  currentIndex = index;
                });
              },
            ),
            
          ),
          const SizedBox(
            height: 13,
          ),
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
        ],
      ),
    );
  }

  Widget categoryTitle() {
    return Container(
      margin: const EdgeInsets.only(top: 30),
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Category',
              style: blackTextStyle.copyWith(
                fontWeight: semibold,
                fontSize: 20,
              )),
          TextButton(
              onPressed: () {},
              child: Text(
                'Show All',
                style: blackTextStyle,
              ))
        ],
      ),
    );
  }

  Widget logoCart() {
    return Container(
        margin: const EdgeInsets.only(
          top: 24,
        ),
        child: Column(children: [
          Row(
            children: [
              SizedBox(
                  width: 53,
                  height: 44,
                  child: Image.asset('assets/logo_dark.png')),
              const SizedBox(
                width: 9,
              ),
              Text(
                'Space',
                style: blackTextStyle.copyWith(
                  fontSize: 19,
                  fontWeight: bold,
                ),
              ),
              const Spacer(),
              IconButton(
                onPressed: () {},
                icon: Image.asset(
                  'assets/icon_cart.png',
                  width: 30,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          )
        ]));
  }

  Widget searchBar() {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamedAndRemoveUntil(
          context,
          '/search',
          (route) => false,
        );
      },
      child: Container(
        height: 56,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          color: kWhiteColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
                margin: const EdgeInsets.only(
                  left: 16,
                ),
                width: 220,
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Text(
                  'Search Furniture',
                  style: greyTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: semibold,
                  ),
                )),
            SizedBox(
              height: 44,
              width: 50,
              child: IconButton(
                  onPressed: () {},
                  icon: Image.asset(
                    'assets/icon_search.png',
                    width: 24,
                  )),
            ),
          ],
        ),
      ),
    );
  }
}

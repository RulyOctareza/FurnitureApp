import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:furniture_app/theme.dart';
import 'package:furniture_app/widgets/button_navbar.dart';
import 'package:furniture_app/widgets/home_item_category.dart';

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
      body: Stack(
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
              ],
            ),
          ),
        ],
      ),
      backgroundColor: kWhiteGreyColor,
      bottomNavigationBar: const ButtonNavbar(),
    );
  }

  Widget categoryItem() {
    return Container(
      margin: EdgeInsets.only(top: 20),
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
              height: 130,
              scrollDirection: Axis.horizontal,
              enableInfiniteScroll: false,
              viewportFraction: 1,
              onPageChanged: (index, _) {
                setState(() {
                  currentIndex = index;
                });
              },
            ),
            carouselController: controller,
          ),
          SizedBox(
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
      margin: EdgeInsets.only(top: 30),
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
        margin: EdgeInsets.only(
          top: 24,
        ),
        child: Column(children: [
          Row(
            children: [
              Container(
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
          SizedBox(
            height: 30,
          )
        ]));
  }

  Widget searchBar() {
    return Container(
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
            margin: EdgeInsets.only(
              left: 16,
            ),
            width: 220,
            padding: EdgeInsets.symmetric(vertical: 16),
            child: TextFormField(
              decoration: InputDecoration.collapsed(
                hintText: 'Search Furniture',
                hintStyle: greyTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: semibold,
                ),
              ),
            ),
          ),
          Container(
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
    );
  }
}

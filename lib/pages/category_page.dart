import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:furniture_app/theme.dart';
import 'package:furniture_app/widgets/home_item_category.dart';
import 'package:furniture_app/widgets/product_grid_item.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteGreyColor,
      appBar: PreferredSize(preferredSize: const Size(double.infinity, 70),
          child: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: kWhiteColor,
            title: Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/homepage');
                  },
                  icon: const Icon(Icons.chevron_left),
                ),
                const SizedBox(
                  width: 5,
                ),
                Expanded(
                  child: Container(
                    child: Row(
                      children: [
                        Text('Chair',style: blackTextStyle),
                        const Spacer(),
                        IconButton(onPressed: () {}, icon: Image.asset('assets/icon_search.png', width: 24,) , 
                        ),
                        IconButton(onPressed: () {}, icon: Image.asset('assets/icon_filter.png', width: 24,) , 
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
    body:  Column(
      children: [
        categoryItem(),
        buildGrid(),
      ],)
    );
    
  }

   Widget buildGrid() {
    return const Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      spacing: 18,
      runSpacing: 18,
      children: [
        ProductGridItem(
        title: 'Poan Chair', 
          imageUrl: 'assets/image_product_grid1.png',
          price: 34,
          isWishlist: true,
        ),
        ProductGridItem(
          title: 'Poan Chair',
          imageUrl: 'assets/image_product_grid4.png',
          price: 34,
          isWishlist: false,
        ),
        ProductGridItem(
          title: 'Poan Chair',
          imageUrl: 'assets/image_product_grid2.png',
          price: 34,
          isWishlist: false,
        ),
        ProductGridItem(
          title: 'Poan Chair',
          imageUrl: 'assets/image_product_grid3.png',
          price: 34,
          isWishlist: false,
        ),
       
      ],
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
            ],
            options: CarouselOptions(
              height: 90,
              scrollDirection: Axis.horizontal,
              enableInfiniteScroll: false,
              viewportFraction: 1,
             
            ),
            
          ),
          
        ],
      ),
    );
  }
    
  }

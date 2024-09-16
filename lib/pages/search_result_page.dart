import 'package:flutter/material.dart';
import 'package:furniture_app/theme.dart';
import 'package:furniture_app/widgets/product_grid_item.dart';
import 'package:furniture_app/widgets/product_list_item.dart';
import 'package:furniture_app/widgets/skeleton_item.dart';

class SearchResultPage extends StatefulWidget {
  const SearchResultPage({super.key});

  @override
  State<SearchResultPage> createState() => _SearchResultPageState();
}

class _SearchResultPageState extends State<SearchResultPage> {
  bool isLoading = true;
  bool isShowGrid = true;

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        isLoading = false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size(double.infinity, 100),
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
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: kWhiteGreyColor,
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            onFieldSubmitted: (value) => Navigator.pushNamed(
                              context,
                              '/search-result-page',
                            ),
                            decoration: const InputDecoration.collapsed(
                                hintText: 'Search Furniture'),
                          ),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        IconButton(
                            onPressed: () {}, icon: const Icon(Icons.close)),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  width: 12,
                ),
                IconButton(
                    onPressed: () {},
                    icon: Image.asset(
                      'assets/icon_filter.png',
                      width: 24,
                    ))
              ],
            ),
            bottom: const TabBar(
              indicatorColor: Colors.black,
              labelColor: Colors.black,
              isScrollable: true,
              tabs: [
                Tab(
                  text: 'Chair',
                ),
                Tab(
                  text: 'Table',
                ),
                Tab(
                  text: 'Accessories',
                ),
                Tab(
                  text: 'Living Room',
                ),
              ],
            ),
          ),
        ),
        body: TabBarView(children: [
          buildbody(),
          buildbody(),
          buildbody(),
          buildbody(),
        ]),
      ),
    );
  }

  Widget buildbody() {
    return ListView(
      padding: const EdgeInsets.symmetric(
        horizontal: 24,
      ),
      children: [
        const SizedBox(
          height: 30,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Result for: Poan',
              style:
                  blackTextStyle.copyWith(fontWeight: semibold, fontSize: 16),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  isShowGrid = !isShowGrid;
                });
              },
              child: Image.asset(
                isShowGrid ? 'assets/icon_list.png' : 'assets/icon_grid.png',
                width: 24,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        isLoading
            ? buildLoading()
            : isShowGrid
                ? buildGrid()
                : buildlist(),
      ],
    );
  }

  Widget buildLoading() {
    return const Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      spacing: 18,
      runSpacing: 18,
      children: [
        SkeletonItem(),
        SkeletonItem(),
        SkeletonItem(),
        SkeletonItem(),
        SkeletonItem(),
        SkeletonItem(),
        SkeletonItem(),
        SkeletonItem(),
      ],
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

  Widget buildlist() {
    return const Column(
      children: [
        ProductListItem(
            imageUrl: 'assets/image_product_list1.png',
            title: 'Poan Chair',
            price: 34),
        ProductListItem(
            imageUrl: 'assets/image_product_list2.png',
            title: 'Poan Chair',
            price: 34),
        ProductListItem(
            imageUrl: 'assets/image_product_list3.png',
            title: 'Poan Chair',
            price: 34),
        ProductListItem(
            imageUrl: 'assets/image_product_list4.png',
            title: 'Poan Chair',
            price: 34),
        ProductListItem(
            imageUrl: 'assets/image_product_list1.png',
            title: 'Poan Chair',
            price: 34),
        ProductListItem(
            imageUrl: 'assets/image_product_list2.png',
            title: 'Poan Chair',
            price: 34),
        ProductListItem(
            imageUrl: 'assets/image_product_list3.png',
            title: 'Poan Chair',
            price: 34),
        ProductListItem(
            imageUrl: 'assets/image_product_list4.png',
            title: 'Poan Chair',
            price: 34),
      ],
    );
  }
}

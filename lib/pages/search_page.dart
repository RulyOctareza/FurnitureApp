import 'package:flutter/material.dart';
import 'package:furniture_app/theme.dart';
import 'package:furniture_app/widgets/product_list_item.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kWhiteGreyColor,
        appBar: PreferredSize(
          preferredSize: const Size(double.infinity, 70),
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
                        IconButton(onPressed: () {}, icon: const Icon(Icons.close))
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        body: ListView(
          padding: const EdgeInsets.only(top: 41, left: 20, bottom: 20),
          children: [
            Text(
              'Recomendation',
              style:
                  blackTextStyle.copyWith(fontSize: 16, fontWeight: semibold),
            ),
            const ProductListItem(
                imageUrl: 'assets/image_product_list1.png',
                title: 'Poan Chair',
                price: 34),
            const ProductListItem(
                imageUrl: 'assets/image_product_list2.png',
                title: 'Poan Chair',
                price: 34),
            const ProductListItem(
                imageUrl: 'assets/image_product_list3.png',
                title: 'Poan Chair',
                price: 34),
            const ProductListItem(
                imageUrl: 'assets/image_product_list4.png',
                title: 'Poan Chair',
                price: 34),
          ],
        ));
  }
}

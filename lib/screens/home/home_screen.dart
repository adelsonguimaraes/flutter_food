import 'package:flutter/material.dart';
import 'package:flutter_food/screens/constants.dart';
import 'package:flutter_food/screens/demoData.dart';

import 'components/image_carousel.dart';
import 'components/restaurant_info_medium_card.dart';
import 'components/section_title.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: Colors.white,
              elevation: 0,
              floating: true,
              title: Center(
                child: Column(
                  children: [
                    Text(
                      'Delivery to'.toUpperCase(),
                      style: Theme.of(context)
                          .textTheme
                          .caption!
                          .copyWith(color: KActiveColor),
                    ),
                    const Text(
                      "San Francisco",
                      style: TextStyle(color: Colors.black),
                    ),
                  ],
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Filter',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
            const SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: defaultPadding),
              sliver: SliverToBoxAdapter(
                child: ImageCarousel(),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.all(defaultPadding),
              sliver: SliverToBoxAdapter(
                child: SectionTitle(
                  title: 'Featured Partners',
                  press: () {},
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                    demoMediumCardData.length,
                    growable: true,
                    (index) => Padding(
                      padding: const EdgeInsets.only(left: defaultPadding),
                      child: RestaurantInfoMediumCard(
                        title: demoMediumCardData[index]['name'],
                        location: demoMediumCardData[index]['location'],
                        image: demoMediumCardData[index]['image'],
                        deliveryTime: demoMediumCardData[index]['delivertTime'],
                        rating: demoMediumCardData[index]['rating'],
                        press: () {},
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.all(8.0),
              sliver: SliverToBoxAdapter(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(promotionalBanner),
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.all(defaultPadding),
              sliver: SliverToBoxAdapter(
                child: SectionTitle(
                  title: 'Best Pick',
                  press: () {},
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                    demoMediumCardData.length,
                    growable: true,
                    (index) => Padding(
                      padding: const EdgeInsets.only(left: defaultPadding),
                      child: RestaurantInfoMediumCard(
                        title: demoBestPickData[index]['name'],
                        location: demoBestPickData[index]['location'],
                        image: demoBestPickData[index]['image'],
                        deliveryTime: demoBestPickData[index]['delivertTime'],
                        rating: demoBestPickData[index]['rating'],
                        press: () {},
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

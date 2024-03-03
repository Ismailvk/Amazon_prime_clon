// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:amazon_prime_clone/screens/tv_shows_screen.dart';
import 'package:flutter/material.dart';

import 'all_screen.dart';
import 'movies_screen.dart';

ValueNotifier<bool> isShowTabbar = ValueNotifier<bool>(true);

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: DefaultTabController(
            length: 3,
            child: Stack(
              children: [
                TabBarView(
                    physics: const NeverScrollableScrollPhysics(),
                    children: [AllScreen(), MoviesScreen(), TvShowsScreen()]),
                Positioned(
                  top: 0,
                  right: 0,
                  left: 0,
                  child: ValueListenableBuilder(
                    valueListenable: isShowTabbar,
                    builder: (context, value, _) {
                      return AnimatedContainer(
                        duration: const Duration(milliseconds: 10),
                        height: isShowTabbar.value == true ? 100 : 0,
                        // color: Colors.grey.withOpacity(0.5),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Image.asset(
                                  'assets/images/prime-video-logo-new-edited one.png',
                                  width: 100,
                                  color: Colors.white,
                                ),
                                const SizedBox(
                                  width: 190,
                                ),
                                const Icon(
                                  Icons.cast,
                                  color: Colors.white,
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                const CircleAvatar(
                                  radius: 15,
                                  backgroundImage: AssetImage(
                                      'assets/images/th (2).jpeg.jpg'),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: TabBar(
                                      indicatorSize: TabBarIndicatorSize.tab,
                                      indicatorColor: Colors.transparent,
                                      labelColor: Colors.black,
                                      isScrollable: true,
                                      unselectedLabelColor: Colors.white,
                                      labelPadding: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      indicatorPadding:
                                          const EdgeInsets.symmetric(
                                              vertical: 10),
                                      indicator: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: Colors.white,
                                      ),
                                      tabs: [
                                        const Tab(
                                          text: 'All',
                                        ),
                                        const Tab(
                                          text: 'Movies',
                                        ),
                                        const Tab(
                                          text: 'TV Shows',
                                        ),
                                      ]),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}

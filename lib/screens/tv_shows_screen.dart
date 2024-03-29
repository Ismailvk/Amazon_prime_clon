// ignore_for_file: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../services/api_services.dart';
import '../widgets/custom_future_builder.dart';
import '../widgets/text_double_widget.dart';
import 'home_screen.dart';

class TvShowsScreen extends StatelessWidget {
  TvShowsScreen({super.key});

  final ScrollController scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    scrollController.addListener(scrollListn);
    return ListView(
      controller: scrollController,
      children: [
        TextDoubleWidget(
          secondText: ' - Recently added movies',
          arrowVisibility: true,
          topPaddingCheck: true,
          firstText: 'Prime',
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
            height: 100,
            child: CustomFutureBuilder(
              apifunction: MovieApi.recentlyAddedTvShows(),
              smallSize: true,
            )),
        const SizedBox(
          height: 35,
        ),
        TextDoubleWidget(
          secondText: ' - Recommended movies',
          arrowVisibility: true,
          firstText: 'Prime',
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
            height: 100,
            child: CustomFutureBuilder(
              apifunction: MovieApi.recommendedTvShows(),
              smallSize: true,
            )),
        const SizedBox(
          height: 35,
        ),
        TextDoubleWidget(
          secondText: ' - Amazone Originals and Exclusinve movies',
          firstText: 'Prime',
          arrowVisibility: true,
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
            height: 200,
            child: CustomFutureBuilder(
              apifunction: MovieApi.topTvShows(),
              smallSize: false,
            )),
        const SizedBox(
          height: 35,
        ),
        TextDoubleWidget(
          secondText: ' - Latest movies',
          firstText: 'Prime',
          arrowVisibility: true,
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
            height: 100,
            child: CustomFutureBuilder(
              apifunction: MovieApi.latestShows(),
              smallSize: true,
            )),
        const SizedBox(
          height: 35,
        ),
        TextDoubleWidget(
          secondText: ' - Top movies',
          firstText: 'Prime',
          arrowVisibility: true,
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
            height: 100,
            child: CustomFutureBuilder(
              apifunction: MovieApi.amazonOriginals(),
              smallSize: true,
            )),
      ],
    );
  }

  scrollListn() {
    if (scrollController.position.userScrollDirection ==
        ScrollDirection.reverse) {
      isShowTabbar.value = false;
      isShowTabbar.notifyListeners();
    } else {
      isShowTabbar.value = true;
      isShowTabbar.notifyListeners();
    }
  }
}

// ignore_for_file: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member

import 'package:amazon_prime_clone/services/api_services.dart';
import 'package:amazon_prime_clone/widgets/custom_future_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../widgets/text_double_widget.dart';
import 'home_screen.dart';

class AllScreen extends StatelessWidget {
  AllScreen({super.key});
  final ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    scrollController.addListener(scrollListner);
    return ListView(
      shrinkWrap: true,
      controller: scrollController,
      children: [
        TextDoubleWidget(
          firstText: 'Prime',
          secondText: ' - Recently added movies',
          arrowVisibility: true,
          topPaddingCheck: true,
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
            height: 100,
            child: CustomFutureBuilder(
              apifunction: MovieApi.topTvShows(),
              smallSize: true,
            )),
        const SizedBox(
          height: 35,
        ),
        TextDoubleWidget(
            secondText: 'Continue Watching', arrowVisibility: false),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
            height: 100,
            child: CustomFutureBuilder(
              apifunction: MovieApi.continueMovies(),
              smallSize: true,
              playIconCheck: true,
            )),
        const SizedBox(
          height: 35,
        ),
        TextDoubleWidget(
          firstText: 'Prime',
          secondText: ' - Amazone Originals and Exclusives',
          arrowVisibility: true,
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          height: 200,
          child: CustomFutureBuilder(
              apifunction: MovieApi.recentlyAddedTvShows(), smallSize: false),
        ),
        const SizedBox(
          height: 35,
        ),
        TextDoubleWidget(
          firstText: 'Prime',
          secondText: ' - Recommended movies',
          arrowVisibility: true,
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          height: 100,
          child: CustomFutureBuilder(
              apifunction: MovieApi.recomemdedMovies(), smallSize: true),
        ),
        const SizedBox(
          height: 35,
        ),
        TextDoubleWidget(
            firstText: 'Prime',
            arrowVisibility: true,
            secondText: ' - Arabic subtitles'),
        SizedBox(
          height: 100,
          child: CustomFutureBuilder(
              apifunction: MovieApi.recentlyAdded(), smallSize: true),
        ),
        const SizedBox(
          height: 35,
        ),
      ],
    );
  }

  scrollListner() {
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

import 'package:amazon_prime_clone/models/movies.dart';
import 'package:amazon_prime_clone/widgets/small_card_widget.dart';
import 'package:flutter/material.dart';

class CustomFutureBuilder extends StatelessWidget {
  final bool playIconCheck;
  final bool smallSize;
  final Future<List<Movies>> apifunction;
  const CustomFutureBuilder(
      {super.key,
      required this.apifunction,
      required this.smallSize,
      this.playIconCheck = false});
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: apifunction,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else if (snapshot.hasData) {
          final movies = snapshot.data;
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: movies!.length,
            itemBuilder: (context, index) {
              final movie = movies[index].posterPath == null
                  ? movies[++index]
                  : movies[index];
              final url = 'https://image.tmdb.org/t/p/w500${movie.posterPath}';

              return SmallCardWidget(
                smallSize: smallSize,
                url: url,
                playIconCheck: playIconCheck,
              );
            },
          );
        } else {
          return const Center(child: Text('No data available.'));
        }
      },
    );
  }
}

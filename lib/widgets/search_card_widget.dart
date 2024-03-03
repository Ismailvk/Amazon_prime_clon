import 'package:flutter/material.dart';

import '../models/movies.dart';

class SearchCardWidget extends StatelessWidget {
  const SearchCardWidget({
    Key? key,
    required this.functionType,
    this.cardSizeCheck = false,
    this.playIconCheck = false,
  }) : super(key: key);

  final bool playIconCheck;
  final bool cardSizeCheck;
  final Future<List<Movies>> functionType;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Movies>>(
      future: functionType,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else if (!snapshot.hasData) {
          return const Text('No data available.');
        } else if (snapshot.hasData) {
          final moviesList = snapshot.data!;

          return ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemCount: moviesList.length,
            itemBuilder: (context, index) {
              final data = moviesList[index].posterPath == null
                  ? moviesList[++index]
                  : moviesList[index];

              return Column(
                children: [
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      const SizedBox(width: 17),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        height: 80,
                        width: 150,
                        child: Stack(
                          fit: StackFit.expand,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                  colorFilter: ColorFilter.mode(
                                    Colors.black.withOpacity(1.0),
                                    BlendMode.softLight,
                                  ),
                                  image: NetworkImage(
                                    'https://image.tmdb.org/t/p/w500/${data.posterPath}',
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                gradient: const LinearGradient(
                                  colors: [Colors.black, Colors.transparent],
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.topCenter,
                                ),
                              ),
                            ),
                            if (playIconCheck)
                              const Positioned(
                                bottom: 8,
                                left: 8,
                                child: CircleAvatar(
                                  radius: 16,
                                  backgroundColor: Colors.white,
                                  child: Icon(
                                    Icons.play_arrow,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 10),
                      SizedBox(
                        height: 80,
                        width: 150,
                        child: Text(
                          data.title ?? 'No title Available',
                          style: const TextStyle(
                              color: Colors.white, fontSize: 16),
                        ),
                      ),
                      const SizedBox(width: 15),
                      Container(
                        alignment: const Alignment(0, -1),
                        height: 80,
                        width: 30,
                        child: const Icon(
                          Icons.more_vert,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              );
            },
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}

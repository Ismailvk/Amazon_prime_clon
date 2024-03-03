import 'package:flutter/material.dart';

class SmallCardWidget extends StatelessWidget {
  final bool playIconCheck;
  final String url;
  final bool smallSize;

  const SmallCardWidget(
      {super.key,
      required this.smallSize,
      required this.url,
      required this.playIconCheck});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: smallSize
          ? Container(
              margin: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(url), fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(10)),
              height: 100,
              width: 200,
              child: playIconCheck
                  ? const Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 4, bottom: 4),
                          child: CircleAvatar(
                            radius: 16,
                            backgroundColor: Colors.white,
                            child: Icon(Icons.play_arrow),
                          ),
                        )
                      ],
                    )
                  : const SizedBox.shrink(),
            )
          : Container(
              margin: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(url), fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(10)),
              height: 200,
              width: 120,
            ),
    );
  }
}

// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';

class TextDoubleWidget extends StatelessWidget {
  TextDoubleWidget({
    super.key,
    this.arrowVisibility = true,
    this.firstText,
    required this.secondText,
    this.topPaddingCheck = false,
  });
  final String? firstText;
  final String secondText;
  final bool arrowVisibility;
  final bool topPaddingCheck;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      child: Column(children: [
        topPaddingCheck
            ? const SizedBox(
                height: 84,
              )
            : const SizedBox.shrink(),
        Row(
          children: [
            const SizedBox(
              width: 10,
            ),
            arrowVisibility
                ? Text(
                    firstText ?? '',
                    style: const TextStyle(
                        color: Colors.blue,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  )
                : const SizedBox.shrink(),
            Text(
              secondText,
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 15),
            ),
            const SizedBox(
              width: 12,
            ),
            arrowVisibility
                ? const Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.white,
                    size: 15,
                  )
                : const SizedBox.shrink(),
          ],
        ),
      ]),
    );
  }
}

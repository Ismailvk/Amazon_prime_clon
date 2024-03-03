import 'package:amazon_prime_clone/services/api_services.dart';
import 'package:flutter/material.dart';

import '../../widgets/search_card_widget.dart';

class ScreenSearchPage extends StatefulWidget {
  const ScreenSearchPage({super.key});

  @override
  State<ScreenSearchPage> createState() => _ScreenSearchPageState();
}

String? values;

class _ScreenSearchPageState extends State<ScreenSearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 0),
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.keyboard_arrow_left,
                      color: Colors.white,
                      size: 40,
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  const SizedBox(
                    width: 248,
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
                    backgroundImage:
                        AssetImage('assets/images/th (2).jpeg.jpg'),
                  )
                ],
              ),
              const SizedBox(
                height: 0,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12),
                child: Column(
                  children: [
                    SizedBox(
                      height: 46,
                      width: 370,
                      child: TextField(
                        onTap: () {
                          setState(() {});
                        },
                        onChanged: (value) {
                          setState(() {
                            values = value;
                          });
                        },
                        decoration: InputDecoration(
                            contentPadding: const EdgeInsets.only(top: 18),
                            hintText: 'Actor, title, or genre',
                            hintStyle: TextStyle(color: Colors.grey[500]),
                            prefixIcon: Icon(
                              Icons.search,
                              color: Colors.grey[500],
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10))),
                      ),
                    ),
                    SizedBox(
                      height: 60,
                      child: Row(
                        children: [
                          const SizedBox(
                            width: 10,
                          ),
                          const Text(
                            'Results',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(
                            width: 233,
                          ),
                          Container(
                            alignment: Alignment.center,
                            width: 70,
                            height: 30,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 79, 77, 77),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: const Text(
                              'Filter',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                child: SearchCardWidget(
                  playIconCheck: true,
                  functionType: MovieApi.search(values),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

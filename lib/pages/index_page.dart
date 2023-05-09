// ignore_for_file: must_be_immutable

import 'package:cardscanner/pages/tabs/dashboard.dart';
import 'package:cardscanner/pages/tabs/registred.dart';
import 'package:cardscanner/pages/tabs/today.dart';
import 'package:cardscanner/pages/tabs/unregistred.dart';
import 'package:cardscanner/pages/widgets/paragraph.dart';
import 'package:cardscanner/utils/colors.dart';
import 'package:flutter/material.dart';

class IndexPage extends StatefulWidget {
  const IndexPage({super.key});

  @override
  State<IndexPage> createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  List tabs = [
    {"icon": Icons.car_rental, "view": const Dashboard(), "title": "Dashboard"},
    {"icon": Icons.car_rental, "view": const Today(), "title": "Today's info"},
    {
      "icon": Icons.car_rental,
      "view": const Registred(),
      "title": "Registred cars"
    },
    {
      "icon": Icons.car_rental,
      "view": const Unregistred(),
      "title": "Unregistred cars"
    },
  ];

  String current = "Dashboard";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: main_color,
      body: Column(
        children: [
          Row(
            children: [
              Container(
                color: Colors.black,
                height: MediaQuery.of(context).size.height,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: tabs
                        .map((item) => Padding(
                              padding: const EdgeInsets.only(bottom: 30),
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    current = item['title'];
                                  });
                                },
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Container(
                                    color: item['title'] == current
                                        ? Colors.blue
                                        : Colors.black,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20, vertical: 10),
                                      child: Row(
                                        children: [
                                          Icon(
                                            item['icon'],
                                            color: item['title'] == current
                                                ? Colors.white
                                                : Colors.grey,
                                          ),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          paragraph(
                                            item['title'],
                                            color: item['title'] == current
                                                ? Colors.white
                                                : Colors.grey,
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ))
                        .toList(),
                  ),
                ),
              ),
              Expanded(
                  child: Container(
                height: MediaQuery.of(context).size.height,
                color: main_color2,
                child: tabs
                    .where((item) => item['title'] == current)
                    .first['view'],
              ))
            ],
          )
        ],
      ),
    );
  }
}

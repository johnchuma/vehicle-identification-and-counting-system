// ignore_for_file: implementation_imports, avoid_unnecessary_containers, unused_import

import 'dart:ui';

import 'package:cardscanner/controller/cars_controller.dart';
import 'package:cardscanner/pages/widgets/avatar.dart';
import 'package:cardscanner/pages/widgets/heading.dart';
import 'package:cardscanner/pages/widgets/hint.dart';
import 'package:cardscanner/pages/widgets/paragraph.dart';
import 'package:cardscanner/utils/pictures.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:get/get.dart';

class Registred extends StatelessWidget {
  const Registred({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: GetX<CarsController>(
          init: CarsController(),
          builder: (find) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
              child: Column(
                children: [
                  const SizedBox(
                    height: 40,
                  ),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          heading("Registred"),
                          hint(
                              "Total registered cars: ${find.cars.where((element) => element.registred == true).length}")
                        ],
                      ),
                      GestureDetector(onTap: () {}, child: avatar(tanzania))
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: GridView(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 4,
                              mainAxisSpacing: 5,
                              crossAxisSpacing: 5),
                      children: find.cars
                          .where((element) => element.registred == true)
                          .toList()
                          .map((car) => GestureDetector(
                                onTap: () {
                                  Get.defaultDialog(
                                      title: "Driver details",
                                      content: Container(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              height: 200,
                                              width: 200,
                                              child: CachedNetworkImage(
                                                imageUrl: car.profile,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            heading("Driver name"),
                                            paragraph(car.name),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            heading("Phone"),
                                            paragraph(car.phone),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            heading("Plate number"),
                                            paragraph(car.plate),
                                          ],
                                        ),
                                      ));
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 15),
                                  child: Container(
                                    color: Colors.white,
                                    width: 200,
                                    child: Padding(
                                      padding: const EdgeInsets.all(5),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          CachedNetworkImage(
                                              imageUrl: car.image),
                                          const SizedBox(
                                            height: 4,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 5, vertical: 3),
                                            child: heading(car.plate),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ))
                          .toList(),
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}

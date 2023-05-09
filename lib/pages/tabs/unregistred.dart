// ignore_for_file: implementation_imports

import 'package:cardscanner/controller/cars_controller.dart';
import 'package:cardscanner/pages/widgets/avatar.dart';
import 'package:cardscanner/pages/widgets/heading.dart';
import 'package:cardscanner/pages/widgets/hint.dart';
import 'package:cardscanner/pages/widgets/paragraph.dart';
import 'package:cardscanner/utils/pictures.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:get/get.dart';

class Unregistred extends StatelessWidget {
  const Unregistred({super.key});

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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          heading("Unregistered"),
                          hint(
                              "Total unregistred cars: ${find.cars.where((element) => element.registred == false).length}")
                        ],
                      ),
                      GestureDetector(
                          onTap: () {
                            find.deleteCard();
                          },
                          child: avatar(tanzania))
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
                          .where((element) => element.registred == false)
                          .toList()
                          .map((car) => Padding(
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
                                        CachedNetworkImage(imageUrl: car.image),
                                        const SizedBox(
                                          height: 4,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 5, vertical: 3),
                                          child: heading(car.plate),
                                        ),
                                        const SizedBox(
                                          height: 2,
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            car.registred = true;
                                            car.updateCar();
                                          },
                                          child: Container(
                                            color: Colors.blue,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 2,
                                                      horizontal: 5),
                                              child: Center(
                                                child: paragraph("Register",
                                                    color: Colors.white),
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
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

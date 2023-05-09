// ignore_for_file: implementation_imports, unnecessary_import, unused_import

import 'package:cardscanner/controller/client_controller.dart';
import 'package:cardscanner/pages/widgets/avatar.dart';
import 'package:cardscanner/pages/widgets/heading.dart';
import 'package:cardscanner/pages/widgets/paragraph.dart';
import 'package:cardscanner/utils/pictures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
      child: Column(
        children: [
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  heading("Dashboard"),
                ],
              ),
              const Spacer(),
              GestureDetector(
                onTap: () {
                  ClientController().logout();
                },
                child: Row(
                  children: [
                    const Icon(
                      Icons.power,
                      color: Colors.red,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    heading("Logout", color: Colors.red, size: 12),
                    const SizedBox(
                      width: 10,
                    ),
                  ],
                ),
              ),
              GestureDetector(
                  onTap: () {
                    // find.deleteCard();
                  },
                  child: avatar(tanzania))
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  color: Colors.amber.withOpacity(0.6),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 50),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.edgesensor_high,
                          color: Colors.black,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        heading("90", size: 40),
                        const SizedBox(
                          height: 10,
                        ),
                        paragraph("Passed cars today")
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                child: Container(
                  color: Colors.green.withOpacity(0.6),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 50),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.edgesensor_high,
                          color: Colors.black,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        heading("120", size: 40),
                        const SizedBox(
                          height: 10,
                        ),
                        paragraph("Staff registred cars")
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                child: Container(
                  color: Colors.blue.withOpacity(0.6),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 50),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.edgesensor_high,
                          color: Colors.black,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        heading("24", size: 40),
                        const SizedBox(
                          height: 10,
                        ),
                        paragraph("Total unregistred cars")
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                child: Container(
                  color: Colors.red.withOpacity(0.6),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 50),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.accessible_forward_sharp,
                          color: Colors.black,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        heading("27", size: 40),
                        const SizedBox(
                          height: 10,
                        ),
                        paragraph("Non stuff registered cars")
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

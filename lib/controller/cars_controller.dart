// ignore_for_file: avoid_print

import 'package:cardscanner/models/cars.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class CarsController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  Rx<List<Car>> carsReceiver = Rx<List<Car>>([]);
  List<Car> get cars => carsReceiver.value;

  @override
  void onInit() {
    carsReceiver.bindStream(getCars());
    super.onInit();
  }

  void updateCar(Car car) async {
    try {
      await firestore.collection("cars").doc(car.id).update({
        "registred": car.registred,
      });
      Get.back();
    } catch (e) {
      print(e);
    }
  }

  void deleteCard() async {
    try {
      await firestore.collection("cars").doc("ENRe7mcT6nwoytUakbUr").delete();
    } catch (e) {
      print(e);
    }
  }

  Stream<List<Car>> getCars() {
    return firestore
        .collection("cars")
        .snapshots()
        .map((QuerySnapshot querySnapshot) {
      List<Car> cars = [];
      for (var element in querySnapshot.docs) {
        cars.add(Car.fromDocumentSnapshot(element));
      }
      return cars;
    });
  }
}

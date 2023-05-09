import 'package:cardscanner/controller/cars_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Car {
  late String plate;
  late String image;
  late String name;
  late String profile;
  late String phone;
  late bool registred;
  late String id;
  void updateCar() {
    CarsController().updateCar(this);
  }

  Car();
  Car.fromDocumentSnapshot(DocumentSnapshot documentSnapshot) {
    plate = documentSnapshot['plate'];
    image = documentSnapshot['image'];
    profile = documentSnapshot['profile'];
    name = documentSnapshot['name'];
    phone = documentSnapshot['phone'];
    registred = documentSnapshot['registred'];
    id = documentSnapshot['id'];
  }
}

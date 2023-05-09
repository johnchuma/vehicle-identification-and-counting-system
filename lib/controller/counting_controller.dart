import 'package:cardscanner/models/counting.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class CountingController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  Rx<List<Counting>> carsReceiver = Rx<List<Counting>>([]);
  List<Counting> get cars => carsReceiver.value;

  @override
  void onInit() {
    carsReceiver.bindStream(getCars());
    super.onInit();
  }

  Stream<List<Counting>> getCars() {
    return firestore
        .collection("counting")
        .snapshots()
        .map((QuerySnapshot querySnapshot) {
      List<Counting> cars = [];
      for (var element in querySnapshot.docs) {
        cars.add(Counting.fromDocumentSnapshot(element));
      }
      return cars;
    });
  }
}

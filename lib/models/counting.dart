import 'package:cloud_firestore/cloud_firestore.dart';

class Counting {
  late String plate;
  late String image;
  late Timestamp date;

  Counting();
  Counting.fromDocumentSnapshot(DocumentSnapshot documentSnapshot) {
    plate = documentSnapshot['plate'];
    image = documentSnapshot['image'];
    date = documentSnapshot['date'];
  }
}

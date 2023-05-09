import 'package:cloud_firestore/cloud_firestore.dart';

class Client {
  late String email;
  late String uuid;
  late String password;

  Client(this.email, this.uuid, this.password);
  Client.fromDocumentSnapshot(DocumentSnapshot documentSnapshot) {
    email = documentSnapshot['email'];
    uuid = documentSnapshot['uuid'];
    password = documentSnapshot['password'];
  }
}

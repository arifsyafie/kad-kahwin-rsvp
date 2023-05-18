import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseApi {
  // retrieve list of rsvp
  static final Stream<QuerySnapshot> rsvpStreamPerempuan =
      FirebaseFirestore.instance.collection('rsvp-perempuan').snapshots();

  // retrieve list of rsvp
  static final Stream<QuerySnapshot> rsvpStreamLelaki =
      FirebaseFirestore.instance.collection('rsvp-lelaki').snapshots();

  // retrieve list of wishes
  static final Stream<QuerySnapshot> ucapanStreamPerempuan =
      FirebaseFirestore.instance.collection('ucapan-perempuan').snapshots();

  // retrieve list of wishes
  static final Stream<QuerySnapshot> ucapanStreamLelaki =
      FirebaseFirestore.instance.collection('ucapan-lelaki').snapshots();
}

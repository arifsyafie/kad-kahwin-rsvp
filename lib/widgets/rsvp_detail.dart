import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../api/api.dart';
import '../models/models.dart';

class RSVPDetail extends StatelessWidget {
  RSVPDetail({Key? key, required this.isPerempuan}) : super(key: key);
  bool isPerempuan;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: isPerempuan
          ? FirebaseApi.rsvpStreamPerempuan
          : FirebaseApi.rsvpStreamLelaki,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CircularProgressIndicator(),
              SizedBox(height: 30.w),
              const Text('Harap maaf, sila cuba lagi nanti'),
            ],
          );
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        }

        int pax = 0;

        for (var a in snapshot.data!.docs) {
          RSVPFormModel data = RSVPFormModel.fromJson(
            a.data() as Map<String, dynamic>,
          );
          pax = pax + data.pax;
        }

        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Text(
                'JUMLAH RSVP - $pax',
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  width: 1,
                  color: Colors.grey,
                ), // Set the border properties
              ),
              margin: EdgeInsets.symmetric(horizontal: 20.w),
              child: Table(
                children: [
                  TableRow(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 1,
                            color: Colors.grey,
                          ), // Set the border properties
                        ),
                        child: Text(
                          'Name',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 1,
                            color: Colors.grey,
                          ), // Set the border properties
                        ),
                        child: Text(
                          'Pax',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  ...snapshot.data!.docs.reversed
                      .map((DocumentSnapshot document) {
                    RSVPFormModel data = RSVPFormModel.fromJson(
                      document.data() as Map<String, dynamic>,
                    );
                    return TableRow(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 1,
                              color: Colors.grey,
                            ), // Set the border properties
                          ),
                          child: Text(data.name),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 1,
                              color: Colors.grey,
                            ), // Set the border properties
                          ),
                          child: Text(data.pax.toString()),
                        ),
                      ],
                    );
                  }).toList(),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}

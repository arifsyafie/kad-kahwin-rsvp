import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../api/api.dart';
import '../models/models.dart';

class RSVPDetail extends StatefulWidget {
  RSVPDetail({Key? key, required this.isPerempuan}) : super(key: key);
  bool isPerempuan;

  @override
  State<RSVPDetail> createState() => _RSVPDetailState();
}

class _RSVPDetailState extends State<RSVPDetail> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: widget.isPerempuan
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
              margin: const EdgeInsets.symmetric(horizontal: 16),
              child: Table(
                border: TableBorder.all(), // Add a border to the entire table
                children: [
                  TableRow(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        child: const Center(
                          child: Text(
                            'Name',
                            style: TextStyle(fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(8),
                        child: const Center(
                          child: Text(
                            'Pax',
                            style: TextStyle(fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
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
                          padding: const EdgeInsets.all(8),
                          child: Center(
                            child: Text(
                              data.name,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(8),
                          child: Center(
                            child: Text(
                              data.pax.toString(),
                              textAlign: TextAlign.center,
                            ),
                          ),
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

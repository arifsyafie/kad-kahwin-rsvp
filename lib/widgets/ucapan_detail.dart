import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kad_kahwin/models/ucapan_form_model.dart';

import '../api/api.dart';

class UcapanDetail extends StatelessWidget {
  UcapanDetail({Key? key, required this.isPerempuan}) : super(key: key);
  bool isPerempuan;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: isPerempuan
          ? FirebaseApi.ucapanStreamPerempuan
          : FirebaseApi.ucapanStreamLelaki,
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

        return Column(
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  width: 1,
                  color: Colors.grey,
                ), // Set the border properties
              ),
              margin: const EdgeInsets.symmetric(horizontal: 16),
              child: Table(
                columnWidths: const {
                  0: FractionColumnWidth(0.33),
                  // First column with 1/3 width
                  1: FractionColumnWidth(0.67),
                  // Second column with 2/3 width
                },
                border: TableBorder.all(), // Add a border to the entire table
                children: [
                  TableRow(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(16),
                        child: const Center(
                          child: Text(
                            'Name',
                            style: TextStyle(fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(16),
                        child: const Center(
                          child: Text(
                            'Ucapan',
                            style: TextStyle(fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ],
                  ),
                  ...snapshot.data!.docs.reversed
                      .map((DocumentSnapshot document) {
                    UcapanFormModel data = UcapanFormModel.fromJson(
                      document.data() as Map<String, dynamic>,
                    );
                    return TableRow(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(16),
                          child: Center(
                            child: Text(
                              data.name,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(16),
                          child: Text(data.wish.toString()),
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

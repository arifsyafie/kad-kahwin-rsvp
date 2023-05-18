import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kad_kahwin/constants/constants.dart';
import 'package:kad_kahwin/widgets/ucapan_detail.dart';
import 'package:kad_kahwin/widgets/widgets.dart';

class UcapanPage extends StatefulWidget {
  const UcapanPage({Key? key}) : super(key: key);

  @override
  State<UcapanPage> createState() => _UcapanPageState();
}

class _UcapanPageState extends State<UcapanPage> {
  bool isPerempuan = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsConstant.appWhite,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 16.w),
            Center(
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 16.0, right: 8.0),
                      child: AppButtonWidget(
                        buttonTitle: 'Ucapan Ain',
                        buttonIcon: Icons.female,
                        buttonFunction: () {
                          setState(() {
                            isPerempuan = true;
                          });
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 16.0, left: 8.0),
                      child: AppButtonWidget(
                        buttonTitle: 'Ucapan Arif',
                        buttonIcon: Icons.male,
                        buttonFunction: () {
                          setState(() {
                            isPerempuan = false;
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.w),
            Text(
              isPerempuan ? 'UCAPAN AIN' : 'UCAPAN ARIF',
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            SizedBox(height: 16.w),
            UcapanDetail(
              isPerempuan: isPerempuan,
            ),
            SizedBox(height: 80.w)
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kad_kahwin/pages/rsvp_page.dart';
import 'package:kad_kahwin/pages/ucapan_page.dart';

import '../constants/constants.dart';
import '../widgets/widgets.dart';

class AppHomePage extends StatefulWidget {
  const AppHomePage({Key? key}) : super(key: key);

  @override
  State<AppHomePage> createState() => _AppHomePageState();
}

class _AppHomePageState extends State<AppHomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  bool isPerempuan = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsConstant.appWhite,
      body: Column(
        children: [
          const SizedBox(height: 32),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: AppButtonWidget(
              buttonTitle: 'Lihat RSVP',
              buttonIcon: Icons.calendar_month,
              buttonFunction: () {
                Get.to(const RsvpPage());
              },
              width: MediaQuery.of(context).size.width,
            ),
          ),
          const SizedBox(height: 32),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: AppButtonWidget(
              buttonTitle: 'Lihat Ucapan',
              buttonIcon: Icons.sticky_note_2_outlined,
              buttonFunction: () {
                Get.to(const UcapanPage());
              },
              width: MediaQuery.of(context).size.width,
            ),
          ),
          SizedBox(height: 80.w)
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 16.w),
            Center(
              child: Row(
                children: [
                  Expanded(
                    child: AppButtonWidget(
                      buttonTitle: 'JEMPUTAN AIN',
                      buttonIcon: Icons.female,
                      buttonFunction: () {
                        setState(() {
                          isPerempuan = true;
                        });
                      },
                    ),
                  ),
                  SizedBox(width: 16.w),
                  Expanded(
                    child: AppButtonWidget(
                      buttonTitle: 'JEMPUTAN ARIF',
                      buttonIcon: Icons.male,
                      buttonFunction: () {
                        setState(() {
                          isPerempuan = false;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.w),
            Text(
              isPerempuan ? 'JEMPUTAN AIN' : 'JEMPUTAN ARIF',
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            RSVPDetail(
              isPerempuan: isPerempuan,
            ),
            SizedBox(height: 80.w)
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppButtonWidget extends StatelessWidget {
  final String buttonTitle;
  final IconData buttonIcon;
  final VoidCallback buttonFunction;
  const AppButtonWidget({
    Key? key,
    required this.buttonTitle,
    required this.buttonIcon,
    required this.buttonFunction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.w),
          ),
          minimumSize: Size(140.w, 50.w),
        ),
        onPressed: () {
          buttonFunction();
        },
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(buttonTitle),
            SizedBox(width: 10.w),
            Icon(buttonIcon)
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppButtonWidget extends StatelessWidget {
  final String buttonTitle;
  final IconData buttonIcon;
  final VoidCallback buttonFunction;
  final double? width;

  const AppButtonWidget({
    Key? key,
    required this.buttonTitle,
    required this.buttonIcon,
    required this.buttonFunction,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          minimumSize:
              Size(width?.w ?? (MediaQuery.of(context).size.width), 75),
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

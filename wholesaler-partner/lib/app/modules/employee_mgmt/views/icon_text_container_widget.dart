import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IconTextContainer extends StatelessWidget {
  String title;
  IconData icon;

  IconTextContainer({required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              width: 40.w,
              height: 40.h,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Icon(icon),
            ),
            Icon(Icons.arrow_forward),
          ],
        ),
        SizedBox(height: 3.h),
        Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 10.sp),
        ),
      ],
    );
  }
}

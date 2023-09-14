import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:versewave/config/theme/text_styles.dart';

class ParagraphContainer extends StatelessWidget {
  const ParagraphContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Welcom to versewave",
          style: headerTextStyle,
        ),
        SizedBox(
          height: 16.h,
        ),
        Text(
          "Sign up or log in below to access world-class journalism from premium publishers, curated by editors & experts.",
          style: normalTextStyle,
        ),
      ],
    );
  }
}

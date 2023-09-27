import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:versewave/config/theme/colors.dart';

class MyFaIcon extends StatelessWidget {
  final IconData icon;
  const MyFaIcon({super.key, required this.icon});

  @override
  Widget build(BuildContext context) {
    return FaIcon(
      icon,
      color: headerTextColor,
      size: 22.w,
    );
  }
}

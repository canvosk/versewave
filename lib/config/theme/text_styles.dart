import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:versewave/config/theme/colors.dart';

TextStyle headerTextStyle = TextStyle(fontSize: 24.sp, color: headerTextColor);
TextStyle normalTextStyle = TextStyle(fontSize: 14.sp, color: normalTextColor);
TextStyle? articleCardTitle(BuildContext context) =>
    Theme.of(context).textTheme.titleLarge?.copyWith(
          fontWeight: FontWeight.w400,
        );
TextStyle? articleCardDescription(BuildContext context) =>
    Theme.of(context).textTheme.labelLarge?.copyWith(
          color: normalTextColor,
        );
TextStyle? articleCardInfo(BuildContext context) =>
    Theme.of(context).textTheme.labelMedium?.copyWith(
          color: normalTextColor,
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.italic,
        );
TextStyle? goBackButtonText(BuildContext context) =>
    Theme.of(context).textTheme.titleMedium?.copyWith(
          color: headerTextColor,
        );

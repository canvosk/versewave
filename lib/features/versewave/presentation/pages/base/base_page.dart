import 'package:flutter/material.dart';

import '../../../../../config/theme/colors.dart';

class BasePage extends StatelessWidget {
  final Widget page;
  const BasePage({super.key, required this.page});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: bgColor,
      child: SafeArea(
        child: Scaffold(
          body: page,
        ),
      ),
    );
  }
}

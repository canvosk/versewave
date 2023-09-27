import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:versewave/config/theme/text_styles.dart';
import 'package:versewave/features/versewave/presentation/widgets/my_fa_icon.dart';

class MyBackButton extends StatelessWidget {
  const MyBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: () => context.pop(),
      icon: const MyFaIcon(
        icon: FontAwesomeIcons.chevronLeft,
      ),
      label: Text(
        "Back",
        style: goBackButtonText(context),
      ),
    );
  }
}

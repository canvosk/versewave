import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:versewave/features/versewave/presentation/widgets/back_button.dart';
import 'package:versewave/features/versewave/presentation/widgets/saved_article_list.dart';

class SavedArticles extends StatelessWidget {
  const SavedArticles({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyBackButton(),
          Expanded(
            child: SavedArticleList(),
          ),
        ],
      ),
    );
  }
}

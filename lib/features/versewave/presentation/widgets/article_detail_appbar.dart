import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:versewave/features/versewave/domain/entities/article.dart';
import 'package:versewave/features/versewave/presentation/provider/article/local/local_save_article_provider.dart';
import 'package:versewave/features/versewave/presentation/widgets/back_button.dart';
import 'package:versewave/features/versewave/presentation/widgets/my_fa_icon.dart';

class ArticleDetailAppBar extends StatelessWidget {
  final ArticleEntity article;
  const ArticleDetailAppBar({
    super.key,
    required this.article,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const MyBackButton(),
          Row(
            children: [
              SavedButton(
                article: article,
              ),
              IconButton(
                onPressed: () {},
                icon: const MyFaIcon(
                  icon: FontAwesomeIcons.arrowUpFromBracket,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class SavedButton extends ConsumerWidget {
  final ArticleEntity article;
  const SavedButton({super.key, required this.article});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return IconButton(
      onPressed: () {
        //save article
        ref.read(saveArticleFutureProvider(article));
        return;
      },
      icon: const MyFaIcon(
        icon: FontAwesomeIcons.bookmark,
      ),
    );
  }
}

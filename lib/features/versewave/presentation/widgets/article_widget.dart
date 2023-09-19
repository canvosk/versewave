import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:versewave/config/theme/colors.dart';
import 'package:versewave/config/theme/text_styles.dart';
import 'package:versewave/core/usecases/convert_published_at.dart';
import 'package:versewave/features/versewave/domain/entities/article.dart';

class ArticleWidget extends StatelessWidget {
  final ArticleEntity article;
  const ArticleWidget({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
      child: Column(
        children: [
          ArticleTileImage(article: article),
          SizedBox(
            height: 16.h,
          ),
          Text(article.title!, style: articleCardTitle(context)),
          SizedBox(
            height: 12.h,
          ),
          Text(
            article.description!,
            style: articleCardDescription(context),
          ),
          SizedBox(
            height: 8.h,
          ),
          ArticleTileInfo(article: article),
        ],
      ),
    );
  }
}

class ArticleTileImage extends StatelessWidget {
  const ArticleTileImage({
    super.key,
    required this.article,
  });

  final ArticleEntity article;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: article.urlToImage!,
      imageBuilder: (context, imageProvider) => Container(
        width: MediaQuery.of(context).size.width,
        height: 280.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14.w),
          image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
        ),
      ),
      progressIndicatorBuilder: (context, url, downloadProgress) =>
          const CupertinoActivityIndicator(),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }
}

class ArticleTileInfo extends StatelessWidget {
  const ArticleTileInfo({
    super.key,
    required this.article,
  });

  final ArticleEntity article;

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        children: [
          SizedBox(
            width: 150.w,
            child: Text(
              article.author != "" ? article.author! : "Unknown",
              style: articleCardInfo(context),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const VerticalDivider(
            color: headerTextColor,
            width: 10,
            indent: 4,
            endIndent: 4,
            thickness: 1,
          ),
          Text(
            convertPublishedAt(article.publishedAt!),
            style: articleCardInfo(context),
          ),
        ],
      ),
    );
  }
}

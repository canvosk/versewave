import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:versewave/config/theme/text_styles.dart';
import 'package:versewave/features/versewave/domain/entities/article.dart';
import 'package:versewave/features/versewave/presentation/widgets/article_detail_appbar.dart';

class ArticleDetail extends StatelessWidget {
  final ArticleEntity article;
  const ArticleDetail({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ArticleDetailAppBar(
            article: article,
          ),
          SizedBox(
            height: 16.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              children: [
                CachedNetworkImage(
                  imageUrl: article.urlToImage!,
                  imageBuilder: (context, imageProvider) => Container(
                    width: MediaQuery.of(context).size.width,
                    height: 240.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14.w),
                      image: DecorationImage(
                          image: imageProvider, fit: BoxFit.cover),
                    ),
                  ),
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      const CupertinoActivityIndicator(),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
                SizedBox(
                  height: 16.h,
                ),
                Text(
                  article.title!,
                  style: articleCardTitle(context),
                ),
                SizedBox(
                  height: 16.h,
                ),
                Text(
                  article.content!,
                  style: articleCardDescription(context),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

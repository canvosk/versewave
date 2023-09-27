import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:versewave/config/constants/constants.dart';
import 'package:versewave/config/theme/colors.dart';
import 'package:versewave/config/theme/text_styles.dart';
import 'package:versewave/features/versewave/presentation/provider/article/remote/remote_get_article_provider.dart';

import '../../widgets/article_widget.dart';

class DailyNews extends StatelessWidget {
  const DailyNews({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          appName,
          style: articleCardTitle(context),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 16.w),
            child: Center(
              child: GestureDetector(
                onTap: () {
                  context.push("/savedArticles");
                },
                child: const FaIcon(
                  FontAwesomeIcons.solidBookmark,
                  color: headerTextColor,
                ),
              ),
            ),
          ),
        ],
      ),
      body: const NewsList(),
    );
  }
}

class NewsList extends ConsumerWidget {
  const NewsList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final articleFuture = ref.watch(remoteGetArticleFutureProvider);
    return articleFuture.when(
      loading: () => const Center(child: CupertinoActivityIndicator()),
      error: (err, stack) => const Text("Error loading joke"),
      data: (article) {
        return article.data!.isNotEmpty
            ? ListView.separated(
                itemCount: article.data!.length,
                separatorBuilder: (context, i) {
                  return Container(
                    color: Colors.black,
                  );
                },
                itemBuilder: (context, index) {
                  return article.data![index].title! == removedText
                      ? Container()
                      : GestureDetector(
                          onTap: () {
                            context.push("/articleDetail",
                                extra: article.data![index]);
                          },
                          child: ArticleWidget(
                            article: article.data![index],
                          ),
                        );
                },
              )
            : const Text("Error loading joke");
      },
    );
  }
}

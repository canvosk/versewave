import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:go_router/go_router.dart';
import 'package:versewave/features/versewave/presentation/provider/article/local/local_get_saved_article_provider.dart';
import 'package:versewave/features/versewave/presentation/provider/article/local/local_remove_article_provider.dart';
import 'package:versewave/features/versewave/presentation/widgets/article_widget.dart';

class SavedArticleList extends ConsumerWidget {
  const SavedArticleList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final savedArticleFuture = ref.watch(localGetSavedArticleFutureProvider);
    return savedArticleFuture.when(
      loading: () => const Center(child: CupertinoActivityIndicator()),
      error: (err, stack) => const Center(child: Icon(Icons.error)),
      data: (article) {
        return article.isNotEmpty
            ? ListView.separated(
                itemCount: article.length,
                separatorBuilder: (context, i) {
                  return Container(
                    color: Colors.black,
                  );
                },
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      context.push("/articleDetail", extra: article[index]);
                    },
                    child: Slidable(
                      key: UniqueKey(),
                      endActionPane: ActionPane(
                        extentRatio: 0.3,
                        motion: const ScrollMotion(),
                        dismissible: DismissiblePane(
                          onDismissed: () {
                            ref.read(removeArticleFutureProvider(article[index]));
                            ref.watch(localGetSavedArticleFutureProvider);
                          },
                        ),
                        children: [
                          SlidableAction(
                            onPressed: (context) {
                              ref.read(removeArticleFutureProvider(article[index]));
                              ref.watch(localGetSavedArticleFutureProvider);
                            },
                            backgroundColor: const Color(0xFFFE4A49),
                            foregroundColor: Colors.white,
                            icon: Icons.delete,
                          )
                        ],
                      ),
                      child: ArticleWidget(
                        article: article[index],
                      ),
                    ),
                  );
                },
              )
            : const Center(child: Text("Kaydedilmiş makale bulunamadı."));
      },
    );
  }
}

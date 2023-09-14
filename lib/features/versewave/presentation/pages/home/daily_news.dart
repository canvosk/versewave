import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:versewave/core/resources/data_state.dart';
import 'package:versewave/features/versewave/domain/entities/article.dart';
import 'package:versewave/features/versewave/presentation/provider/article/remote/remote_get_article_provider.dart';
import 'package:versewave/injection_container.dart';

class DailyNews extends StatelessWidget {
  const DailyNews({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Daily News"),
      ),
      body: const NewsList(),
    );
  }
}

final remoteGetArticleFutureProvider =
    FutureProvider<DataState<List<ArticleEntity>>>((ref) async {
  final articleNotifier = ArticleNotifier(ref, getArticleUseCase: sl());
  return await articleNotifier.remoteGetArticle();
});

class NewsList extends ConsumerWidget {
  const NewsList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final articleFuture = ref.watch(remoteGetArticleFutureProvider);
    return articleFuture.when(
      loading: () => const Text("Loading..."),
      error: (err, stack) => const Text("Error loading joke"),
      data: (article) {
        return Column(children: [
          Text(article.data?.first.title ?? ""),
          Text(article.data?.first.description ?? ""),
        ]);
      },
    );
  }
}

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:versewave/core/resources/data_state.dart';
import 'package:versewave/features/versewave/domain/entities/article.dart';
import 'package:versewave/features/versewave/domain/usecases/get_article.dart';
import 'package:versewave/injection_container.dart';

class ArticleNotifier extends StateNotifier {
  final GetArticleUseCase getArticleUseCase;

  ArticleNotifier(super.state, {required this.getArticleUseCase});

  Future<DataState<List<ArticleEntity>>> remoteGetArticle() async {
    return await getArticleUseCase.call();
  }
}

final remoteGetArticleFutureProvider =
    FutureProvider<DataState<List<ArticleEntity>>>((ref) async {
  final articleNotifier = ArticleNotifier(ref, getArticleUseCase: sl());
  return await articleNotifier.remoteGetArticle();
});

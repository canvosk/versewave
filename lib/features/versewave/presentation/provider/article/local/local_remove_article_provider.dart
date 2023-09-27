import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:versewave/features/versewave/domain/entities/article.dart';
import 'package:versewave/features/versewave/domain/usecases/remove_article.dart';
import 'package:versewave/injection_container.dart';

class RemoveArticleNotifier extends StateNotifier {
  final RemoveArticleUseCase removeArticleUseCase;

  RemoveArticleNotifier(super.state, {required this.removeArticleUseCase});

  Future<void> removeArticle(ArticleEntity entity) async {
    return removeArticleUseCase.call(params: entity);
  }
}

final removeArticleFutureProvider =
    FutureProvider.family<void, ArticleEntity>((ref, entity) async {
  final saveArticleNotifier =
      RemoveArticleNotifier(ref, removeArticleUseCase: sl());
  return await saveArticleNotifier.removeArticle(entity);
});

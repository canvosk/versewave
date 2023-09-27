import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:versewave/features/versewave/domain/entities/article.dart';
import 'package:versewave/features/versewave/domain/usecases/save_article.dart';
import 'package:versewave/injection_container.dart';

class SaveArticleNotifier extends StateNotifier {
  final SaveArticleUseCase saveArticleUseCase;

  SaveArticleNotifier(super.state, {required this.saveArticleUseCase});

  Future<void> saveArticle(ArticleEntity entity) async {
    return saveArticleUseCase.call(params: entity);
  }
}

final saveArticleFutureProvider =
    FutureProvider.family<void, ArticleEntity>((ref, entity) async {
  final saveArticleNotifier =
      SaveArticleNotifier(ref, saveArticleUseCase: sl());
      
  return await saveArticleNotifier.saveArticle(entity);
});

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:versewave/features/versewave/domain/entities/article.dart';
import 'package:versewave/features/versewave/domain/usecases/get_saved_article.dart';
import 'package:versewave/injection_container.dart';

class GetSavedArticleNotifier extends StateNotifier {
  final GetSavedArticleUseCase getSavedArticleUseCase;

  GetSavedArticleNotifier(super.state, {required this.getSavedArticleUseCase});

  Future<List<ArticleEntity>> getSavedArticle() async {
    return getSavedArticleUseCase.call();
  }
}

final localGetSavedArticleFutureProvider =
    FutureProvider<List<ArticleEntity>>((ref) async {
  final getSavedArticleNotifier =
      GetSavedArticleNotifier(ref, getSavedArticleUseCase: sl());
     List<ArticleEntity> articles =  await getSavedArticleNotifier.getSavedArticle();
     debugPrint(articles.toString());
  return articles;
});

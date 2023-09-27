
import 'package:versewave/core/resources/data_state.dart';
import 'package:versewave/features/versewave/domain/entities/article.dart';

abstract class ArticleRepository{

  //API methods
  Future<DataState<List<ArticleEntity>>> getNewsArticles();

  //Database methods
  Future<List<ArticleEntity>> getSavedArticles();

  Future<void> savearticle(ArticleEntity entity);

  Future<void> removeArticle(ArticleEntity entity);
}
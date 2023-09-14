
import 'package:versewave/core/resources/data_state.dart';
import 'package:versewave/features/versewave/domain/entities/article.dart';

abstract class ArticleRepository{

  Future<DataState<List<ArticleEntity>>> getNewsArticles();
}
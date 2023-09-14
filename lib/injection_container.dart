import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:versewave/features/versewave/data/data_sources/remote/news_api_service.dart';
import 'package:versewave/features/versewave/data/repository/article_repository_impl.dart';
import 'package:versewave/features/versewave/domain/repository/article_repository.dart';
import 'package:versewave/features/versewave/domain/usecases/get_article.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  //Dio
  sl.registerSingleton<Dio>(Dio());

  //Dependencies
  sl.registerSingleton<NewsApiService>(NewsApiService(sl()));

  sl.registerSingleton<ArticleRepository>(
    ArticleRepositoryImpl(sl()),
  );

  //UseCases
  sl.registerSingleton<GetArticleUseCase>(
    GetArticleUseCase(sl()),
  );

}

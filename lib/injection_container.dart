import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:versewave/features/versewave/data/data_sources/local/app_database.dart';
import 'package:versewave/features/versewave/data/data_sources/remote/news_api_service.dart';
import 'package:versewave/features/versewave/data/repository/article_repository_impl.dart';
import 'package:versewave/features/versewave/domain/repository/article_repository.dart';
import 'package:versewave/features/versewave/domain/usecases/get_article.dart';
import 'package:versewave/features/versewave/domain/usecases/get_saved_article.dart';
import 'package:versewave/features/versewave/domain/usecases/remove_article.dart';
import 'package:versewave/features/versewave/domain/usecases/save_article.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {

  final database = await $FloorAppDatabase.databaseBuilder("app_database.db").build();
  sl.registerSingleton<AppDatabase>(database);

  //Dio
  sl.registerSingleton<Dio>(Dio());

  //Dependencies
  sl.registerSingleton<NewsApiService>(NewsApiService(sl()));

  sl.registerSingleton<ArticleRepository>(
    ArticleRepositoryImpl(sl(),sl()),
  );

  //UseCases
  sl.registerSingleton<GetArticleUseCase>(
    GetArticleUseCase(sl()),
  );

  sl.registerSingleton<GetSavedArticleUseCase>(
    GetSavedArticleUseCase(sl())
  );

  sl.registerSingleton<SaveArticleUseCase>(
    SaveArticleUseCase(sl())
  );

  sl.registerSingleton<RemoveArticleUseCase>(
    RemoveArticleUseCase(sl())
  );

}

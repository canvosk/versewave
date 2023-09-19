
import 'package:floor/floor.dart';
import 'package:versewave/features/versewave/data/data_sources/local/DAO/article_dao.dart';
import 'package:versewave/features/versewave/data/models/article.dart';
part 'app_database.g.dart';

@Database(version: 1, entities: [ArticleModel])
abstract class AppDatabase extends FloorDatabase{
  ArticleDao get articleDAO;
}
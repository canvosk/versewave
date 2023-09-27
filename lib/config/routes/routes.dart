import 'package:go_router/go_router.dart';
import 'package:versewave/features/versewave/domain/entities/article.dart';
import 'package:versewave/features/versewave/presentation/pages/base/base_page.dart';
import 'package:versewave/features/versewave/presentation/pages/home/daily_news.dart';
import 'package:versewave/features/versewave/presentation/pages/saved_articles/saved_article.dart';
import 'package:versewave/features/versewave/presentation/pages/splashscreen/splashscreen.dart';
import 'package:versewave/features/versewave/presentation/widgets/article_detail.dart';

final GoRouter routes = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const MySplashScreen(),
    ),
    GoRoute(
      path: "/dailyNews",
      builder: (context, state) => const BasePage(page: DailyNews()),
    ),
    GoRoute(
      path: "/articleDetail",
      builder: (context, state) {
        ArticleEntity articleEntity = state.extra as ArticleEntity;
        return BasePage(
          page: ArticleDetail(
            article: articleEntity,
          ),
        );
      },
    ),
    GoRoute(
      path: "/savedArticles",
      builder: (context, state) => const BasePage(page: SavedArticles()),
    ),
  ],
);

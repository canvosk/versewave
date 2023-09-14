import 'package:go_router/go_router.dart';
import 'package:versewave/features/versewave/presentation/pages/base/base_page.dart';
import 'package:versewave/features/versewave/presentation/pages/home/daily_news.dart';
import 'package:versewave/features/versewave/presentation/pages/membership/login/loginpage_imports.dart';
import 'package:versewave/features/versewave/presentation/pages/splashscreen/splashscreen.dart';

final GoRouter routes = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const MySplashScreen(),
    ),
    GoRoute(
      path: "/login",
      builder: (context, state) => const BasePage(page: LoginPage()),
    ),
    GoRoute(
      path: "/dailyNews",
      builder: (context, state) => const BasePage(page: DailyNews()),
    ),
  ],
);

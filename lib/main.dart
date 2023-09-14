import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:versewave/config/routes/routes.dart';
import 'package:versewave/config/theme/app_theme.dart';
import 'package:versewave/injection_container.dart';

void main() async {
  await initializeDependencies();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp.router(
          routerConfig: routes,
          debugShowCheckedModeBanner: false,
          title: 'Material App',
          theme: theme(),
        );
      },
    );
  }
}

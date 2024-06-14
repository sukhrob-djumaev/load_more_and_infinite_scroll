import 'package:flutter/material.dart';
import 'package:load_more_and_infinite_scroll/gen/assets.gen.dart';
import 'package:load_more_and_infinite_scroll/gen/fonts.gen.dart';

import 'shared/router/app_router.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  final _appRouter = AppRouter();
  MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _appRouter.config(),
      title: 'Load more and infinite scroll',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFFD577B),
          brightness: Brightness.light,
        ),
        brightness: Brightness.light,
        fontFamily: FontFamily.mulish,
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFFD577B),
          brightness: Brightness.dark,
        ),
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF0D0C11),
        appBarTheme: const AppBarTheme(
          color: Color(0xFF0D0C11),
          titleTextStyle: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
        iconButtonTheme: IconButtonThemeData(
          style: IconButton.styleFrom(
            backgroundColor: const Color(0x1AFFFFFF),
          ),
        ),
        actionIconTheme: ActionIconThemeData(
          backButtonIconBuilder: (context) => Assets.images.vector.arrowLeft.svg(),
        ),
      ),
      themeMode: ThemeMode.dark,
      debugShowCheckedModeBanner: false,
    );
  }
}

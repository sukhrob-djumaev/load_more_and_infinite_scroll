import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:load_more_and_infinite_scroll/gen/assets.gen.dart';
import 'package:load_more_and_infinite_scroll/gen/fonts.gen.dart';
import 'package:load_more_and_infinite_scroll/shared/services/database/database.dart';

import 'shared/router/app_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  final _appRouter = AppRouter();
  final _db = AppDatabase();

  @override
  void dispose() {
    _appRouter.dispose();
    _db.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: _db,
      child: MaterialApp.router(
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
      ),
    );
  }
}

import 'package:auto_route/auto_route.dart';

import '../../features/home/pages/home_page.dart';
import '../../features/movies/pages/movies_page.dart';
part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  final List<AutoRoute> routes = [
    AutoRoute(page: HomeRoute.page, initial: true),
    AutoRoute(page: MoviesRoute.page),
  ];
}

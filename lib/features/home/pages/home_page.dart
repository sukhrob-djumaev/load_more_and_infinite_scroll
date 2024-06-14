import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:load_more_and_infinite_scroll/shared/router/app_router.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              context.router.push(const MoviesRoute());
            },
            child: const Text('Movies')),
      ),
    );
  }
}

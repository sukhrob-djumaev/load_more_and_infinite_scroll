import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:load_more_and_infinite_scroll/shared/widgets/internet_connection_wrapper.dart';

@RoutePage()
class MainWrapperPage extends StatelessWidget implements AutoRouteWrapper {
  const MainWrapperPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const AutoRouter();
  }

  @override
  Widget wrappedRoute(BuildContext context) {
    return InternetConnectionWrapper(child: this);
  }
}

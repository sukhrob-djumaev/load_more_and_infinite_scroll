import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:load_more_and_infinite_scroll/features/movies/blocs/movies_bloc/movies_bloc.dart';
import 'package:load_more_and_infinite_scroll/features/movies/repositories/movies_repository.dart';
import 'package:load_more_and_infinite_scroll/shared/models/state_status/state_status.dart';

import '../../../gen/assets.gen.dart';
import '../widgets/movies_list_view.dart';

@RoutePage()
class MoviesPage extends StatelessWidget implements AutoRouteWrapper {
  const MoviesPage({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (context) => MoviesBloc(
          repository: MoviesRepository(
        connectionService: context.read(),
      ))
        ..add(const MoviesEvent.started()),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<MoviesBloc>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Picked for You'),
        actions: [
          SizedBox(
            width: 52,
            height: 52,
            child: IconButton(
              onPressed: () {},
              icon: Assets.images.vector.notification.svg(),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: BlocConsumer<MoviesBloc, MoviesState>(
            listener: (context, state) {
              if (state.status is ErrorStatus && (state.status as ErrorStatus).message != null) {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    content: Text((state.status as ErrorStatus).message!),
                  ),
                );
              }
            },
            builder: (context, state) {
              if (state.movies.isEmpty && state.status is LoadingStatus) {
                return const Center(child: CircularProgressIndicator());
              }
              return MoviesListView(
                list: state.movies,
                genres: state.genres,
                hasReachedMax: state.hasReachedMax,
                onMaxScrollExtent: () => bloc.add(const MoviesEvent.loadMoreRequested()),
              );
            },
          ),
        ),
      ),
    );
  }
}

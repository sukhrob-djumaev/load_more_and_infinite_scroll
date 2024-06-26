import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:load_more_and_infinite_scroll/shared/blocs/cubit/internet_connection_wrapper_cubit.dart';

import '../services/connection_service.dart';

class InternetConnectionWrapper extends StatelessWidget {
  final Widget child;
  const InternetConnectionWrapper({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider<IConnectionService>(
      create: (context) => ConnectionService(),
      child: BlocProvider(
        create: (context) => InternetConnectionWrapperCubit(
          service: context.read(),
        ),
        child: Builder(builder: (context) {
          return BlocListener<InternetConnectionWrapperCubit, bool?>(
            listener: (context, state) {
              if (state != null) {
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
                final message = state == true ? 'You are online' : 'No Internet connection';
                final textColor = state == true ? Colors.lightGreen : Colors.red;
                final snackbar = SnackBar(
                  content: Text(
                    message,
                    style: const TextStyle(color: Colors.white),
                  ),
                  backgroundColor: textColor,
                  action: SnackBarAction(
                    label: 'Dismiss',
                    textColor: Colors.white,
                    onPressed: () {
                      ScaffoldMessenger.of(context).hideCurrentSnackBar();
                    },
                  ),
                );
                ScaffoldMessenger.of(context).showSnackBar(snackbar);
              }
            },
            child: child,
          );
        }),
      ),
    );
  }
}

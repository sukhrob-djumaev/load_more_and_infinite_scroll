import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:load_more_and_infinite_scroll/shared/services/connection_service.dart';

class InternetConnectionWrapperCubit extends Cubit<bool?> {
  final IConnectionService _service;
  InternetConnectionWrapperCubit({
    required IConnectionService service,
  })  : _service = service,
        super(null) {
    _serviceListener = _service.onConnectionChange.listen((status) {
      emit(status);
    });
  }

  StreamSubscription<bool>? _serviceListener;

  @override
  Future<void> close() {
    _serviceListener?.cancel();
    return super.close();
  }
}

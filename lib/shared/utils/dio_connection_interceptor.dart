import 'package:dio/dio.dart';
import 'package:load_more_and_infinite_scroll/shared/models/exceptions/no_internet_exceptions.dart';

import 'package:load_more_and_infinite_scroll/shared/services/connection_service.dart';

class DioConnectionInterceptor extends Interceptor {
  final IConnectionService _connectionService;
  DioConnectionInterceptor({
    required IConnectionService connectionService,
  }) : _connectionService = connectionService;

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    final hasInternet = await _connectionService.hasInternet();
    if (!hasInternet) {
      throw NoInternetException();
    }
    super.onError(err, handler);
  }
}

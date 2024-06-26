import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

abstract interface class IConnectionService {
  Future<bool> hasInternet();

  Stream<bool> get onConnectionChange;
}

class ConnectionService implements IConnectionService {
  late final InternetConnection _connection;

  ConnectionService() {
    _connection = InternetConnection();
  }

  @override
  Future<bool> hasInternet() async {
    return await _connection.hasInternetAccess;
  }

  @override
  Stream<bool> get onConnectionChange => _connection.onStatusChange.map(
        (internetStatus) => internetStatus == InternetStatus.connected,
      );
}

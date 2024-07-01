# Enhancing App Connectivity with Flutter: Real-time Internet Status Monitoring

In today's interconnected world, maintaining a reliable internet connection is crucial for app users. This article explores how to integrate real-time internet connection monitoring into Flutter applications using the `internet_connection_checker_plus` package. By implementing a robust service and UI wrapper, developers can enhance user experience by providing immediate feedback on connectivity status changes.

[https://youtube.com/shorts/IXqomMweAOs](https://youtube.com/shorts/IXqomMweAOs)


```dart
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
```
Next, we wrap our main route with `InternetConnectionWrapper`. This wrapper listens to changes in the connection service and displays a snackbar notification whenever the internet connection status changes. By integrating this wrapper, users are informed in real-time about their connectivity status, improving the app's usability in offline scenarios.

```dart
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
            listenWhen: (previous, current) => previous != null,
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
```
To ensure a clean separation between logic and UI, we handle the subscription within `InternetConnectionWrapperCubit`. This approach encapsulates the connection logic within a Cubit, making the UI code cleaner and more manageable. The Cubit subscribes to the connection changes and updates its state accordingly, which is then observed by the `InternetConnectionWrapper`.
```dart
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
```

Implementing real-time internet connection monitoring in Flutter applications is essential for ensuring a seamless user experience. By leveraging tools like `internet_connection_checker_plus` and encapsulating connection logic within Cubits, developers can create responsive apps that gracefully handle online and offline scenarios. This approach not only improves usability but also demonstrates best practices in Flutter app development.

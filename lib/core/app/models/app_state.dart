import '../enums.dart';

class AppState<T>{
  final AppLoadingState loadingState;
  final String? message;
  final T? data;

  AppState({
    required this.loadingState,
    this.message,
    this.data,
  });
}

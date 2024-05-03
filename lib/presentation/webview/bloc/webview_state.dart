part of 'webview_bloc.dart';

enum WebViewStatus {
  initial,
  loading,
  success,
  failure,
}

class WebViewState extends Equatable {
  final WebViewStatus status;
  final WebViewController? controller;

  const WebViewState({
    this.status = WebViewStatus.initial,
    this.controller,
  });

  WebViewState copyWith({
    WebViewStatus? status,
    WebViewController? controller,
  }) {
    return WebViewState(
      status: status ?? this.status,
      controller: controller,
    );
  }

  @override
  List<Object?> get props => [
        status,
        controller,
      ];
}

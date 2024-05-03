part of 'webview_bloc.dart';

sealed class WebViewEvent extends Equatable {
  const WebViewEvent();

  @override
  List<Object> get props => [];
}

final class WebViewInitController extends WebViewEvent {
  final String webviewUrl;

  const WebViewInitController({required this.webviewUrl});
}

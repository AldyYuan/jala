import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jala/presentation/webview/bloc/webview_bloc.dart';
import 'package:share_plus/share_plus.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewPage extends StatelessWidget {
  final String titlePage;
  final String webviewUrl;
  final String shareUrl;
  const WebViewPage({
    super.key,
    required this.titlePage,
    required this.webviewUrl,
    required this.shareUrl,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WebViewBloc()..add(WebViewInitController(webviewUrl: webviewUrl)),
      child: BlocBuilder<WebViewBloc, WebViewState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: Text(titlePage),
              actions: [
                IconButton(
                  onPressed: () {
                    Share.shareUri(Uri.parse(shareUrl));
                  },
                  icon: const Icon(Icons.share_rounded),
                ),
              ],
            ),
            body: state.status == WebViewStatus.initial || state.status == WebViewStatus.loading
                ? const LinearProgressIndicator()
                : WebViewWidget(controller: state.controller!),
          );
        },
      ),
    );
  }
}

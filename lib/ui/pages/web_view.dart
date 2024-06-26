import 'package:app_news/ui/web_view/web_view_controller.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebView extends StatefulWidget {
  static const String routeName = "web_view";
  WebView({super.key, required this.news});
  String news;

  @override
  State<WebView> createState() => _WebViewAppState();
}
class _WebViewAppState extends State<WebView> {
  late final WebViewController controller;
  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..loadRequest(
        Uri.parse(widget.news),
      );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WebViewStack(controller: controller), // MODIFY
    );
  }
}

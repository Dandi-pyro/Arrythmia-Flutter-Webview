import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'src/navigation_controls.dart';
import 'src/web_view_stack.dart';

void main() {
  runApp(
    const MaterialApp(
      home: WebViewApp(),
    ),
  );
}

class WebViewApp extends StatefulWidget {
  const WebViewApp({super.key});

  @override
  State<WebViewApp> createState() => _WebViewAppState();
}

class _WebViewAppState extends State<WebViewApp> {
  late final WebViewController controller;

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(
        Uri.parse('https://arrhythmia-monitoring-new.vercel.app/'),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Arrhythmia'),
        actions: [
          NavigationControls(controller: controller),
        ],
      ),
      body: WebViewStack(controller: controller),
    );
  }
}

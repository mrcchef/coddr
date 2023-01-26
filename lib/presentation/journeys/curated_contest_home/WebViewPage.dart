import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewPage extends StatefulWidget {
  static const routeName = '/codeforces_website';

  const WebViewPage({Key key}) : super(key: key);

  @override
  _WebViewPageState createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
  final _controller = Completer<WebViewController>();

  WebViewController webViewController(String url) => WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..setBackgroundColor(const Color(0x00000000))
    ..setNavigationDelegate(
      NavigationDelegate(),
    )
    ..loadRequest(Uri.parse(url));

  @override
  Widget build(BuildContext context) {
    final arg = ModalRoute.of(context).settings.arguments as Map;
    String url = arg['url'];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue[100],
        foregroundColor: Colors.black,
        title: Center(child: Text("CodeForces")),
      ),
      body: WebViewWidget(controller: webViewController(url)),
      bottomNavigationBar: Container(
          color: Colors.lightBlue[100],
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              navigationButton(
                  Icons.chevron_left, (controller) => _goBack(controller)),
              navigationButton(
                  Icons.chevron_right, (controller) => _goForward(controller))
            ],
          )),
    );
  }

  Widget navigationButton(
      IconData icon, Function(WebViewController) onPressed) {
    return FutureBuilder(
      future: _controller.future,
      builder: (context, AsyncSnapshot<WebViewController> snapshot) {
        if (snapshot.hasData) {
          return IconButton(
            onPressed: () => onPressed(snapshot.data),
            icon: Icon(icon),
          );
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }

  void _goBack(WebViewController controller) async {
    final canGoBack = await controller.canGoBack();

    if (canGoBack) {
      controller.goBack();
    }
  }

  void _goForward(WebViewController controller) async {
    final canGoForward = await controller.canGoForward();

    if (canGoForward) {
      controller.goForward();
    }
  }
}

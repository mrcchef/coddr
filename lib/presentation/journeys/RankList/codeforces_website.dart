import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class CodeForcesWebsite extends StatefulWidget {
  static const routeName = '/codeforces_website';
  const CodeForcesWebsite({Key key}) : super(key: key);

  @override
  _CodeForcesWebsiteState createState() => _CodeForcesWebsiteState();
}

class _CodeForcesWebsiteState extends State<CodeForcesWebsite> {
  final _controller = Completer<WebViewController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue[100],
        foregroundColor: Colors.black,
        title: Center(child: Text("CodeForces")),
      ),
      body: WebView(
        initialUrl: "https://codeforces.com/contests",
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (controller) => _controller.complete(controller),
        //gestureRecognizers: Set()..add(Factory<>() => ),
      ),
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

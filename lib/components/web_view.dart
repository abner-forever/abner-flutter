import 'package:abner/utils/screen.dart';
import 'package:flutter/material.dart';
// import 'package:webview_flutter/webview_flutter.dart';

class FlutterWebView extends StatefulWidget {
  final String url;
  final bool hideHead;

  const FlutterWebView(
      {required Key key, required this.url, required this.hideHead})
      : super(key: key);
  @override
  _FlutterWebViewState createState() => _FlutterWebViewState();
}

class _FlutterWebViewState extends State<FlutterWebView> {
  String _title = '';

  // WebViewController _controller;

  @override
  void initState() {
    super.initState();
    print('FlutterWebView-initState');
  }

  @override
  Widget build(BuildContext context) {
    if (this.widget.hideHead) {
      return _content();
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff464646),
        title: Text(
          _title,
          style: TextStyle(color: Color(0xffffffff), fontSize: px(18)),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.chevron_left,
            color: Color(0xffffffff),
          ),
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Text('web-view'),
    );
  }

  Widget _content() {
    return Container(
      width: MediaQuery.of(context).size.width,
      color: Colors.white,
      child: Text('web-view'),
      // child: WebView(
      //     initialUrl: this.widget.url,
      //     javascriptMode: JavascriptMode.unrestricted,
      //     onWebViewCreated: (controller) {
      //       _controller = controller;
      //     },
      //     onPageFinished: (url) {
      //       _controller.evaluateJavascript("document.title").then((result) {
      //         setState(() {
      //           _title = result;
      //         });
      //       });
      //     }),
    );
  }
}

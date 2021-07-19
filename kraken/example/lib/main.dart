import 'package:flutter/material.dart';
import 'package:kraken/kraken.dart';
import 'package:kraken_websocket/kraken_websocket.dart';
import 'dart:ui';
import 'dart:isolate';
import 'package:kraken_example/mock_prescript.dart';
import 'package:kraken/dom.dart';

void main() {
  KrakenWebsocket.initialize();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kraken Browser',
      // theme: ThemeData.dark(),
      home: MyBrowser(title: "title",),
    );
  }
}

class MyBrowser extends StatefulWidget {
  MyBrowser({Key? key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String? title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyBrowser> {

  OutlineInputBorder outlineBorder = OutlineInputBorder(
    borderSide: BorderSide(color: Colors.transparent, width: 0.0),
    borderRadius: const BorderRadius.all(
      Radius.circular(20.0),
    ),
  );

  @override
  Widget build(BuildContext context) {
    final MediaQueryData queryData = MediaQuery.of(context);
    final TextEditingController textEditingController = TextEditingController();

    KrakenWidget _kraken;
    AppBar appBar = AppBar(
        backgroundColor: Colors.black87,
        titleSpacing: 10.0,
        title: Container(
          height: 40.0,
          child: TextField(
            controller: textEditingController,
            onSubmitted: (value) {
              textEditingController.text = value;
//              _kraken?.loadURL(value);
            },
            decoration: InputDecoration(
              hintText: 'Enter a app url',
              hintStyle: TextStyle(color: Colors.black54, fontSize: 16.0),
              contentPadding: const EdgeInsets.all(10.0),
              filled: true,
              fillColor: Colors.grey,
              border: outlineBorder,
              focusedBorder: outlineBorder,
              enabledBorder: outlineBorder,
            ),
            style: TextStyle(color: Colors.black, fontSize: 16.0),
          ),
        ),
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
      );

    int hash =  Isolate.current.hashCode;
    final Size viewportSize = queryData.size;
    return Scaffold(
        appBar: appBar,
        body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: _kraken = KrakenWidget(
          viewportWidth: viewportSize.width - queryData.padding.horizontal,
          viewportHeight: viewportSize.height - appBar.preferredSize.height - queryData.padding.vertical,
          onLoad: onJsBundleLoad,
          name: hash.toString(),
          // bundlePath: 'assets/bundle.js',
          // bundleURL: 'http://30.77.74.86:3000/build/demo.phone.init.js',
          // bundleURL: 'https://kraken.oss-cn-hangzhou.aliyuncs.com/data/youku.min.js',
          bundleURL: 'https://t.youku.com/yep/page/kraken/m/hlxjr7?wh_kraken=true&wh_weex=true&isNeedBaseImage=1&hideNavigatorBar=true',
          // bundleURL: 'https://t.youku.com/yep/page/kraken/m/cvd3r6f068?isNeedBaseImage=1&wh_kraken=true&wh_weex=true',
          // bundleURL: 'https://t.youku.com/yep/page/kraken/m/cvd3r6f068?isNeedBaseImage=1&wh_kraken=true&wh_weex=true',
          // bundleURL: 'https://pre.t.youku.com/yep/page/kraken/m_pre/l1y89glan0?isNeedBaseImage=1&env=pre',
          // bundleURL: 'http://30.77.74.135:3000/build/demo.phone.init.js',
          // bundleURL: 'http://30.77.74.135:3000/build/demo.init.js',
          // bundleURL: 'http://192.168.50.60:3333/kraken/index.js',
          // bundleURL: 'https://dev.g.alicdn.com/UniKraken/unikraken_rax_demos/0.0.2/kraken/index.js',
          // bundleURL: 'https://dev.g.alicdn.com/UniKraken/unikraken_rax_demos/0.0.2/kraken/platformview.js',
          // bundleURL: 'https://raw.githubusercontent.com/openkraken/kraken/master/kraken/example/assets/bundle.js',
        ),
    ));
  }
}

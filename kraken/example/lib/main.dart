import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:kraken/dom.dart';
import 'package:kraken/kraken.dart';
import 'package:kraken/rendering.dart';
import 'package:kraken_websocket/kraken_websocket.dart';
// import 'package:kraken_devtools/kraken_devtools.dart';
import 'dart:ui';

void main() {
  KrakenWebsocket.initialize();
  Kraken.defineCustomElement('flutter-text', (targetId, nativeEventTarget, elementManager) {
    return TextWidgetElement(targetId, nativeEventTarget, elementManager);
  });
  Kraken.defineCustomElement('demo-list', (targetId, nativeEventTarget, elementManager) {
    return DemoListWidgetElement(targetId, nativeEventTarget, elementManager);
  });
  runApp(MyApp());
}

class TextWidgetElement extends WidgetElement {
  TextWidgetElement(int targetId, Pointer<NativeEventTarget> nativeEventTarget, ElementManager elementManager) :
        super(targetId, nativeEventTarget, elementManager);

  @override
  Widget build(BuildContext context, Map<String, dynamic> properties, List<Widget> children) {
    return Text(properties['value'] ?? '11111', textDirection: TextDirection.ltr, style: TextStyle(color: Color.fromARGB(
        255, 100, 100, 100)));
  }
}

class DemoListWidgetElement extends WidgetElement {
  DemoListWidgetElement(int targetId, Pointer<NativeEventTarget> nativeEventTarget, ElementManager elementManager) :
        super(targetId, nativeEventTarget, elementManager);

  @override
  Widget build(BuildContext context, Map<String, dynamic> properties, List<Widget> children) {
    return ListView(
      children: children,
    );
  }
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kraken Browser',
      // theme: ThemeData.dark(),
      home: MyBrowser(),
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

  Kraken? _kraken;

  OutlineInputBorder outlineBorder = OutlineInputBorder(
    borderSide: BorderSide(color: Colors.transparent, width: 0.0),
    borderRadius: const BorderRadius.all(
      Radius.circular(20.0),
    ),
  );

  void _add() {
    TextNode textNode = TextNode(2050, Pointer<NativeEventTarget>.fromAddress(0x22222), 'Demo', _kraken!.controller!.view.elementManager);
    // textNode.parentElement = RegisterCenter.sharedInstance().
    RegisterCenter.sharedInstance().testElement!.appendChild(textNode);
  }

  void _delete() {
    RegisterCenter.sharedInstance().testElement!.removeChild(null);
  }

  @override
  Widget build(BuildContext context) {
    final MediaQueryData queryData = MediaQuery.of(context);
    final TextEditingController textEditingController = TextEditingController();


    AppBar appBar = AppBar(
        backgroundColor: Colors.black87,
        titleSpacing: 10.0,
        title: Container(
          height: 40.0,
          child: TextField(
            controller: textEditingController,
            onSubmitted: (value) {
              textEditingController.text = value;
              _kraken?.loadURL(value);
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

    final Size viewportSize = queryData.size;
    return Scaffold(
        appBar: appBar,
        body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: _kraken = Kraken(
          // devToolsService: ChromeDevToolsService(),
          viewportWidth: viewportSize.width - queryData.padding.horizontal,
          viewportHeight: viewportSize.height - appBar.preferredSize.height - queryData.padding.vertical,
          bundleURL: 'assets/bundle.js',
        ),
      ),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            onPressed: _add,
            tooltip: 'Increment',
            child: Icon(Icons.add),
          ),
          FloatingActionButton(
            onPressed: _delete,
            tooltip: 'Increment',
            child: Icon(Icons.delete),
          )
        ],
      ),
    );
  }
}

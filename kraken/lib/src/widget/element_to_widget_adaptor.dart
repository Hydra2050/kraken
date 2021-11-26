import 'package:flutter/widgets.dart';
import 'package:kraken/dom.dart' as dom;

class KrakenElementToWidgetAdaptor extends RenderObjectWidget {
  final dom.Node _krakenNode;

  KrakenElementToWidgetAdaptor(this._krakenNode);

  @override
  RenderObjectElement createElement() {
    return KrakenElementToFlutterElementAdaptor(this);
  }

  @override
  RenderObject createRenderObject(BuildContext context) {
    return _krakenNode.renderer!;
  }
}

class KrakenElementToFlutterElementAdaptor extends RenderObjectElement {
  KrakenElementToFlutterElementAdaptor(RenderObjectWidget widget) : super(widget);

  @override
  KrakenElementToWidgetAdaptor get widget => super.widget as KrakenElementToWidgetAdaptor;

  @override
  void mount(Element? parent, Object? newSlot) {
    widget._krakenNode.createRenderer();
    super.mount(parent, newSlot);
    widget._krakenNode.ensureChildAttached();
    if (widget._krakenNode is dom.Element) {
      (widget._krakenNode as dom.Element).style.flushPendingProperties();
    }
  }
}
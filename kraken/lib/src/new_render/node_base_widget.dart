import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:kraken/src/new_render/register_center.dart';
import 'package:vector_math/vector_math.dart';

import '../../dom.dart' as dom;

class CssBaseWidget extends RenderObjectWidget {
  const CssBaseWidget({Key? key, required this.nodeData}) : super(key: key);

  final dom.Node nodeData;
  @override
  RenderObjectElement createElement() {
    // TODO: implement createElement
    throw UnimplementedError();
  }

  @override
  RenderObject createRenderObject(BuildContext context) {
    // TODO: implement createRenderObject
    throw UnimplementedError();
  }
}

class CssBaseRenderObjectElement extends RenderObjectElement {
  CssBaseRenderObjectElement(RenderObjectWidget widget) : super(widget);
}

class CssBaseLeafWidget extends CssBaseWidget {
  CssBaseLeafWidget({Key? key, required dom.Node nodeData})
      : super(key: key, nodeData: nodeData);

  @override
  CssBaseLeafElement createElement() {
    return CssBaseLeafElement(this);
  }

  @override
  RenderObject createRenderObject(BuildContext context) {
    // TODO: implement createRenderObject
    return nodeData.createRenderer();
  }
}

class CssBaseLeafElement extends CssBaseRenderObjectElement implements DomApi {
  CssBaseLeafElement(CssBaseLeafWidget widget) : super(widget);

  @override
  void appendChild(dom.Node nodeBase) {
    // TODO: implement appendChild
  }

  @override
  void removeChild(dom.Node? nodeBase) {
    // TODO: implement removeChild
  }

  @override
  void updateStyle() {
    // TODO: implement updateStyle
  }
}

/*
CssBaseSingle
* */

class CssBaseSingleWidget extends CssBaseWidget {
  CssBaseSingleWidget({Key? key, this.child, required dom.Node nodeData})
      : super(key: key, nodeData: nodeData);

  final Widget? child;

  @override
  CssBaseSingleElement createElement() {
    return CssBaseSingleElement(this);
  }

  @override
  RenderObject createRenderObject(BuildContext context) {
    return nodeData.createRenderer();
  }
}

class CssBaseSingleElement extends CssBaseRenderObjectElement
    implements DomApi {
  CssBaseSingleElement(CssBaseSingleWidget widget) : super(widget);

  void mount(Element? parent, Object? newSlot) {
    // TODO: implement mount
    super.mount(parent, newSlot);
    (widget as CssBaseWidget).nodeData.flutterElement = this;
    (widget as CssBaseWidget).nodeData.didMount();
    RegisterCenter.sharedInstance().testElement = this;
  }

  @override
  void appendChild(dom.Node nodeBase) {
    // TODO: implement appendChild
  }

  @override
  void removeChild(dom.Node? nodeBase) {
    // TODO: implement removeChild
  }

  @override
  void updateStyle() {
    // TODO: implement updateStyle
  }
}

/*
CssBaseMultiWidget
* */

class CssBaseMultiWidget extends CssBaseWidget {
  CssBaseMultiWidget(
      {Key? key, required this.children, required dom.Node nodeData})
      : super(key: key, nodeData: nodeData);

  final List<Widget> children;

  @override
  RenderObject createRenderObject(BuildContext context) {
    return nodeData.createRenderer();
  }

  @override
  CssBaseMultiElement createElement() {
    return CssBaseMultiElement(this);
  }
}

class CssBaseMultiElement extends CssBaseRenderObjectElement implements DomApi {
  CssBaseMultiElement(CssBaseMultiWidget widget) : super(widget);

  void mount(Element? parent, Object? newSlot) {
    // TODO: implement mount
    super.mount(parent, newSlot);
    (widget as CssBaseWidget).nodeData.flutterElement = this;
    (widget as CssBaseWidget).nodeData.didMount();
    RegisterCenter.sharedInstance().testElement = this;
  }

  @override
  void appendChild(dom.Node nodeBase) {
    // TODO: implement appendChild
  }

  @override
  void removeChild(dom.Node? nodeBase) {
    // TODO: implement removeChild
  }

  @override
  void updateStyle() {
    // TODO: implement updateStyle
  }
}

mixin DomApi {
  void appendChild(dom.Node nodeBase);
  void removeChild(dom.Node? nodeBase);
  void updateStyle();
}

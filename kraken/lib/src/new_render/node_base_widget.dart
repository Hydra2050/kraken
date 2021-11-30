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

class CssBaseLeafElement extends CssBaseRenderObjectElement {
  CssBaseLeafElement(CssBaseLeafWidget widget) : super(widget);
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

class CssBaseSingleElement extends CssBaseRenderObjectElement {
  CssBaseSingleElement(CssBaseSingleWidget widget) : super(widget);
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

class CssBaseMultiElement extends CssBaseRenderObjectElement {
  CssBaseMultiElement(CssBaseMultiWidget widget) : super(widget);
}

mixin DomApi {
  void appendChild(dom.Node nodeBase);
  void removeChild(dom.Node? nodeBase);
}

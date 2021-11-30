import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:kraken/src/new_render/register_center.dart';

import '../../dom.dart' as dom;

mixin CssBaseWidget {
  late dom.Node nodeData;

}

class CssBaseLeafWidget extends LeafRenderObjectWidget implements CssBaseWidget {
  CssBaseLeafWidget({Key? key, required this.nodeData})
      : super(key: key) {

  }

  // final dom.Node nodeData;
  @override
  CssBaseLeafElement createElement() {
    return CssBaseLeafElement(this);
  }

  @override
  RenderObject createRenderObject(BuildContext context) {
    return nodeData.createRenderer();
  }

  @override
  dom.Node nodeData;
}

class CssBaseLeafElement extends LeafRenderObjectElement implements DomApi {
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

class CssBaseSingleWidget extends SingleChildRenderObjectWidget implements CssBaseWidget {
  CssBaseSingleWidget({Key? key, Widget? child, required this.nodeData})
      : super(key: key, child: child);


  @override
  CssBaseSingleElement createElement() {
    return CssBaseSingleElement(this);
  }

  @override
  RenderObject createRenderObject(BuildContext context) {
    // return nodeData.createRenderer();
    return RenderFlex(textDirection: TextDirection.ltr);
  }

  @override
  dom.Node nodeData;
}

class CssBaseSingleElement extends SingleChildRenderObjectElement
    implements DomApi {
  CssBaseSingleElement(CssBaseSingleWidget widget) : super(widget);

  @override
  void mount(Element? parent, Object? newSlot) {
    // TODO: implement mount
    super.mount(parent, newSlot);
    (widget as CssBaseWidget).nodeData.flutterElement = this;
    (widget as CssBaseWidget).nodeData.didMount();
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

class CssBaseMultiWidget extends MultiChildRenderObjectWidget implements CssBaseWidget {
  CssBaseMultiWidget(
      {Key? key, List<Widget>? children, required this.nodeData})
      : super(key: key, children: children ?? <Widget>[]);


  @override
  RenderObject createRenderObject(BuildContext context) {
    // return nodeData.createRenderer();
    return RenderFlex(textDirection: TextDirection.ltr);
  }

  @override
  CssBaseMultiElement createElement() {
    return CssBaseMultiElement(this);
  }

  @override
  dom.Node nodeData;
}

class CssBaseMultiElement extends MultiChildRenderObjectElement implements DomApi {
  CssBaseMultiElement(CssBaseMultiWidget widget) : super(widget);

  late Element _childElement;

  void mount(Element? parent, Object? newSlot) {
    // TODO: implement mount
    super.mount(parent, newSlot);
    (widget as CssBaseWidget).nodeData.flutterElement = this;
    (widget as CssBaseWidget).nodeData.didMount();
    RegisterCenter.sharedInstance().testElement = this;
  }

  @override
  void appendChild(dom.Node nodeBase) {
    Widget child = CssBaseLeafWidget(nodeData: nodeBase,);
    // widget.children.length;
    _childElement = inflateWidget(child, IndexedSlot<Element?>(widget.children.length, children.last));
    // _childElement = inflateWidget(child, IndexedSlot<Element?>(0, null));
    // childElement.mount(this, null);
    // markNeedsBuild();

  }

  @override
  void removeChild(dom.Node? nodeBase) {
    deactivateChild(_childElement);
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

import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:kraken/src/new_render/register_center.dart';
import 'package:vector_math/vector_math.dart';

import '../../dom.dart' as dom;

class NodeBaseSingleWidget extends SingleChildRenderObjectWidget {
  NodeBaseSingleWidget({
    Key? key,
    Widget? child,
    required this.nodeData,
  }): super(key: key, child: child);

  final dom.Node nodeData;

  @override
  RenderObject createRenderObject(BuildContext context) {
    return nodeData.createRenderer();
  }
}

class NodePWidget extends MultiChildRenderObjectWidget {
  NodePWidget({
    Key? key,
    List<Widget>? children,
    required this.nodeData,
  }): super(key:key, children: children ?? <Widget>[]);
  final dom.Node nodeData;

  @override
  RenderObject createRenderObject(BuildContext context) {
    return RenderFlex(textDirection: TextDirection.ltr);
  }


  @override
  MultiChildRenderObjectElement createElement() {
    return NodeBaseElement(this);
  }

}

class NodeBaseElement extends MultiChildRenderObjectElement implements DomApi {
  NodeBaseElement(NodePWidget widget) : super(widget);

  late Element _childElement;
  @override
  void mount(Element? parent, Object? newSlot) {
    // TODO: implement mount
    super.mount(parent, newSlot);
    RegisterCenter.sharedInstance().testElement = this;
  }

  @override
  void appendChild(dom.Node nodeBase) {
    Widget child = NodeBaseSingleWidget(nodeData: nodeBase,);
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

}


mixin DomApi {
  void appendChild(dom.Node nodeBase);
  void removeChild(dom.Node? nodeBase);
}

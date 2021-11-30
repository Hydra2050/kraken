import 'dart:ffi';

import 'package:flutter/widgets.dart';
import 'package:kraken/css.dart';
import 'package:kraken/dom.dart' as dom;
import 'package:kraken/kraken.dart';
import 'package:kraken/rendering.dart';
import 'package:kraken/src/new_render/utils.dart';

typedef WidgetElementBuilder = Widget Function(BuildContext context, Map<String, dynamic> properties, List<Widget> children);

const Map<String, dynamic> _defaultStyle = {
  DISPLAY: INLINE_BLOCK,
};

abstract class DomApiDelegate implements DomApi{

}

abstract class CustomWidgetElement extends dom.Element {
  CustomWidgetElement(int targetId, Pointer<NativeEventTarget> nativeEventTarget, dom.ElementManager elementManager, this.delegate)
      : super(
      targetId,
      nativeEventTarget,
      elementManager,
      isIntrinsicBox: true,
      defaultStyle: _defaultStyle
  );


  DomApiDelegate? delegate;


  Widget build(BuildContext context, Map<String, dynamic> properties, List<Widget> children);

  Widget convertWidget() {
    return _CustomWidget(domElement: this, builder: build,);
  }

  @override
  void didAttachRenderer() {
    super.didAttachRenderer();


  }

  @override
  void removeProperty(String key) {
    super.removeProperty(key);

  }

  @override
  void setProperty(String key, dynamic value) {
    super.setProperty(key, value);

  }

  @override
  dom.Node appendChild(dom.Node child) {
    super.appendChild(child);

    return child;
  }

  @override
  dom.Node removeChild(dom.Node child) {
    super.removeChild(child);

    return child;
  }

}


class _CustomWidget extends StatefulWidget {
  const _CustomWidget({Key? key, required this.domElement,required this.builder}) : super(key: key);

  final CustomWidgetElement domElement;
  final WidgetElementBuilder builder;
  @override
  _CustomWidgetState createState() => _CustomWidgetState();

  @override
  _CustomStatefulElement createElement() => _CustomStatefulElement(this);
}

class _CustomWidgetState extends State<_CustomWidget> {
  @override
  Widget build(BuildContext context) {
    List<Widget> children = <Widget>[];
    for (dom.Node item in widget.domElement.childNodes) {
      children.add(Utils.convertToWidget(item));
    }
    return widget.builder(context, widget.domElement.properties, children);
  }
}

class _CustomStatefulElement extends StatefulElement implements DomApi{
  _CustomStatefulElement(_CustomWidget widget) : super(widget);

  @override
  void mount(Element? parent, Object? newSlot) {
    // TODO: implement mount
    super.mount(parent, newSlot);
    (widget as _CustomWidget).domElement.flutterElement = this;
  }

  @override
  void unmount() {
    (widget as _CustomWidget).domElement.flutterElement = null;
    super.unmount();
  }
  @override
  void appendChild(dom.Node nodeBase) {
    // TODO: implement appendChild
    if ((widget as _CustomWidget).domElement.delegate != null) {
      (widget as _CustomWidget).domElement.delegate!.appendChild(nodeBase);
    } else {
      markNeedsBuild();
    }
  }

  @override
  void removeChild(dom.Node? nodeBase) {
    if ((widget as _CustomWidget).domElement.delegate != null) {
      (widget as _CustomWidget).domElement.delegate!.removeChild(nodeBase);
    } else {
      markNeedsBuild();
    }
  }

  @override
  void updateStyle() {
    // TODO: implement updateStyle
    if ((widget as _CustomWidget).domElement.delegate != null) {
      (widget as _CustomWidget).domElement.delegate!.updateStyle();
    } else {
      markNeedsBuild();
    }
  }

  @override
  void insertChild(dom.Node nodeBase, Object? slot) {
    // TODO: implement insertChild
  }

  @override
  void moveChild(dom.Node nodeBase, Object? oldSlot, Object? newSlot) {
    // TODO: implement moveChild
  }


}


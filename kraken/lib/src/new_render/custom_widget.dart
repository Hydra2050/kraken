import 'dart:ffi';

import 'package:flutter/widgets.dart';
import 'package:kraken/css.dart';
import 'package:kraken/dom.dart' as dom;
import 'package:kraken/kraken.dart';
import 'package:kraken/rendering.dart';

const Map<String, dynamic> _defaultStyle = {
  DISPLAY: INLINE_BLOCK,
};

abstract class DomApiDelegate implements DomApi{

}

abstract class WidgetElement extends dom.Element {
  WidgetElement(int targetId, Pointer<NativeEventTarget> nativeEventTarget, dom.ElementManager elementManager, this.delegate)
      : super(
      targetId,
      nativeEventTarget,
      elementManager,
      isIntrinsicBox: true,
      defaultStyle: _defaultStyle
  );


  DomApiDelegate? delegate;

  Widget build(BuildContext context, Map<String, dynamic> properties);

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



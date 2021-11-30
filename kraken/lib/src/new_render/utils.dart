import 'package:flutter/widgets.dart';
import 'package:kraken/dom.dart' hide Element;
import 'package:kraken/src/new_render/node_base_widget.dart';

class Utils {
  static Widget convertToWidget(Node node) {
    List<Widget> children = <Widget>[];
    for (Node item in node.childNodes) {
      if (item is Element) {
        children.add(convertToWidget(item));
      } else if (item is TextNode) {
        children.add(convertToWidget(item));
      }
    }
    Widget result;
    if (node is TextNode) {
      result = CssBaseLeafWidget(
        nodeData: node,
      );
    } else {
      result = CssBaseMultiWidget(nodeData: node, children: children);
    }
    return result;
  }
}

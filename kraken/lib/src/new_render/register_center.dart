import 'package:flutter/cupertino.dart';
import 'package:kraken/css.dart';

import 'node_base_widget.dart';

class RegisterCenter {

  Widget? rootWidget;

  DomApi? testElement;

  RenderStyle? renderStyle;

  static RegisterCenter sharedInstance() {
    return _singleton;
  }

  static final RegisterCenter _singleton = RegisterCenter._internal();

  RegisterCenter._internal() {

  }

}

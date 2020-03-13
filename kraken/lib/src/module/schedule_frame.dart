import 'package:flutter/scheduler.dart';

int _id = 1;
Map<int, bool> _animationFrameCallbackMap = {};

typedef DoubleCallback = void Function(double);
typedef VoidCallback = void Function();

int requestAnimationFrame(DoubleCallback callback) {
  int id = _id++;
  _animationFrameCallbackMap[id] = true;
  SchedulerBinding.instance.addPostFrameCallback((Duration timeStamp) {
    if (_animationFrameCallbackMap.containsKey(id)) {
      _animationFrameCallbackMap.remove(id);
      double highResTimeStamp = timeStamp.inMicroseconds / 1000;
      callback(highResTimeStamp);
    }
  });
  SchedulerBinding.instance.scheduleFrame();
  return id;
}

void cancelAnimationFrame(int id) {
  if (_animationFrameCallbackMap.containsKey(id)) {
    _animationFrameCallbackMap.remove(id);
  }
}

void requestBatchUpdate(FrameCallback callback) {
  SchedulerBinding.instance.scheduleFrameCallback(callback);
  SchedulerBinding.instance.scheduleFrame();
}
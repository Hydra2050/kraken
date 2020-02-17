/*
 * Copyright (C) 2019 Alibaba Inc. All rights reserved.
 * Author: Kraken Team.
 */

#ifndef KRAKEN_BRIDGE_EXPORT_H
#define KRAKEN_BRIDGE_EXPORT_H

#include <cstdint>
#define KRAKEN_EXPORT                                                          \
  extern "C" __attribute__((visibility("default"))) __attribute__((used))

struct Screen {
  double width;
  double height;
};
using AsyncCallback = void (*)(void*);
typedef const char *(*InvokeUIManager)(const char*);
typedef const char *(*InvokeModuleManager)(const char*, int32_t);
typedef void (*ReloadApp)();
typedef int32_t (*SetTimeout)(AsyncCallback callback, void* context, int32_t);
typedef int32_t (*SetInterval)(AsyncCallback callback, void* context, int32_t);
typedef void (*ClearTimeout)(int32_t);
typedef int32_t (*RequestAnimationFrame)(AsyncCallback callback, void* context);
typedef void (*CancelAnimationFrame)(int32_t);
typedef Screen *(*GetScreen)();
typedef void (*InvokeFetch)(int32_t, const char*, const char*);
typedef double (*DevicePixelRatio)();
typedef const char *(*PlatformBrightness)();
typedef void (*OnPlatformBrightnessChanged)();

KRAKEN_EXPORT
void initJsEngine();
KRAKEN_EXPORT
void evaluateScripts(const char *code, const char *bundleFilename,
                     int startLine);
KRAKEN_EXPORT
void reloadJsContext();
KRAKEN_EXPORT
void invokeEventListener(int32_t type, const char *json);
KRAKEN_EXPORT
Screen *createScreen(double width, double height);
KRAKEN_EXPORT
void invokeFetchCallback(int32_t callbackId, const char* error, int32_t statusCode,
                         const char* body);
KRAKEN_EXPORT
void invokeModuleCallback(int32_t callbackId, const char* json);
KRAKEN_EXPORT
void invokeOnloadCallback();
KRAKEN_EXPORT
void invokeOnPlatformBrightnessChangedCallback();
KRAKEN_EXPORT
void flushUITask();

KRAKEN_EXPORT
void registerInvokeUIManager(InvokeUIManager invokeUIManager);
KRAKEN_EXPORT
void registerInvokeModuleManager(InvokeModuleManager invokeUIManager);
KRAKEN_EXPORT
void registerReloadApp(ReloadApp reloadApp);
KRAKEN_EXPORT
void registerSetTimeout(SetTimeout setTimeout);
KRAKEN_EXPORT
void registerSetInterval(SetInterval setInterval);
KRAKEN_EXPORT
void registerClearTimeout(ClearTimeout clearTimeout);
KRAKEN_EXPORT
void registerRequestAnimationFrame(RequestAnimationFrame requestAnimationFrame);
KRAKEN_EXPORT
void registerCancelAnimationFrame(CancelAnimationFrame cancelAnimationFrame);
KRAKEN_EXPORT
void registerGetScreen(GetScreen getScreen);
KRAKEN_EXPORT
void registerInvokeFetch(InvokeFetch invokeFetch);
KRAKEN_EXPORT
void registerDevicePixelRatio(DevicePixelRatio devicePixelRatio);
KRAKEN_EXPORT
void registerPlatformBrightness(PlatformBrightness platformBrightness);
KRAKEN_EXPORT
void registerOnPlatformBrightnessChanged(OnPlatformBrightnessChanged onPlatformBrightnessChanged);


#endif // KRAKEN_BRIDGE_EXPORT_H
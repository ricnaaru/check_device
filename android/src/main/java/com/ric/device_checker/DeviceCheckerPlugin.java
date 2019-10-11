package com.ric.device_checker;

import android.content.Context;

import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import io.flutter.plugin.common.PluginRegistry.Registrar;

/** DeviceCheckerPlugin */
public class DeviceCheckerPlugin implements MethodCallHandler {
  private Context context;

  public DeviceCheckerPlugin(Context context) {
    this.context = context;
  }

  /** Plugin registration. */
  public static void registerWith(Registrar registrar) {
    final MethodChannel channel = new MethodChannel(registrar.messenger(), "device_checker");
    channel.setMethodCallHandler(new DeviceCheckerPlugin(registrar.context()));
  }

  @Override
  public void onMethodCall(MethodCall call, Result result) {
    if (call.method.equals("checkDevice")) {
      String screenType = context.getResources().getString(R.string.screen_type);

      result.success(screenType);
    } else {
      result.notImplemented();
    }
  }
}

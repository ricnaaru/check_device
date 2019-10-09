import Flutter
import UIKit

enum UIUserInterfaceIdiom : Int {
    case unspecified
    
    case phone // iPhone and iPod touch style UI
    case pad // iPad style UI
}

public class SwiftDeviceCheckerPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "device_checker", binaryMessenger: registrar.messenger())
    let instance = SwiftDeviceCheckerPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch (call.method) {
    case "checkDevice":
        switch UIDevice.current.userInterfaceIdiom {
        case .phone:
            result("phone")
        case .pad:
            result("pad")
        case .unspecified:
            result("unspecified")
        case .tv:
            result("tv")
        case .carPlay:
            result("carPlay")
        }
        break;
    default:
        result(FlutterMethodNotImplemented)
    }
  }
}

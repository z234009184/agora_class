import Flutter
import UIKit
import AgoraClassroomSDK_iOS
import AgoraUIBaseViews

public class AgoraClassPlugin: NSObject, FlutterPlugin, AgoraEduClassroomSDKDelegate {
    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: "agora_class", binaryMessenger: registrar.messenger())
        let instance = AgoraClassPlugin()
        registrar.addMethodCallDelegate(instance, channel: channel)
    }
    
    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        switch call.method {
        case "getPlatformVersion":
            result("iOS " + UIDevice.current.systemVersion)
        case "initAgoraEdu":
            let map: [String: Any] = call.arguments as? [String: Any] ?? [:];
            agora_ui_mode = .agoraLight     /* 设置界面显示模式，可设为 agoraLight 或 agoraDark，默认为 agoraLight。 */
            agora_ui_language = "zh-Hans"  /* 设置界面语言，可设为 "zh-Hans" 或 "en"。如果不设置，界面语言跟随系统语言。 */
            
            guard let userName = map["userName"] as? String else {
                return;
            }
            
            guard let userUuid = map["userUuid"] as? String else {
                return;
            }
            
            guard let userRole = map["userRole"] as? Int else {
                return;
            }
            
            guard let roomName = map["roomName"] as? String else {
                return;
            }
            
            guard let roomUuid = map["roomUuid"] as? String else {
                return;
            }
            
            guard let roomType = map["roomType"] as? Int else {
                return;
            }
            
            guard let appId = map["appId"] as? String else {
                return;
            }
            
            guard let token = map["token"] as? String else {
                return;
            }
            
            let launchConfig = AgoraEduLaunchConfig(
                userName: userName,
                userUuid: userUuid,
                userRole: AgoraEduUserRole(rawValue: userRole)!,
                roomName: roomName,
                roomUuid: roomUuid,
                roomType: AgoraEduRoomType(rawValue: roomType)!,
                appId: appId,
                token: token)
            
            AgoraClassroomSDK.setDelegate(self)
            
            AgoraClassroomSDK.launch(launchConfig,
                                     success: {},
                                     failure: { error in })
            
        default:
            result(FlutterMethodNotImplemented)
        }
    }
}

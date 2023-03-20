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
            
            let launchConfig = AgoraEduLaunchConfig(userName: userName,          // 用户名
                                                    userUuid: userUuid,          // 用户 ID
                                                    userRole: AgoraEduUserRole(rawValue: userRole)!,          // 用户角色: 1 为老师，2 为学生
                                                    roomName: roomName,          // 房间名
                                                    roomUuid: roomUuid,          // 房间 ID
                                                    roomType: AgoraEduRoomType(rawValue: roomType)!,          // 房间类型: 0 为 一对一，2 为大班课，4 为小班课
                                                    appId: appId,                //声网 App ID
                                                    token: token,                // 测试环境下，你可以使用临时 Token；生产或安全环境下，强烈建议你使用服务器生成的 Token
                                                    startTime: nil,              // 课堂开始时间
                                                    duration: nil,               // 课堂持续时长
                                                    region: AgoraEduRegion.CN,              // 区域
                                                    mediaOptions: nil,  // 媒体相关配置
                                                    userProperties: nil)         // 用户自定义属性
            
            AgoraClassroomSDK.setDelegate(self)
            
            AgoraClassroomSDK.launch(launchConfig,
                                     success: {},
                                     failure: { error in })
            
        default:
            result(FlutterMethodNotImplemented)
        }
    }
}

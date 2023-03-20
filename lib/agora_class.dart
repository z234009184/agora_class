
import 'agora_class_platform_interface.dart';

class AgoraClass {
  Future<String?> getPlatformVersion() {
    return AgoraClassPlatform.instance.getPlatformVersion();
  }

  Future<void> initAgoraEdu(Map map) async {
    AgoraClassPlatform.instance.initAgoraEdu(map);
  }
}

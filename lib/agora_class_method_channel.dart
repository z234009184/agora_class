import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'agora_class_platform_interface.dart';

/// An implementation of [AgoraClassPlatform] that uses method channels.
class MethodChannelAgoraClass extends AgoraClassPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('agora_class');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }

  @override
  Future<void> initAgoraEdu(Map map) async {
    await methodChannel.invokeMethod('initAgoraEdu', map);
  }
}

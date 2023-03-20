import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'agora_class_method_channel.dart';

abstract class AgoraClassPlatform extends PlatformInterface {
  /// Constructs a AgoraClassPlatform.
  AgoraClassPlatform() : super(token: _token);

  static final Object _token = Object();

  static AgoraClassPlatform _instance = MethodChannelAgoraClass();

  /// The default instance of [AgoraClassPlatform] to use.
  ///
  /// Defaults to [MethodChannelAgoraClass].
  static AgoraClassPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [AgoraClassPlatform] when
  /// they register themselves.
  static set instance(AgoraClassPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<void> initAgoraEdu(Map map) async {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

}

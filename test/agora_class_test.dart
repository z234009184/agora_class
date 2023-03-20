import 'package:flutter_test/flutter_test.dart';
import 'package:agora_class/agora_class.dart';
import 'package:agora_class/agora_class_platform_interface.dart';
import 'package:agora_class/agora_class_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockAgoraClassPlatform
    with MockPlatformInterfaceMixin
    implements AgoraClassPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');

  @override
  Future<void> initAgoraEdu(Map map) {
    // TODO: implement initAgoraEdu
    throw UnimplementedError();
  }
}

void main() {
  final AgoraClassPlatform initialPlatform = AgoraClassPlatform.instance;

  test('$MethodChannelAgoraClass is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelAgoraClass>());
  });

  test('getPlatformVersion', () async {
    AgoraClass agoraClassPlugin = AgoraClass();
    MockAgoraClassPlatform fakePlatform = MockAgoraClassPlatform();
    AgoraClassPlatform.instance = fakePlatform;

    expect(await agoraClassPlugin.getPlatformVersion(), '42');
  });
}

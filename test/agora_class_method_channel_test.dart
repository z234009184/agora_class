import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:agora_class/agora_class_method_channel.dart';

void main() {
  MethodChannelAgoraClass platform = MethodChannelAgoraClass();
  const MethodChannel channel = MethodChannel('agora_class');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}

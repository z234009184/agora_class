#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint agora_class.podspec` to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'agora_class'
  s.version          = '0.0.1'
  s.summary          = 'A new Flutter plugin project.'
  s.description      = <<-DESC
A new Flutter plugin project.
                       DESC
  s.homepage         = 'http://example.com'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Your Company' => 'email@example.com' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.dependency 'Flutter'

  s.dependency 'Protobuf', '3.17.0'
  s.dependency 'CocoaLumberjack', '3.6.1'
  s.dependency 'AliyunOSSiOS', '2.10.8'
  s.dependency 'Armin', '1.1.0'
  s.dependency 'SSZipArchive', '2.4.2'
  s.dependency 'SwifterSwift', '5.2.0'
  s.dependency 'Masonry', '1.1.0'
  s.dependency 'SDWebImage', '5.12.0'

  s.dependency 'AgoraRtcEngine_iOS/RtcBasic', '3.6.2'
  s.dependency 'AgoraMediaPlayer_iOS', '1.3.0'
  s.dependency 'AgoraRtm_iOS', '1.4.8'
  s.dependency 'Agora_Chat_iOS', '1.0.6'
  s.dependency 'Whiteboard', '2.16.39'

  s.dependency 'AgoraClassroomSDK_iOS', '2.8.0'
  s.dependency 'AgoraEduUI', '2.8.0'
  s.dependency 'AgoraWidgets', '2.8.0'

  s.dependency 'AgoraUIBaseViews', '2.8.0'
  s.dependency 'AgoraEduCore', '2.8.0'
  s.dependency 'AgoraWidget', '2.8.0'

  s.platform = :ios, '10.0'

  # Flutter.framework does not contain a i386 slice.
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386' }
  s.swift_version = '5.0'
end

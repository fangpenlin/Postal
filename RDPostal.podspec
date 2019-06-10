Pod::Spec.new do |s|
  s.name = 'Postal'
  s.version = '0.6.4'
  s.summary = 'A swift framework for working with emails.'
  s.description = 'A Swift framework for working with emails. Simple and quick to use. Built on top of libetpan.'
  s.homepage = 'https://github.com/fangpenlin/Postal'
  s.license = 'MIT'
  s.author = { 'Kevin Lefevre' => 'kevin.lefevre@snips.ai', 'Jeremie Girault' => 'jeremie.girault@gmail.com' }

  s.ios.deployment_target = '9.0'
  s.osx.deployment_target = '10.12'

  s.source = { :git => 'git@github.com:readdle/Postal.git', :tag => 'v' + s.version.to_s }

  s.default_subspec = 'Core'

  s.subspec 'Core' do |sp|
    sp.source_files  = 'Postal/*.{swift,h}'
    sp.preserve_paths = 'dependencies/*'

    sp.pod_target_xcconfig = {
      'GCC_PREPROCESSOR_DEFINITIONS' => '$(inherited) NO_MACROS=1',
      'SWIFT_INCLUDE_PATHS' => '$(inherited) "$SDKROOT/usr/include/libxml2" "$(PODS_TARGET_SRCROOT)/dependencies/build/libetpan"',
      'HEADER_SEARCH_PATHS' => '$(inherited) "$(PODS_TARGET_SRCROOT)/dependencies/build/libetpan"'
    }

    sp.ios.pod_target_xcconfig = {
      'HEADER_SEARCH_PATHS' => '"$(PODS_TARGET_SRCROOT)/dependencies/build/ios/include"'
    }

    sp.libraries = 'etpan', 'sasl2', 'z', 'iconv'
    sp.ios.vendored_libraries = 'dependencies/build/ios/lib/libetpan.a'
    sp.osx.vendored_libraries = 'dependencies/build/macos/lib/libetpan.a'

    sp.dependency 'Result', '~> 4.0'
  end

  s.subspec 'ReactiveSwift' do |sp|
    sp.source_files = 'Postal/ReactiveSwift/*.swift'
    sp.dependency 'Postal/Core'
    sp.dependency 'ReactiveSwift', '~> 6.0'
  end
end

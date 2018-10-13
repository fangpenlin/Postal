Pod::Spec.new do |s|
  s.name = 'RDPostal'
  s.version = '0.0.1'
  s.summary = 'A swift framework for working with emails.'
  s.description = 'A Swift framework for working with emails. Simple and quick to use. Built on top of libetpan.'
  s.homepage = 'https://github.com/readdle/Postal'
  s.license = 'MIT'
  s.author = { 'Kevin Lefevre' => 'kevin.lefevre@snips.ai', 'Jeremie Girault' => 'jeremie.girault@gmail.com' }

  s.ios.deployment_target = '10.0'
  s.osx.deployment_target = '10.12'

  s.source = { :git => 'git@github.com:readdle/Postal.git', :tag => 'v' + s.version.to_s }

  s.default_subspec = 'Core'

  s.subspec 'Core' do |sp|
    sp.source_files  = 'Postal/*.{swift,h}'

    sp.pod_target_xcconfig = {
      'GCC_PREPROCESSOR_DEFINITIONS' => '$(inherited) NO_MACROS=1'
    }
    sp.ios.pod_target_xcconfig = {
      'SWIFT_INCLUDE_PATHS' => '"$(SRCROOT)/Postal/dependencies" "$(SRCROOT)/Postal/dependencies/build/ios/include"',
      'LIBRARY_SEARCH_PATHS' => '"$(SRCROOT)/Postal/dependencies/build/ios/lib"',
      'HEADER_SEARCH_PATHS' => '"$(SRCROOT)/Postal/dependencies/build/ios/include"'
    }
    s.osx.pod_target_xcconfig = {
      'SWIFT_INCLUDE_PATHS' => '"$(SRCROOT)/Postal/dependencies" "$(SRCROOT)/Postal/dependencies/build/macos/include"',
      'LIBRARY_SEARCH_PATHS' => '"$(SRCROOT)/Postal/dependencies/build/macos/lib"',
      'HEADER_SEARCH_PATHS' => '"$(SRCROOT)/Postal/dependencies/build/macos/include"'
    }
    sp.preserve_paths = 'dependencies'

    sp.libraries = 'etpan', 'sasl2', 'z', 'iconv'
    sp.dependency 'Result', '~> 4.0'
  end

  s.subspec 'ReactiveSwift' do |sp|
    sp.source_files = 'Postal/ReactiveSwift/*.swift'
    sp.dependency 'RDPostal/Core'
    sp.dependency 'ReactiveSwift', '~> 4.0'
  end
end

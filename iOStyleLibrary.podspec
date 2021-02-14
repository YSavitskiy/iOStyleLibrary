Pod::Spec.new do |s|
  s.name             = 'iOStyleLibrary'
  s.version          = '2.0.1'
  s.summary          = "Library for managing element styles"
  s.homepage         = 'https://github.com/YSavitskiy/iOStyleLibrary'
  s.license          = { :type => 'MIT', :file => 'LICENSE.md' }
  s.author          = { '' => 'yursavitskiy@gmail.com' }
  s.source           = { :git => 'https://github.com/YSavitskiy/iOStyleLibrary.git', :tag => s.version.to_s }
  s.ios.deployment_target = '11.0'

  s.source_files = 'Source/**/*.{swift}'  
  s.swift_version = "5.0"

end

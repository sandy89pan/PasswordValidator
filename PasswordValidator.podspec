Pod::Spec.new do |s|
  s.name             = 'PasswordValidator'
  s.version          = '0.1.2'
  s.summary          = 'A simple password validation library.'

  s.description      = <<-DESC
    A Swift library that provides password validation. It checks if the password contains both letters and digits and is between 8 to 12 characters long.
  DESC

  s.homepage         = 'https://github.com/sandy89pan/PasswordValidator'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'sandy.pan' => 'sandy.pan@ringcentral.com' }
  s.source           = { :git => 'https://github.com/sandy89pan/PasswordValidator.git', :tag => s.version.to_s }

  s.ios.deployment_target = '12.0' # 建议从 12.0 起
  s.swift_versions = ['5.0']
  s.source_files = 'PasswordValidatorTest/Classes/**/*'
end
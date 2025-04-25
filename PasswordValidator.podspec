Pod::Spec.new do |s|
  s.name             = 'PasswordValidator'
  s.version          = '0.1.0'
  s.summary          = 'A simple password validation library.'

  s.description      = <<-DESC
                        A Swift library that provides password validation. It checks if the password contains both letters and digits and is between 8 to 12 characters long.
                       DESC

  s.homepage         = 'https://github.com/your_username/PasswordValidator'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'sandy.pan' => 'sandy.pan@example.com' }
  s.source           = { :git => 'https://github.com/your_username/PasswordValidator.git', :tag => s.version.to_s }
  s.ios.deployment_target = '11.0'

  s.source_files = 'PasswordValidator/Classes/**/*'
end

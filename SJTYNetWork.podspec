#
# Be sure to run `pod lib lint SJTYNetWork.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'SJTYNetWork'
  s.version          = '1.0.42'
  s.summary          = 'A short description of SJTYNetWork.'

  s.description      = <<-DESC
SJTYNetWork is a network library with modular structure:
JWT handling, API requests, and data models.
DESC

  s.homepage         = 'https://github.com/CJL9567/SJTYNetWork'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'caijialiang' => '1350027967@qq.com' }
  s.source           = { :git => 'https://github.com/CJL9567/SJTYNetWork.git', :tag => s.version }

  s.ios.deployment_target = '12.0'

  # 源代码文件，按功能文件夹划分
  s.source_files = [
    'SJTYNetwork/JWT/**/*.{h,m}',
    'SJTYNetwork/Api/**/*.{h,m}',
    'SJTYNetwork/Model/**/*.{h,m}',
    'SJTYNetwork/*.h' # 顶层头文件，如 Define.h, SJTYNetwork.h
  ]

  # 公开头文件，供使用者 import
  s.public_header_files = [
    'SJTYNetwork/*.h',
    'SJTYNetwork/JWT/**/*.h',
    'SJTYNetwork/Api/**/*.h',
    'SJTYNetwork/Model/**/*.h'
  ]

  # 如果你有资源文件（可选）
  # s.resource_bundles = {
  #   'SJTYNetwork' => ['SJTYNetwork/Assets/*.png']
  # }

  # 依赖库
  s.dependency 'AFNetworking'
  s.dependency 'MJExtension'
  s.dependency 'SJTYLogManager'

  # 框架依赖（如需要）
  s.frameworks = 'UIKit', 'Foundation'
end

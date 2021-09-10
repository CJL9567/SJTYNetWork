# SJTYNetWork

[![CI Status](https://img.shields.io/travis/caijialiang/SJTYNetWork.svg?style=flat)](https://travis-ci.org/caijialiang/SJTYNetWork)
[![Version](https://img.shields.io/cocoapods/v/SJTYNetWork.svg?style=flat)](https://cocoapods.org/pods/SJTYNetWork)
[![License](https://img.shields.io/cocoapods/l/SJTYNetWork.svg?style=flat)](https://cocoapods.org/pods/SJTYNetWork)
[![Platform](https://img.shields.io/cocoapods/p/SJTYNetWork.svg?style=flat)](https://cocoapods.org/pods/SJTYNetWork)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

SJTYNetWork is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'SJTYNetWork'
```

## 使用教程

1、 [[NetWorkManager sharedInstance] setUpWithKey:项目产品ID]; --必须设置

2、与用户相关Api 使用 [NetWorkManager sharedInstance].userApiClient 调用对应函数

3、与网页相关Api 使用 [NetWorkManager sharedInstance].htmlApiClient 调用对应函数

4、与意见反馈相关Api 使用 [NetWorkManager sharedInstance].feedBackApiClient 调用对应函数

5、与广告、推送相关Api 使用 [NetWorkManager sharedInstance].adApiClient 调用对应函数

6、与知识相关Api 使用 [NetWorkManager sharedInstance].knowledgeApiClient 调用对应函数

7、与点赞相关Api 使用 [NetWorkManager sharedInstance].likeApiClient 调用对应函数

8、与社群相关Api 使用 [NetWorkManager sharedInstance].communityApiClient 调用对应函数

## Author

caijialiang, 1350027967@qq.com

## License

SJTYNetWork is available under the MIT license. See the LICENSE file for more info.

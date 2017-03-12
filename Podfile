source 'https://github.com/CocoaPods/Specs.git'
use_frameworks!
platform :ios, '9.0'

def shared_pods
  pod 'Alamofire', '~> 4.4'
  pod 'AlamofireImage', '~> 3.2'
  pod 'RealmSwift'
  pod 'SwiftDate', '~> 4.0'
  pod 'SwiftLint'
  pod 'SwiftyJSON', '~> 3.1'
end

target 'WeatherSwift' do
    shared_pods
end

target 'WeatherSwiftTests' do
    shared_pods
    pod 'OHHTTPStubs'
    pod 'OHHTTPStubs/Swift'
end

post_install do |installer|
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            config.build_settings['SWIFT_VERSION'] = '3.0'
        end
    end
end

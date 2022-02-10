# Uncomment the next line to define a global platform for your project
 platform :ios, '11.0'

# Comment the next line if you don't want to use dynamic frameworks
use_frameworks!

# Pods for Network
$Alamofire = pod 'Alamofire', '~> 5.5'

# Pods for CodeQuality
$SwiftLint = pod 'SwiftLint', '~> 0.46'

# Pods for UI
$MobilliumBuilders = pod 'MobilliumBuilders','~> 1.4'
$TinyConstrain = pod 'TinyConstraints', '~> 4.0'




workspace 'NoteBerkayMvvm'

target 'NoteBerkayMvvm' do
  
  project 'NoteBerkayMvvm.xcodeproj'
  
  # Pods for NoteBerkayMvvm
  $SwiftLint
  $MobilliumBuilders
  $TinyConstrain

  target 'NoteBerkayMvvmTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'NoteBerkayMvvmUITests' do
    # Pods for testing
  end

end

target 'DataProvider' do
  
  project 'DataProvider/DataProvider.xcodeproj'
  
  # Pods for DataProvider
  $Alamofire
  
  target 'DataProviderTests' do
    inherit! :search_paths
    # Pods for testing
  end

end

target 'Utilities' do
  
  project 'Utilities/Utilities.xcodeproj'
  
  # Pods for Utilities
  
  target 'UtilitiesTests' do
    inherit! :search_paths
    # Pods for testing
  end

end

target 'UIComponents' do
  
  project 'UIComponents/UIComponents.xcodeproj'
  
  # Pods for UIComponents
  
  target 'UIComponentsTests' do
    inherit! :search_paths
    # Pods for testing
  end

end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '11.0'
      config.build_settings["EXCLUDED_ARCHS[sdk=iphonesimulator*]"] = "arm64"
    end
  end
end



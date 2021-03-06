Pod::Spec.new do |s|
  s.name             = 'FlowDK'
  s.version          = '0.1.1'
  s.summary          = 'FlowDK is an SDK for Swift developers intended to optimize their happiness'

  s.description      = <<-DESC
FlowDK is an SDK for Swift developers intended to optimize their happiness by extending the Swift standard library with delightful and useful extensions, utilities, views and more.
                       DESC

  s.homepage         = 'https://github.com/FlowDK/FlowDK'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'JP McGlone' => 'jp@jpmcglone.com' }
  s.source           = { :git => 'https://github.com/FlowDK/FlowDK.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/FlowDK'

  s.ios.deployment_target = '11.0'

  s.subspec 'Core' do |ss|
    ss.source_files = 'FlowDK/Core/Classes/**/*'
    ss.dependency 'CocoaLumberjack/Swift'
    ss.dependency 'SnapKit'
  end

  s.subspec 'AnyAPI' do |ss|
    ss.source_files = 'FlowDK/AnyAPI/Classes/**/*'
    ss.dependency 'FlowDK/Core'
    ss.dependency 'ObjectMapper'
    ss.dependency 'Alamofire'
    ss.dependency 'AlamofireNetworkActivityIndicator'
    ss.dependency 'AlamofireObjectMapper'
  end
end

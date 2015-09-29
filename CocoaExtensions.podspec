Pod::Spec.new do |s|
  s.name         = "CocoaExtensions"
  s.version      = "0.0.4"
  s.summary      = "A collection of Objective-C/Cocoa categories"

  s.description  = <<-DESC
                   A collection of Objective-C/Cocoa extension categories.
                   DESC
  s.homepage     = "http://github.com/Promptus/CocoaExtensions"
  s.license      = 'MIT'
  s.author       = { "Lars Kuhnt" => "lars.kuhnt@gmail.com" }
  s.source       = { :git => "https://github.com/Promptus/CocoaExtensions.git" }
  s.source_files = 'CocoaExtensions', 'CocoaExtensions/**/*.{h,m}'
  s.resources    = 'CocoaExtensions/**/*.{png,xib,xcassets}'
  s.requires_arc = true

  s.ios.deployment_target   = '7.0'
  s.watchos.deployment_target = '2.0'

  s.subspec 'Reachability' do |ss|
   ss.ios.deployment_target = '7.0'
   ss.dependency   'Reachability', '~> 3.1.1'
  end

  s.subspec 'iCarousel' do |ss|
    ss.ios.deployment_target = '7.0'
    ss.dependency   'iCarousel',    '~> 1.7'
  end

end

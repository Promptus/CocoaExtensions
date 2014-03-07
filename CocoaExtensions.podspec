Pod::Spec.new do |s|
  s.name         = "CocoaExtensions"
  s.version      = "0.0.1"
  s.summary      = "A collection of Objective-C/Cocoa categories"

  s.description  = <<-DESC
                   A collection of Objective-C/Cocoa extension categories.
                   DESC
  s.homepage     = "http://github.com/Promptus/CocoaExtensions"
  s.license      = 'MIT'
  s.author       = { "Lars Kuhnt" => "lars.kuhnt@gmail.com" }
  s.platform     = :ios, '6.0'
  s.source       = { :git => "https://github.com/Promptus/CocoaExtensions.git" }
  s.source_files = 'CocoaExtensions', 'CocoaExtensions/**/*.{h,m}'
  s.resources    = 'CocoaExtensions/**/*.{xib,xcassets}'
  s.requires_arc = true
  
  s.dependency   'Reachability', '~> 3.1.1'
end

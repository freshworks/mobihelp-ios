Pod::Spec.new do |s|
  s.name                = 'MobihelpSDK'
  s.version             = '1.2.2'
  s.summary             = 'In-App customer support SDK, powered by Freshdesk'
  s.homepage            = 'http://developer.freshdesk.com/mobihelp'
  s.license             = { :type => 'Commercial', :text => 'See http://www.freshdesk.com/terms' }
  s.author              = { 'Freshdesk' => 'support@freshdesk.com' }
  s.platform            = :ios, '7.0'
  s.requires_arc	= true
  s.frameworks          = 'MobileCoreServices','CoreTelephony','SystemConfiguration','CoreData','CoreGraphics','UIKit','Foundation','Security','QuartzCore'
  s.source              = { :git => "https://github.com/freshdesk/mobihelp-ios.git", :tag => "v#{s.version}" }
  s.source_files        = 'MobihelpSDK/Mobihelp.h'
  s.library             = 'FDMobihelpSDK'
  s.xcconfig            = { 'LIBRARY_SEARCH_PATHS' => '"$(PODS_ROOT)/MobihelpSDK/MobihelpSDK"'}
  s.preserve_paths      = 'MobihelpSDK/*'
  s.resources           = ['MobihelpSDK/MHModel.bundle', 'MobihelpSDK/MHResources.bundle', 'MobihelpSDK/MHLocalization/en.lproj/MHLocalizable.strings'];
  s.documentation_url   = 'http://developer.freshdesk.com/mobihelp/ios/api'

end

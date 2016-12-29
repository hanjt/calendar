Pod::Spec.new do |s|

  s.name         = "CalenderCompontent"
  s.version      = "0.3"
  s.summary      = "日历控件”

  s.description  = <<-DESC
       循环滚动播放图片,自动播放,手动播放
                   DESC

  s.homepage     = "https://github.com/hanjt/calendar"
  s.license      = "MIT"
  s.author       = { "chrislian" => "chris0592@163.com" }
  s.platform     = :ios,’8.0’

  s.source       = { :git => "https://github.com/hanjt/calendar", :tag => “V#{s.version}" }
  s.source_files = "calendar/calendar/CalenderCompontent/**/*.{h,m}”
  s.framework    = "UIKit"
  s.requires_arc = true
end
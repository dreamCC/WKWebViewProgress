
Pod::Spec.new do |s|

  s.name         = "WKWebViewProgress"
  s.version      = "1.0.0"
  s.summary      = "Add the gradient to WKWebView progress bar."
  s.homepage     = "https://github.com/dreamCC/WKWebViewProgress"
  s.license      = "MIT"

  s.author       = { "AbelZ" => "568644031@qq.com" }

  s.platform     = :ios, "8.0"


  s.source       = { :git => "https://github.com/dreamCC/WKWebViewProgress.git", :tag => s.version }

  s.source_files  = "WKWebViewProgress/*.{h,m}"

  s.requires_arc = true


end

#
#  Be sure to run `pod spec lint TP2Framework.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|
  s.name         = "TP2Framework"
  s.version      = "1.0"
  s.summary      = "Framework for TP2App API responses."

  # This description is used to generate tags and improve search results.
  #   * Think: What does it do? Why did you write it? What is the focus?
  #   * Try to keep it short, snappy and to the point.
  #   * Write the description between the DESC delimiters below.
  #   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description  = <<-DESC
Framework for TP2App API responses. It is necessary to use two aditional libraries.
                   DESC

  s.homepage     = "https://github.com/hrosado20/TP2_Framework"
  # s.screenshots  = "www.example.com/screenshots_1.gif", "www.example.com/screenshots_2.gif"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author             = { "hrosado20" => "u201411897@upc.edu.pe" }
  s.source       = { :git => "https://github.com/hrosado20/TP2_Framework.git", :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = "8.0"

  s.source_files = "TP2Framework/**/*.{swift}"

  # s.frameworks = "UIKit", "Foundation"
  s.dependency "Cloudinary", "~> 2.0"
  s.dependency "SwiftyJSON", "~> 4.0"

  s.swift_version = "4.2"

end

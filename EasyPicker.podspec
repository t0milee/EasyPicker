#
#  Be sure to run `pod spec lint EasyPicker.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see https://guides.cocoapods.org/syntax/podspec.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |spec|

  spec.name = "EasyPicker"
  spec.version = "0.1.0"
  spec.summary = "EasyPicker let's you inject a Date/UI Picker in a matter of just a few lines of code."

  spec.description  = <<-DESC
    EasyPicker let's you inject a Date/UI Picker in a matter of just a few lines of code.
    Dries up the code needed for the setting up a picker view.
    It's boring to write the same old code for pickers, try it out, you just might like it.
  DESC

  spec.homepage = "https://github.com/t0milee/EasyPicker"
  spec.license = { :type => "MIT", :file => "LICENSE" }
  spec.author = { "Tomislav Jankovic" => "jankovic.tm@gmail.com" }
  spec.platform = :ios
  spec.source = { :git => "https://github.com/t0milee/EasyPicker.git", :tag => "#{spec.version}" }

  spec.source_files = "EasyPicker/Source/*.swift"
  spec.framework = "UIKit"
end

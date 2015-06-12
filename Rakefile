require 'xcodebuild'

task default: :test

task :test do
  sh("xcodebuild test -workspace Example/KSReason.xcworkspace -scheme KSReason-Example -sdk iphonesimulator | xcpretty -c")
end
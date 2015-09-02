Pod::Spec.new do |s|
  s.name             = "KSReason"
  s.version          = "1.5.0"
  s.summary          = "A number of helpers for doing iteration, parsing, and more"
  s.description      = <<-DESC
                       * `KSParser` provides parsing for a number of classes such as NSNumber, NSString and NSDate to help with parsing APIs.
                       * `KSEnumerable` implements many enumeration methods such as each, map, reduce, filter, and find using a block syntax.
                       * `KSInflection` implements pluralization and singularization helpers for strings and allows custom rules to be defined.
                       * `KSBackbone` provides some basic helpers for using models and collections including parsing, archiving, attributes, associations, and identity.
                       DESC
  s.homepage         = "https://github.com/ksylvest/reason"

  s.license          = 'MIT'
  s.author           = { "Kevin Sylvestre" => "kevin@ksylvest.com" }
  s.source           = { :git => "https://github.com/ksylvest/reason.git", :tag => s.version.to_s }

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'
  s.resource_bundles = { 'KSReason' => ['Pod/Assets/**/*'] }
end

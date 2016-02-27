Pod::Spec.new do |s|
  s.name             = "Swiftline"
  s.version          = "0.4.0"
  s.summary          = "Swiftline is a set of tools to help you create command line applications"
  s.description      = <<-DESC
  Swiftline can be divided to three main parts:

  - Colorize; Helps adding colors to strings written to the terminal
  - Ask, Choose and agree; Easily create prompt for asking the user more info
  - Runner; A quick way to run an external command and read its standard output and standard error.
                       DESC
  s.homepage         = "https://github.com/oarrabi/Swiftline"
  s.license          = 'MIT'
  s.author           = { "Omar Abdelhafith" => "o.arrabi@me.com" }
  s.source           = { :git => "https://github.com/oarrabi/Swiftline.git", :tag => s.version.to_s }

  s.platform     = :osx, '10.9'
  s.requires_arc = true

  s.source_files = 'Source/**/*'
end

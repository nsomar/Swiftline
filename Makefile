build_help:
	cd SwiftlineTests && jazzy \
  --clean \
  --author NSOmar \
  --author_url https://nsomar.com \
  --github_url https://github.com/swiftline/swiftline \
  --github-file-prefix https://github.com/swiftline/swiftline \
  --module-version 0.2.0 \
  --xcodebuild-arguments -scheme,Swiftline \
  --module Swiftline \
  --root-url https://realm.io/docs/swift/0.96.2/api/ \
  --output docs/swift_output \

test:
	cd SwiftlineTests; xctool -project Swiftline.xcodeproj -scheme Swiftline clean build test -sdk macosx GCC_INSTRUMENT_PROGRAM_FLOW_ARCS=YES GCC_GENERATE_TEST_COVERAGE_FILES=YES

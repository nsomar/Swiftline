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
	--output ../../Docs/swift_output
	git stash
	git checkout gh-pages
	git fetch origin
	git reset --hard origin/gh-pages
	git clean -fd
	\cp -rf ../Docs/swift_output/* .
	git aa
	git commit -m "Updating documentation"
	git push origin gh-pages --force
	git co -
	- git stash pop

test:
	cd SwiftlineTests; xctool -project Swiftline.xcodeproj -scheme Swiftline clean build test -sdk macosx GCC_INSTRUMENT_PROGRAM_FLOW_ARCS=YES GCC_GENERATE_TEST_COVERAGE_FILES=YES

test-spm:
	cd TestPackage && rm -rf .build
	cd TestPackage && swift build

build-spm:
	rm -rf .build
	swift build

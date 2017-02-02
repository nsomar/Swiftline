test:
	xcodebuild -project Swiftline.xcodeproj -scheme Swiftline build test

coverage:
	slather coverage Swiftline.xcodeproj

generate:
	swift package generate-xcodeproj --enable-code-coverage

doc:
	rm -rf docs
	make generate

	jazzy \
	--author "Omar Abdelhafith" \
	--author_url http://swifline.com \
	--github_url https://github.com/oarrabi/Swiftline/tree/master \
	--xcodebuild-arguments -scheme,Swiftline \
	--github-file-prefix https://github.com/oarrabi/Swiftline \
	--theme fullwidth
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

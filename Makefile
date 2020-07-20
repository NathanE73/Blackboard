BINARIES_FOLDER=bin
TEMPORARY_FOLDER=tmp

SWIFT_BUILD_FLAGS=--configuration release

BLACKBOARD_EXECUTABLE=$(shell swift build $(SWIFT_BUILD_FLAGS) --show-bin-path)/blackboard

VERSION_FILE=etc/version.txt
VERSION_STRING=$(shell cat "$(VERSION_FILE)")

.PHONY: project reset clean build test install portable-zip release get-version set-version git-tag pod-publish publish generate

project:
	rm -rf DerivedData/
	swift package generate-xcodeproj --enable-code-coverage

reset:
	swift package reset

clean:
	swift package clean

build:
	swift build $(SWIFT_BUILD_FLAGS)

test:
	swift test --parallel

install: build
	install -d "$(BINARIES_FOLDER)"
	install "$(BLACKBOARD_EXECUTABLE)" "$(BINARIES_FOLDER)"

portable-zip: install
	@mkdir -p "$(TEMPORARY_FOLDER)"
	zip -j - "$(BINARIES_FOLDER)/blackboard" "LICENSE" > "$(TEMPORARY_FOLDER)/portable-blackboard.zip"

release: clean portable-zip

get-version:
	@echo $(VERSION_STRING)

set-version:
	$(eval NEW_VERSION := $(filter-out $@,$(MAKECMDGOALS)))
	@echo "$(NEW_VERSION)" > "$(VERSION_FILE)"
	@sed -i '' '/var version/ s/"[^"][^"]*"/"$(NEW_VERSION)"/' Sources/Blackboard/Version.swift
	@sed -i '' '/^[[:blank:]]*s.version/ s/'\''[^'\''][^'\'']*'\''/'\''$(NEW_VERSION)'\''/' Blackboard.podspec
	@sed -i '' '/badge\/version/ s/-[^-][^-]*-/-$(NEW_VERSION)-/' README.md

git-tag:
ifneq ($(strip $(shell git status --untracked-files=no --porcelain 2>/dev/null)),)
	$(error git state is not clean)
endif
	git tag -a "$(VERSION_STRING)" -m "$(VERSION_STRING)"
	git push origin "$(VERSION_STRING)"

pod-publish:
	pod trunk push Blackboard.podspec --skip-import-validation --swift-version=4.2

publish: pod-publish

generate:
	bin/blackboard --input DeclarativeApp/Resources/ --output DeclarativeApp/Source/Generated
	bin/blackboard --input ExampleApp/Resources/ --output ExampleApp/Source/Generated

%:
	@:

BINARIES_FOLDER=bin
TEMPORARY_FOLDER=tmp

SWIFT_BUILD_FLAGS=--arch x86_64 --configuration release

BUILD_PATH=$(shell swift build $(SWIFT_BUILD_FLAGS) --show-bin-path)

BLACKBOARD_EXECUTABLE=blackboard
BLACKBOARD_BUNDLE=Blackboard_BlackboardFramework.bundle

PORTABLE_ZIP=portable-blackboard.zip

VERSION_FILE=.version
VERSION_STRING=$(shell cat "$(VERSION_FILE)")

.PHONY: clean build test install portable-zip release get-version set-version git-tag pod-publish publish generate

clean:
	swift package clean

build:
	swift build $(SWIFT_BUILD_FLAGS)

test:
	swift test --parallel

install: build
	install -d "$(BINARIES_FOLDER)"
	install "$(BUILD_PATH)/$(BLACKBOARD_EXECUTABLE)" "$(BINARIES_FOLDER)"
	rm -rf "$(BINARIES_FOLDER)/$(BLACKBOARD_BUNDLE)"
	cp -r "$(BUILD_PATH)/$(BLACKBOARD_BUNDLE)" "$(BINARIES_FOLDER)"

portable-zip: install
	mkdir -p "$(TEMPORARY_FOLDER)"
	zip -j - "$(BINARIES_FOLDER)/$(BLACKBOARD_EXECUTABLE)" "LICENSE" > "$(TEMPORARY_FOLDER)/$(PORTABLE_ZIP)"
	pushd "$(BINARIES_FOLDER)"; zip -ur "../$(TEMPORARY_FOLDER)/$(PORTABLE_ZIP)" "$(BLACKBOARD_BUNDLE)"

release: clean portable-zip

get-version:
	@echo $(VERSION_STRING)

set-version:
	$(eval NEW_VERSION := $(filter-out $@,$(MAKECMDGOALS)))
	@echo "$(NEW_VERSION)" > "$(VERSION_FILE)"
	@sed -i '' '/var version/ s/"[^"][^"]*"/"$(NEW_VERSION)"/' Sources/BlackboardFramework/Main/BlackboardVersion.swift
	@sed -i '' '/^[[:blank:]]*s.version/ s/'\''[^'\''][^'\'']*'\''/'\''$(NEW_VERSION)'\''/' Blackboard.podspec
	@sed -i '' '/badge\/version/ s/version-.*-bright/version-$(NEW_VERSION)-bright/' README.md

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
	bin/blackboard --input Shared/Resources/ DeclarativeApp/Resources/ --output DeclarativeApp/Source/Generated/
	bin/blackboard --input Shared/Resources/ ExampleApp/Resources/ --output ExampleApp/Source/Generated/

%:
	@:

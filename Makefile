
BINARIES_FOLDER=bin

SWIFT_BUILD_FLAGS=--configuration release -Xswiftc -static-stdlib

BLACKBOARD_EXECUTABLE=$(shell swift build $(SWIFT_BUILD_FLAGS) --show-bin-path)/blackboard

VERSION_FILE=etc/version.txt
VERSION_STRING=$(shell cat "$(VERSION_FILE)")

.PHONY: project reset clean build test version update-version release example

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

version:
	@echo $(VERSION_STRING)

update-version:
	@sed 's/__VERSION__/$(VERSION_STRING)/g' etc/Version.swift > Sources/Blackboard/Version.swift

release: clean update-version build
	install -d "$(BINARIES_FOLDER)"
	install "$(BLACKBOARD_EXECUTABLE)" "$(BINARIES_FOLDER)"

example:
	bin/blackboard ExampleApp/Resources/ ExampleApp/Source/Generated

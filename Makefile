
BINARIES_FOLDER=bin

SWIFT_BUILD_FLAGS=--configuration release

BLACKBOARD_EXECUTABLE=$(shell swift build $(SWIFT_BUILD_FLAGS) --show-bin-path)/blackboard

project:
	rm -rf DerivedData/
	swift package generate-xcodeproj

reset:
	swift package reset

clean:
	swift package clean

build:
	swift build $(SWIFT_BUILD_FLAGS)

test:
	swift test --parallel

release: clean build
	install -d "$(BINARIES_FOLDER)"
	install "$(BLACKBOARD_EXECUTABLE)" "$(BINARIES_FOLDER)"

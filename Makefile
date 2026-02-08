BINARIES_FOLDER=bin
TEMPORARY_FOLDER=tmp

SWIFT_BUILD_FLAGS=--arch arm64 --arch x86_64 --enable-dead-strip --configuration release 

BUILD_PATH=$(shell swift build $(SWIFT_BUILD_FLAGS) --show-bin-path)

BLACKBOARD_EXECUTABLE=blackboard

VERSION_FILE=.version
VERSION_STRING=$(shell cat "$(VERSION_FILE)")

.PHONY: default bootstrap clean build test install release get-version set-version git-tag lint generate resources

default:

bootstrap:
	mint bootstrap

clean:
	swift package clean

build:
	swift build $(SWIFT_BUILD_FLAGS)

test:
	swift test --parallel

install: build
	install -d "$(BINARIES_FOLDER)"
	install "$(BUILD_PATH)/$(BLACKBOARD_EXECUTABLE)" "$(BINARIES_FOLDER)"

release: clean install

get-version:
	@echo $(VERSION_STRING)

set-version:
	$(eval NEW_VERSION := $(filter-out $@,$(MAKECMDGOALS)))
	$(eval BADGE_VERSION := $(shell echo $(NEW_VERSION) | cut -d '-' -f 1))
	@echo "$(NEW_VERSION)" > "$(VERSION_FILE)"
	@sed -i '' '/var version/ s/"[^"][^"]*"/"$(NEW_VERSION)"/' Sources/BlackboardFramework/Main/BlackboardVersion.swift
	@sed -i '' '/badge\/version/ s/version-.*-bright/version-$(BADGE_VERSION)-bright/' README.md

git-tag:
    ifneq ($(strip $(shell git status --untracked-files=no --porcelain 2>/dev/null)),)
	    $(error git state is not clean)
    endif
	git tag -a "$(VERSION_STRING)" -m "$(VERSION_STRING)"
	git push origin "$(VERSION_STRING)"

lint:
	mint run swiftlint

generate:
	bin/blackboard --input Shared/Resources/ DeclarativeApp/Resources/ --output DeclarativeApp/Source/Generated/

resources:
	cat Templates/symbols/NameAliasesStringsResourceHeader.swift \
		Resources/symbols/name_aliases.strings \
		Templates/symbols/NameAliasesStringsResourceFooter.swift \
		> Sources/BlackboardFramework/Resources/NameAliasesStringsResource.swift
	cat Templates/symbols/NameAvailabilityResourceHeader.swift \
		Resources/symbols/name_availability.plist \
		Templates/symbols/NameAvailabilityResourceFooter.swift \
		> Sources/BlackboardFramework/Resources/NameAvailabilityResource.swift

%:
	@:

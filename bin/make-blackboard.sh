#!/bin/bash

BIN_ROOT=`dirname "$0"`
PROJECT_ROOT=`dirname "$BIN_ROOT"`

SOURCE="$PROJECT_ROOT/Blackboard/Source"
TARGET="$PROJECT_ROOT/build"

BLACKBOARD="$BIN_ROOT/blackboard"

VERSION=$(/usr/libexec/PlistBuddy -c "Print CFBundleShortVersionString" "$PROJECT_ROOT/Blackboard/Info.plist")

append() {
  while (( "$#" )); do

    echo -e "\n// MARK: - $1.swift -" >> "$BLACKBOARD"

    cat "$SOURCE/$1.swift" \
      | sed -n -e '/^import /,$p' \
      | sed -n -e '/^$/,$p' \
      | sed -e "s/#VERSION#/$VERSION/g" \
      >> "$BLACKBOARD"

    shift

  done
}

echo -e "#!/usr/bin/swift\n" > "$BLACKBOARD"

cat "$SOURCE/Header.swift" >> "$BLACKBOARD"

append String+NSString StringExtensions NSFileManagerExtensions \
  Closure Naming SwiftSource \
  Storyboard StoryboardCollectionViewCell StoryboardSegue StoryboardTableViewCell StoryboardViewController \
  BlackboardCollectionViewCell BlackboardSegue BlackboardStoryboard BlackboardTableViewCell BlackboardViewController \
  BlackboardMain

echo -e "\nBlackboardMain.run()" >> "$BLACKBOARD"

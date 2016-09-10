#!/bin/bash
#
# Copyright (c) 2016 Nathan E. Walczak
#
# MIT License
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
# THE SOFTWARE.
#

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

append String+NSString StringExtensions FileManagerExtensions \
  Naming SwiftSource \
  Storyboard StoryboardCollectionViewCell StoryboardSegue StoryboardTableViewCell StoryboardViewController \
  BlackboardCollectionViewCell BlackboardSegue BlackboardStoryboard BlackboardTableViewCell BlackboardViewController \
  BlackboardMain

echo -e "\nBlackboardMain.run()" >> "$BLACKBOARD"

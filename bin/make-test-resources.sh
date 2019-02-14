#!/bin/bash
#
# Copyright (c) 2018 Nathan E. Walczak
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

make_color_set_fixture () {
	COLOR_SET="$1"
	TARGET_NAME="$2ColorSetTestData"

	SOURCE="ExampleApp/Resources/Colors.xcassets/${COLOR_SET}.colorset/Contents.json"
	TARGET="Tests/BlackboardTests/Color Assets Fixtures/${TARGET_NAME}.swift"

	sed 's/__NAME__/'$TARGET_NAME'/g' etc/TestDataHeader.swift > "$TARGET"
	cat "$SOURCE" >> "$TARGET"
	echo "" >> "$TARGET"
	cat etc/TestDataFooter.swift >> "$TARGET"
}

make_image_set_fixture () {
	IMAGE_SET="$1"
	TARGET_NAME="$2ImageSetTestData"

	SOURCE="ExampleApp/Resources/Images.xcassets/${IMAGE_SET}.imageset/Contents.json"
	TARGET="Tests/BlackboardTests/Image Assets Fixtures/${TARGET_NAME}.swift"

	sed 's/__NAME__/'$TARGET_NAME'/g' etc/TestDataHeader.swift > "$TARGET"
	cat "$SOURCE" >> "$TARGET"
	echo "" >> "$TARGET"
	cat etc/TestDataFooter.swift >> "$TARGET"
}

make_storyboard_fixture () {
	STORYBOARD_NAME="$1"
	TARGET_NAME="$2StoryboardTestData"

	SOURCE="ExampleApp/Resources/Storyboards/Base.lproj/${STORYBOARD_NAME}.storyboard"
	TARGET="Tests/BlackboardTests/Storyboards Fixtures/${TARGET_NAME}.swift"

	sed 's/__NAME__/'$TARGET_NAME'/g' etc/TestDataHeader.swift > "$TARGET"
	cat "$SOURCE" >> "$TARGET"
	echo "" >> "$TARGET"
	cat etc/TestDataFooter.swift >> "$TARGET"
}

make_swift_source_fixture () {
	FIXTURE_GROUP="Tests/BlackboardTests/$1"
	TARGET_NAME="$3SwiftSourceTestData"

	SOURCE="ExampleApp/Source/Generated/$2.swift"
	TARGET="$FIXTURE_GROUP/$TARGET_NAME.swift"

	sed 's/__NAME__/'$TARGET_NAME'/g' etc/TestDataHeader.swift > "$TARGET"
	cat "$SOURCE" >> "$TARGET"
	echo "" >> "$TARGET"
	cat etc/SwiftSourceTestDataFooter.swift >> "$TARGET"
}

# Color Asset Fixtures

make_color_set_fixture "Absolute Zero" "AbsoluteZero"
make_color_set_fixture "Bisque" "Bisque"
make_color_set_fixture "Charcoal" "Charcoal"
make_color_set_fixture "dark-olive-green" "DarkOliveGreen"
make_color_set_fixture "Desire" "Desire"
make_color_set_fixture "Emerald" "Emerald"
make_color_set_fixture "Empty" "Empty"
make_color_set_fixture "firebrick-color" "Firebrick"
make_color_set_fixture "maroon color" "Maroon"
make_color_set_fixture "Night" "Night"

make_swift_source_fixture "Color Assets Fixtures" "CGColorExtensions" "BlackboardCGColor"
make_swift_source_fixture "Color Assets Fixtures" "UIColorExtensions" "BlackboardUIColor"

# Image Asset Fixtures

make_image_set_fixture "apple" "Apple"
make_image_set_fixture "big_apple" "BigApple"
make_image_set_fixture "everything--apple" "EverythingApple"
make_image_set_fixture "large-apple" "LargeApple"
make_image_set_fixture "RedApple" "RedApple"
make_image_set_fixture "small apple" "SmallApple"
make_image_set_fixture "television" "Television"

make_swift_source_fixture "Image Assets Fixtures" "UIImageExtensions" "BlackboardUIImage"

# Storyboard Fixtures

make_storyboard_fixture "Collection" "Collection"
make_storyboard_fixture "Empty" "Empty"
make_storyboard_fixture "LaunchScreen" "LaunchScreen"
make_storyboard_fixture "Main" "Main"
make_storyboard_fixture "Navigation" "Navigation"
make_storyboard_fixture "Table" "Table"

make_swift_source_fixture "Storyboards Fixtures" "CollectionStoryboardExtensions" "CollectionStoryboard"
make_swift_source_fixture "Storyboards Fixtures" "MainStoryboardExtensions" "MainStoryboard"
make_swift_source_fixture "Storyboards Fixtures" "NavigationStoryboardExtensions" "NavigationStoryboard"
make_swift_source_fixture "Storyboards Fixtures" "TableStoryboardExtensions" "TableStoryboard"

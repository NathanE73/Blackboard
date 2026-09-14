#!/bin/zsh

if [ -d "/Applications/SF Symbols Beta.app" ]; then \
	echo "Importing SF Symbols Beta resources"
	cp "/Applications/SF Symbols Beta.app/Contents/Resources/Metadata/name_aliases.strings" \
		Resources/symbols
	cp "/Applications/SF Symbols Beta.app/Contents/Resources/Metadata/name_availability.plist" \
		Resources/symbols
elif [ -d "/Applications/SF Symbols.app" ]; then
	echo "Importing SF Symbols resources"
	cp "/Applications/SF Symbols.app/Contents/Resources/Metadata/name_aliases.strings" \
		Resources/symbols
	cp "/Applications/SF Symbols.app/Contents/Resources/Metadata/name_availability.plist" \
		Resources/symbols
fi

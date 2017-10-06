#!/bin/bash

declare -a langs=("de" "en-GB" "es" "fr" "it" "ja" "ko" "pl" "pt" "ru" "tr" "zh-CN" "zh-TW")

for i in "${langs[@]}"
do

	echo "Importing Language $i"
	xcodebuild -importLocalizations -localizationPath "$1$i.xliff" -project "$2"
done

# HOW TO USE IT
# 1. Open Terminal
# 2. run command with your inputs -> sh iconResize.sh imageFile outputDirectory prefixFilename

#!/bin/sh

# Get file
FILE=$1
DESTINATION_FOLDER=$2
PREFIX=$3

# iOS Sizes
# 29 @1x @2x @3x
# 40 @1x @2x @3x
# 60 @1x @2x @3x
# 76 @1x @2x

sizes=(29 40 50 57 60 72 76)

for size in ${sizes[@]}
do
    echo "Processing size $size px"
    let oneTimes=$size
    let twoTimes=($size*2)
    let threeTimes=($size*3)

    # @1x
    sips -s format png --resampleHeightWidth $oneTimes $oneTimes "${FILE}" --out "${DESTINATION_FOLDER}/${PREFIX}_${size}px.png"

    # @2x
    sips -s format png --resampleHeightWidth $twoTimes $twoTimes "${FILE}" --out "${DESTINATION_FOLDER}/${PREFIX}_${size}px@2x.png"

    # @3x
    sips -s format png --resampleHeightWidth $threeTimes $threeTimes "${FILE}" --out "${DESTINATION_FOLDER}/${PREFIX}_${size}px@3x.png"

    echo "Done"
    echo "................."

done
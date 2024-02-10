#!/bin/bash
DIR_PREFIX=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
CONFIG_FILE="${DIR_PREFIX}/../../EFI/OC/config.plist"
VARIABLES_FILE="${DIR_PREFIX}/platformInfo"

ensure_file_exists() {
    if [ ! -e $1 ]; then
        echo "File '$1' not found!"

        exit 1
    fi
}

apply_plutil_value() {
    plutil -replace "$1" "-$2" "$3" $CONFIG_FILE && echo "$1: $3 ($2)"
}

ensure_file_exists $CONFIG_FILE
ensure_file_exists $VARIABLES_FILE

source $VARIABLES_FILE

case "$1" in
        --apply) 
            apply_plutil_value "PlatformInfo.Generic.MLB" "string" $MLB
            apply_plutil_value "PlatformInfo.Generic.ROM" "data" $ROM
            apply_plutil_value "PlatformInfo.Generic.SystemSerialNumber" "string" $SystemSerialNumber
            apply_plutil_value "PlatformInfo.Generic.SystemUUID" "string" $SystemUUID

            echo "APPLIED!"

            exit 0
            ;;
        --revert) 
            apply_plutil_value "PlatformInfo.Generic.MLB" "string" "[REPLACE]"
            apply_plutil_value "PlatformInfo.Generic.ROM" "string" "[REPLACE]"
            apply_plutil_value "PlatformInfo.Generic.SystemSerialNumber" "string" "[REPLACE]"
            apply_plutil_value "PlatformInfo.Generic.SystemUUID" "string" "[REPLACE]"

            echo "REVERTED!"

            exit 0
            ;;
        *)
            echo "Nothing to do."

            exit 0
            ;;
    esac
exit 0





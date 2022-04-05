#!/bin/bash
DIR_PREFIX=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)

plutil -replace PlatformInfo.Generic.MLB -string "[REPLACE]" ${DIR_PREFIX}/../../EFI/OC/config.plist
plutil -replace PlatformInfo.Generic.ROM -string "[REPLACE]" ${DIR_PREFIX}/../../EFI/OC/config.plist
plutil -replace PlatformInfo.Generic.SystemSerialNumber -string "[REPLACE]" ${DIR_PREFIX}/../../EFI/OC/config.plist
plutil -replace PlatformInfo.Generic.SystemUUID -string "[REPLACE]" ${DIR_PREFIX}/../../EFI/OC/config.plist
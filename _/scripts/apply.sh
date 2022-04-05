#!/bin/bash
DIR_PREFIX=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
source ${DIR_PREFIX}/platformInfo

plutil -replace PlatformInfo.Generic.MLB -string ${MLB} ${DIR_PREFIX}/../../EFI/OC/config.plist
plutil -replace PlatformInfo.Generic.ROM -data ${ROM} ${DIR_PREFIX}/../../EFI/OC/config.plist
plutil -replace PlatformInfo.Generic.SystemSerialNumber -string ${SystemSerialNumber} ${DIR_PREFIX}/../../EFI/OC/config.plist
plutil -replace PlatformInfo.Generic.SystemUUID -string ${SystemUUID} ${DIR_PREFIX}/../../EFI/OC/config.plist
# Gigabyte Z690 Gaming X DDR4 + i7 12700K + RX 5700 XT

## Last Updated Configuration Summary
- Mac OS Sequoia 15.5
- OpenCore: 1.0.4

## Hardware Specification
![Motherboard](/_/mobo.png)

| Component      | Model                                              | Notes                                                                                                                                                                                           |
|----------------|----------------------------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Motherboard    | Gigabyte Z690 Gaming X DDR4 rev1.0                 | [BIOS Version = F8b](/BIOS/Z690GAMINGXDDR4.F8b)                                                                                                                                                 |
| CPU            | Intel i7-12700K                                    | 8 P-Cores, 4 E-Cores, 12 P-Cores, All enabled                                                                                                                                                   |
| CPU Cooling    | MSI MAG Core Liquid 360R V2 3x120mm                |                                                                                                                                                                                                 |
| RAM            | Crucial 32GB (2x16GB) 3600MHz CL16 Ballistix Black | XMP Profile 1 - 3.6 GHz enabled, up to 5.2 GHz in macOS                                                                                                                                         |
| iGPU           | Intel UHD 770                                      | not supported in macOS (yet?)                                                                                                                                                                   |
| dGPU           | Sapphire Radeon RX 5700 XT NITRO+ 8GB GDDR5        | `agdpmod=pikera` flag is needed to work OOB                                                                                                                                                     |
| Drive          | Gigabyte 1TB M.2 PCIe Gen4 NVMe AORUS 7000s        |                                                                                                                                                                                                 |
| WiFi/Bluetooth | [WTXUP TX-AC94360](/_/wifi+bt.png)                 | uses chip Broadcom BCM94360CD, works OOB, but since Sonoma - it needs OpenCore-Legacy-Patcher root patches to be applied, other requirements are fulfilled already in this repo - configuration |
| Power Supply   | Corsair CX750M 750W 80 Plus Bronze                 |                                                                                                                                                                                                 |
| Case           | SilentiumPC Signum SG7V EVO TG ARGB                |                                                                                                                                                                                                 |

## Config
- SMBIOS used - [MacPro7,1](https://everymac.com/ultimate-mac-lookup/?search_keywords=MacPro7,1) ~~[iMacPro1,1](https://everymac.com/ultimate-mac-lookup/?search_keywords=iMacPro1,1)~~
- `agdpmod=pikera` for AMD dGPU
- [PlatformInfo](https://dortania.github.io/OpenCore-Install-Guide/config.plist/comet-lake.html#platforminfo)
    1. Copy `_/scripts/platformInfo.dist` file to `_scripts/platformInfo` and fullfill platformInfo parameters inside this file
    2. Then:
        1. To APPLY parameters to config.plist use command: `sh _/scripts/run.sh --apply`
        2. To REVERT parameters from config.plist use command: `sh _/scripts/run.sh --revert`
    3. You can also use OpenCore Configurator to generate & fill automatically OR use GenSMBIOS to generate only
    4. Remember to use correct SMBIOS Type when generating
    5. Scripts are included for faster cleaning unnecessary parameters on my end

## BIOS
- Tweaker > XMP = Profile 1
- Tweaker > Advanced CPU Settings > Hyper Threading Technology = on
- Tweaker > Advanced CPU Settings > CPU Cores Enabling Mode = Selectable Mode
- Tweaker > Advanced CPU Settings > Enable All Cores (P+E)
- Settings > IOPorts > Internal Graphics = on
- Settings > IOPorts > HD Audio Controller = on
- Settings > IOPorts > Above 4G Encoding = on
- Settings > IOPorts > Re-Size BAR Support = on
- Settings > IOPorts > USB Configuration > XHCI Hand-off = on
- Settings > IOPorts > SATA Configuration > SATA Mode = AHCI
- Settings > Miscellaneous > Intel Platform Trust Technology = on
- Settings > Miscellaneous > VT-d = on
- Boot > CFG-Lock = off
- Boot > Fast Boot = off
- Boot > Windows 10 Features = Windows 10
- Boot > CSM Support = off

## Overclocking
None for now, TBD

## What works/doesn't work
- [x] Sleep/Wake
- [x] Shutdown/Reboot
- [x] Audio
- [x] Video
- [x] WiFi + Bluetooth
- [x] Ethernet
- [x] All USB ports
- [x] HEVC, H.264
- [x] iCloud, Continuity, AirDrop, Universal Control, Unlock with Apple Watch
- [x] iMessage, FaceTime, Mac AppStore, iTunes Store
- [x] Update to newer macOS builds
- [ ] SideCar (T2 Security Chip is missing & compatible iGPU is mandatory)

## Kexts used:
| Kext                         | Version              |
|------------------------------|----------------------|
| AppleALC.kext                | 1.9.4                |
| Lilu.kext                    | 1.7.0                |
| WhateverGreen.kext           | 1.6.9                |
| VirtualSMC.kext              | 1.3.6                |
| SMCProcessor.kext            | 1.3.5                |
| SMCSuperIO.kext              | 1.3.5                |
| NVMeFix.kext                 | 1.1.2                |
| RestrictEvents.kext          | 1.1.5                |
| LucyRTL8125Ethernet.kext     | 2021-04-29           |
| USBWakeFixup.kext            | 1.0                  |
| USBInjectAll.kext            | for USB mapping only |
| USBMap_GA-Z690-Gaming-X.kext | dedicated            |
| CPUFriend.kext               | dedicated            |
| CPUFriendDataProvider.kext   | dedicated            |
| AMFIPass.kext                | 1.4.1                |
| IO82011FamilyLegacy.kext     | 1.0.0                |
| IOSkywalkFamily.kext         | 1.1.0                |

## USB Mapping:
![USB Mapping Scheme](/_/usb_darkMode.png#gh-dark-mode-only)
![USB Mapping Scheme](/_/usb_lightMode.png#gh-light-mode-only)

## Performance Results:
![Geekbench Summary](/_/geekbench_MacPro7,1.png)
- [Result MacPro7,1](https://browser.geekbench.com/v6/cpu/12363533)
- ~~[Result iMacPro1,1](https://browser.geekbench.com/v5/cpu/14144616)~~
  
## Thanks/Credits
- [Opencore Team](https://dortania.github.io/getting-started/)
- tonymacx86.com - special thanks to [@CaseySJ's Z690 EFI base](https://www.tonymacx86.com/threads/gigabyte-z690-aero-g-i5-12600k-amd-rx-6800-xt.317179/)
- tonymacx86.com - [@felbo's build](https://www.tonymacx86.com/threads/felbos-build-gigabyte-z690-gaming-x-ddr4-i7-12700k-amd-rx-580.319197/)

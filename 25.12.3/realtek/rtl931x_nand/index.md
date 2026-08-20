---
layout: default
title: "OpenWrt 25.12.3 realtek/rtl931x_nand"
---

# AmneziaWG feed

Index of [(root)](https://janeblower.github.io/awg-openwrt/) / [25.12.3](https://janeblower.github.io/awg-openwrt/25.12.3/) / [realtek](https://janeblower.github.io/awg-openwrt/25.12.3/realtek/)

- OpenWrt version: `25.12.3`
- Target: `realtek`
- Subtarget: `rtl931x_nand`
- Package architecture: `mips_24kc`

## Upstream OpenWrt target

[https://downloads.openwrt.org/releases/25.12.3/targets/realtek/rtl931x_nand/](https://downloads.openwrt.org/releases/25.12.3/targets/realtek/rtl931x_nand/)

## Configure Feed

```sh
mkdir -p /etc/apk/keys
wget -O /etc/apk/keys/awg-openwrt-feed.pem "https://janeblower.github.io/awg-openwrt/keys/awg-openwrt-feed.pem"
echo "https://janeblower.github.io/awg-openwrt/25.12.3/realtek/rtl931x_nand/packages.adb" >> /etc/apk/repositories.d/customfeeds.list
```

## Install Packages

```sh
apk update
apk add amneziawg-tools kmod-amneziawg luci-proto-amneziawg
```

<script src="https://janeblower.github.io/awg-openwrt/assets/copy-code.js?v=2"></script>

## Feed files

- [amneziawg-tools-3.1.20260812-r1.apk](https://janeblower.github.io/awg-openwrt/25.12.3/realtek/rtl931x_nand/amneziawg-tools-3.1.20260812-r1.apk)
- [feed.json](https://janeblower.github.io/awg-openwrt/25.12.3/realtek/rtl931x_nand/feed.json)
- [index.json](https://janeblower.github.io/awg-openwrt/25.12.3/realtek/rtl931x_nand/index.json)
- [kmod-amneziawg-6.12.85.3.1.20260812-r1.apk](https://janeblower.github.io/awg-openwrt/25.12.3/realtek/rtl931x_nand/kmod-amneziawg-6.12.85.3.1.20260812-r1.apk)
- [luci-i18n-amneziawg-ru-0.260820.59603.apk](https://janeblower.github.io/awg-openwrt/25.12.3/realtek/rtl931x_nand/luci-i18n-amneziawg-ru-0.260820.59603.apk)
- [luci-proto-amneziawg-3.1.0-r1.apk](https://janeblower.github.io/awg-openwrt/25.12.3/realtek/rtl931x_nand/luci-proto-amneziawg-3.1.0-r1.apk)
- [packages.adb](https://janeblower.github.io/awg-openwrt/25.12.3/realtek/rtl931x_nand/packages.adb)

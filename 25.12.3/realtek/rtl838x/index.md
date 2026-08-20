---
layout: default
title: "OpenWrt 25.12.3 realtek/rtl838x"
---

# AmneziaWG feed

Index of [(root)](https://janeblower.github.io/awg-openwrt/) / [25.12.3](https://janeblower.github.io/awg-openwrt/25.12.3/) / [realtek](https://janeblower.github.io/awg-openwrt/25.12.3/realtek/)

- OpenWrt version: `25.12.3`
- Target: `realtek`
- Subtarget: `rtl838x`
- Package architecture: `mips_24kc`

## Upstream OpenWrt target

[https://downloads.openwrt.org/releases/25.12.3/targets/realtek/rtl838x/](https://downloads.openwrt.org/releases/25.12.3/targets/realtek/rtl838x/)

## Configure Feed

```sh
mkdir -p /etc/apk/keys
wget -O /etc/apk/keys/awg-openwrt-feed.pem "https://janeblower.github.io/awg-openwrt/keys/awg-openwrt-feed.pem"
echo "https://janeblower.github.io/awg-openwrt/25.12.3/realtek/rtl838x/packages.adb" >> /etc/apk/repositories.d/customfeeds.list
```

## Install Packages

```sh
apk update
apk add amneziawg-tools kmod-amneziawg luci-proto-amneziawg
```

<script src="https://janeblower.github.io/awg-openwrt/assets/copy-code.js?v=2"></script>

## Feed files

- [amneziawg-tools-3.1.20260812-r1.apk](https://janeblower.github.io/awg-openwrt/25.12.3/realtek/rtl838x/amneziawg-tools-3.1.20260812-r1.apk)
- [feed.json](https://janeblower.github.io/awg-openwrt/25.12.3/realtek/rtl838x/feed.json)
- [index.json](https://janeblower.github.io/awg-openwrt/25.12.3/realtek/rtl838x/index.json)
- [kmod-amneziawg-6.12.85.3.1.20260812-r1.apk](https://janeblower.github.io/awg-openwrt/25.12.3/realtek/rtl838x/kmod-amneziawg-6.12.85.3.1.20260812-r1.apk)
- [luci-i18n-amneziawg-ru-0.260820.59791.apk](https://janeblower.github.io/awg-openwrt/25.12.3/realtek/rtl838x/luci-i18n-amneziawg-ru-0.260820.59791.apk)
- [luci-proto-amneziawg-3.1.0-r1.apk](https://janeblower.github.io/awg-openwrt/25.12.3/realtek/rtl838x/luci-proto-amneziawg-3.1.0-r1.apk)
- [packages.adb](https://janeblower.github.io/awg-openwrt/25.12.3/realtek/rtl838x/packages.adb)

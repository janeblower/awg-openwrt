---
layout: default
title: "OpenWrt 25.12.5 ipq40xx/chromium"
---

# AmneziaWG feed

Index of [(root)](https://janeblower.github.io/awg-openwrt/) / [25.12.5](https://janeblower.github.io/awg-openwrt/25.12.5/) / [ipq40xx](https://janeblower.github.io/awg-openwrt/25.12.5/ipq40xx/)

- OpenWrt version: `25.12.5`
- Target: `ipq40xx`
- Subtarget: `chromium`
- Package architecture: `arm_cortex-a7_neon-vfpv4`

## Upstream OpenWrt target

[https://downloads.openwrt.org/releases/25.12.5/targets/ipq40xx/chromium/](https://downloads.openwrt.org/releases/25.12.5/targets/ipq40xx/chromium/)

## Configure Feed

```sh
mkdir -p /etc/apk/keys
wget -O /etc/apk/keys/awg-openwrt-feed.pem "https://janeblower.github.io/awg-openwrt/keys/awg-openwrt-feed.pem"
echo "https://janeblower.github.io/awg-openwrt/25.12.5/ipq40xx/chromium/packages.adb" >> /etc/apk/repositories.d/customfeeds.list
```

## Install Packages

```sh
apk update
apk add amneziawg-tools kmod-amneziawg luci-proto-amneziawg
```

<script src="https://janeblower.github.io/awg-openwrt/assets/copy-code.js?v=2"></script>

## Feed files

- [amneziawg-tools-3.1.20260812-r1.apk](https://janeblower.github.io/awg-openwrt/25.12.5/ipq40xx/chromium/amneziawg-tools-3.1.20260812-r1.apk)
- [feed.json](https://janeblower.github.io/awg-openwrt/25.12.5/ipq40xx/chromium/feed.json)
- [index.json](https://janeblower.github.io/awg-openwrt/25.12.5/ipq40xx/chromium/index.json)
- [kmod-amneziawg-6.12.94.3.1.20260812-r1.apk](https://janeblower.github.io/awg-openwrt/25.12.5/ipq40xx/chromium/kmod-amneziawg-6.12.94.3.1.20260812-r1.apk)
- [luci-i18n-amneziawg-ru-0.260820.50202.apk](https://janeblower.github.io/awg-openwrt/25.12.5/ipq40xx/chromium/luci-i18n-amneziawg-ru-0.260820.50202.apk)
- [luci-proto-amneziawg-3.1.0-r1.apk](https://janeblower.github.io/awg-openwrt/25.12.5/ipq40xx/chromium/luci-proto-amneziawg-3.1.0-r1.apk)
- [packages.adb](https://janeblower.github.io/awg-openwrt/25.12.5/ipq40xx/chromium/packages.adb)

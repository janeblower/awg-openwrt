---
layout: default
title: "OpenWrt 25.12.3 ipq40xx/generic"
---

# AmneziaWG feed

Index of [(root)](https://janeblower.github.io/awg-openwrt/) / [25.12.3](https://janeblower.github.io/awg-openwrt/25.12.3/) / [ipq40xx](https://janeblower.github.io/awg-openwrt/25.12.3/ipq40xx/)

- OpenWrt version: `25.12.3`
- Target: `ipq40xx`
- Subtarget: `generic`
- Package architecture: `arm_cortex-a7_neon-vfpv4`

## Upstream OpenWrt target

[https://downloads.openwrt.org/releases/25.12.3/targets/ipq40xx/generic/](https://downloads.openwrt.org/releases/25.12.3/targets/ipq40xx/generic/)

## Configure Feed

```sh
mkdir -p /etc/apk/keys
wget -O /etc/apk/keys/awg-openwrt-feed.pem "https://janeblower.github.io/awg-openwrt/keys/awg-openwrt-feed.pem"
echo "https://janeblower.github.io/awg-openwrt/25.12.3/ipq40xx/generic/packages.adb" >> /etc/apk/repositories.d/customfeeds.list
```

## Install Packages

```sh
apk update
apk add amneziawg-tools kmod-amneziawg luci-proto-amneziawg
```

<script src="https://janeblower.github.io/awg-openwrt/assets/copy-code.js?v=2"></script>

## Feed files

- [amneziawg-tools-3.1.20260812-r1.apk](https://janeblower.github.io/awg-openwrt/25.12.3/ipq40xx/generic/amneziawg-tools-3.1.20260812-r1.apk)
- [feed.json](https://janeblower.github.io/awg-openwrt/25.12.3/ipq40xx/generic/feed.json)
- [index.json](https://janeblower.github.io/awg-openwrt/25.12.3/ipq40xx/generic/index.json)
- [kmod-amneziawg-6.12.85.3.1.20260812-r1.apk](https://janeblower.github.io/awg-openwrt/25.12.3/ipq40xx/generic/kmod-amneziawg-6.12.85.3.1.20260812-r1.apk)
- [luci-i18n-amneziawg-ru-0.260820.57965.apk](https://janeblower.github.io/awg-openwrt/25.12.3/ipq40xx/generic/luci-i18n-amneziawg-ru-0.260820.57965.apk)
- [luci-proto-amneziawg-3.1.0-r1.apk](https://janeblower.github.io/awg-openwrt/25.12.3/ipq40xx/generic/luci-proto-amneziawg-3.1.0-r1.apk)
- [packages.adb](https://janeblower.github.io/awg-openwrt/25.12.3/ipq40xx/generic/packages.adb)

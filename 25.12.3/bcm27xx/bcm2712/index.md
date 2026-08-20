---
layout: default
title: "OpenWrt 25.12.3 bcm27xx/bcm2712"
---

# AmneziaWG feed

Index of [(root)](https://janeblower.github.io/awg-openwrt/) / [25.12.3](https://janeblower.github.io/awg-openwrt/25.12.3/) / [bcm27xx](https://janeblower.github.io/awg-openwrt/25.12.3/bcm27xx/)

- OpenWrt version: `25.12.3`
- Target: `bcm27xx`
- Subtarget: `bcm2712`
- Package architecture: `aarch64_cortex-a76`

## Upstream OpenWrt target

[https://downloads.openwrt.org/releases/25.12.3/targets/bcm27xx/bcm2712/](https://downloads.openwrt.org/releases/25.12.3/targets/bcm27xx/bcm2712/)

## Configure Feed

```sh
mkdir -p /etc/apk/keys
wget -O /etc/apk/keys/awg-openwrt-feed.pem "https://janeblower.github.io/awg-openwrt/keys/awg-openwrt-feed.pem"
echo "https://janeblower.github.io/awg-openwrt/25.12.3/bcm27xx/bcm2712/packages.adb" >> /etc/apk/repositories.d/customfeeds.list
```

## Install Packages

```sh
apk update
apk add amneziawg-tools kmod-amneziawg luci-proto-amneziawg
```

<script src="https://janeblower.github.io/awg-openwrt/assets/copy-code.js?v=2"></script>

## Feed files

- [amneziawg-tools-3.1.20260812-r1.apk](https://janeblower.github.io/awg-openwrt/25.12.3/bcm27xx/bcm2712/amneziawg-tools-3.1.20260812-r1.apk)
- [feed.json](https://janeblower.github.io/awg-openwrt/25.12.3/bcm27xx/bcm2712/feed.json)
- [index.json](https://janeblower.github.io/awg-openwrt/25.12.3/bcm27xx/bcm2712/index.json)
- [kmod-amneziawg-6.12.85.3.1.20260812-r1.apk](https://janeblower.github.io/awg-openwrt/25.12.3/bcm27xx/bcm2712/kmod-amneziawg-6.12.85.3.1.20260812-r1.apk)
- [luci-i18n-amneziawg-ru-0.260820.56992.apk](https://janeblower.github.io/awg-openwrt/25.12.3/bcm27xx/bcm2712/luci-i18n-amneziawg-ru-0.260820.56992.apk)
- [luci-proto-amneziawg-3.1.0-r1.apk](https://janeblower.github.io/awg-openwrt/25.12.3/bcm27xx/bcm2712/luci-proto-amneziawg-3.1.0-r1.apk)
- [packages.adb](https://janeblower.github.io/awg-openwrt/25.12.3/bcm27xx/bcm2712/packages.adb)

---
layout: default
title: "OpenWrt 25.12.5 malta/le"
---

# AmneziaWG feed

Index of [(root)](https://janeblower.github.io/awg-openwrt/) / [25.12.5](https://janeblower.github.io/awg-openwrt/25.12.5/) / [malta](https://janeblower.github.io/awg-openwrt/25.12.5/malta/)

- OpenWrt version: `25.12.5`
- Target: `malta`
- Subtarget: `le`
- Package architecture: `mipsel_24kc`

## Upstream OpenWrt target

[https://downloads.openwrt.org/releases/25.12.5/targets/malta/le/](https://downloads.openwrt.org/releases/25.12.5/targets/malta/le/)

## Configure Feed

```sh
mkdir -p /etc/apk/keys
wget -O /etc/apk/keys/awg-openwrt-feed.pem "https://janeblower.github.io/awg-openwrt/keys/awg-openwrt-feed.pem"
echo "https://janeblower.github.io/awg-openwrt/25.12.5/malta/le/packages.adb" >> /etc/apk/repositories.d/customfeeds.list
```

## Install Packages

```sh
apk update
apk add amneziawg-tools kmod-amneziawg luci-proto-amneziawg
```

<script src="https://janeblower.github.io/awg-openwrt/assets/copy-code.js?v=2"></script>

## Feed files

- [amneziawg-tools-3.1.20260812-r1.apk](https://janeblower.github.io/awg-openwrt/25.12.5/malta/le/amneziawg-tools-3.1.20260812-r1.apk)
- [feed.json](https://janeblower.github.io/awg-openwrt/25.12.5/malta/le/feed.json)
- [index.json](https://janeblower.github.io/awg-openwrt/25.12.5/malta/le/index.json)
- [kmod-amneziawg-6.12.94.3.1.20260812-r1.apk](https://janeblower.github.io/awg-openwrt/25.12.5/malta/le/kmod-amneziawg-6.12.94.3.1.20260812-r1.apk)
- [luci-i18n-amneziawg-ru-0.260820.49295.apk](https://janeblower.github.io/awg-openwrt/25.12.5/malta/le/luci-i18n-amneziawg-ru-0.260820.49295.apk)
- [luci-proto-amneziawg-3.1.0-r1.apk](https://janeblower.github.io/awg-openwrt/25.12.5/malta/le/luci-proto-amneziawg-3.1.0-r1.apk)
- [packages.adb](https://janeblower.github.io/awg-openwrt/25.12.5/malta/le/packages.adb)

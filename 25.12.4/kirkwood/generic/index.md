---
layout: default
title: "OpenWrt 25.12.4 kirkwood/generic"
---

# AmneziaWG feed

Index of [(root)](https://janeblower.github.io/awg-openwrt/) / [25.12.4](https://janeblower.github.io/awg-openwrt/25.12.4/) / [kirkwood](https://janeblower.github.io/awg-openwrt/25.12.4/kirkwood/)

- OpenWrt version: `25.12.4`
- Target: `kirkwood`
- Subtarget: `generic`
- Package architecture: `arm_xscale`

## Upstream OpenWrt target

[https://downloads.openwrt.org/releases/25.12.4/targets/kirkwood/generic/](https://downloads.openwrt.org/releases/25.12.4/targets/kirkwood/generic/)

## Configure Feed

```sh
mkdir -p /etc/apk/keys
wget -O /etc/apk/keys/awg-openwrt-feed.pem "https://janeblower.github.io/awg-openwrt/keys/awg-openwrt-feed.pem"
echo "https://janeblower.github.io/awg-openwrt/25.12.4/kirkwood/generic/packages.adb" >> /etc/apk/repositories.d/customfeeds.list
```

## Install Packages

```sh
apk update
apk add amneziawg-tools kmod-amneziawg luci-proto-amneziawg
```

<script src="https://janeblower.github.io/awg-openwrt/assets/copy-code.js?v=2"></script>

## Feed files

- [amneziawg-tools-3.1.20260812-r1.apk](https://janeblower.github.io/awg-openwrt/25.12.4/kirkwood/generic/amneziawg-tools-3.1.20260812-r1.apk)
- [feed.json](https://janeblower.github.io/awg-openwrt/25.12.4/kirkwood/generic/feed.json)
- [index.json](https://janeblower.github.io/awg-openwrt/25.12.4/kirkwood/generic/index.json)
- [kmod-amneziawg-6.12.87.3.1.20260812-r1.apk](https://janeblower.github.io/awg-openwrt/25.12.4/kirkwood/generic/kmod-amneziawg-6.12.87.3.1.20260812-r1.apk)
- [luci-i18n-amneziawg-ru-0.260820.54554.apk](https://janeblower.github.io/awg-openwrt/25.12.4/kirkwood/generic/luci-i18n-amneziawg-ru-0.260820.54554.apk)
- [luci-proto-amneziawg-3.1.0-r1.apk](https://janeblower.github.io/awg-openwrt/25.12.4/kirkwood/generic/luci-proto-amneziawg-3.1.0-r1.apk)
- [packages.adb](https://janeblower.github.io/awg-openwrt/25.12.4/kirkwood/generic/packages.adb)

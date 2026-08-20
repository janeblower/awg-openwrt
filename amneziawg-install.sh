#!/bin/sh

#set -x

FEED_URL="https://janeblower.github.io/awg-openwrt"

usage() {
    cat <<EOF
Usage: ${0##*/} [-h] [-e] [-n]
    -h    show this help
    -e    do not install 'luci-i18n-amneziawg-ru' package
    -n    do not configure the amneziawg interface
EOF
    exit 0
}

require_apk() {
    if ! command -v apk >/dev/null 2>&1; then
        printf "\033[32;1mapk not found. AWG 3.1 packages are published as an apk feed for OpenWRT 25.x and newer.\033[0m\n"
        exit 1
    fi
}

#Репозиторий OpenWRT должен быть доступен для установки зависимостей пакета kmod-amneziawg
check_repo() {
    printf "\033[32;1mChecking OpenWrt repo availability...\033[0m\n"
    apk update >/dev/null 2>&1 || \
        { printf "\033[32;1mapk failed. Check internet or date. Command for force ntp sync: ntpd -p ptbtime1.ptb.de\033[0m\n"; exit 1; }
}

install_awg_packages() {
    TARGET=$(ubus call system board | jsonfilter -e '@.release.target' | cut -d '/' -f 1)
    SUBTARGET=$(ubus call system board | jsonfilter -e '@.release.target' | cut -d '/' -f 2)
    VERSION=$(ubus call system board | jsonfilter -e '@.release.version')
    MAJOR_VERSION=$(echo "$VERSION" | cut -d '.' -f 1)

    if [ "$MAJOR_VERSION" -lt 25 ]; then
        printf "\033[32;1mOpenWRT $VERSION is not supported: the AWG 3.1 feed requires OpenWRT 25.x or newer\033[0m\n"
        exit 1
    fi

    printf "\033[32;1mInstalling AmneziaWG 3.1 for OpenWRT $VERSION ($TARGET/$SUBTARGET)\033[0m\n"

    # Публичный ключ нужен apk, чтобы проверить подпись метаданных фида
    mkdir -p /etc/apk/keys
    if ! wget -q -O /etc/apk/keys/awg-openwrt-feed.pem "${FEED_URL}/keys/awg-openwrt-feed.pem"; then
        rm -f /etc/apk/keys/awg-openwrt-feed.pem
        printf "\033[32;1mError downloading feed signing key from ${FEED_URL}\033[0m\n"
        exit 1
    fi

    mkdir -p /etc/apk/repositories.d
    FEED_LINE="${FEED_URL}/${VERSION}/${TARGET}/${SUBTARGET}/packages.adb"
    if ! grep -qsFx "$FEED_LINE" /etc/apk/repositories.d/customfeeds.list; then
        echo "$FEED_LINE" >> /etc/apk/repositories.d/customfeeds.list
    fi

    if ! apk update; then
        printf "\033[32;1mError updating package lists. Check that the feed has packages for ${VERSION} ${TARGET}/${SUBTARGET}\033[0m\n"
        exit 1
    fi

    AWG_PACKAGES="kmod-amneziawg amneziawg-tools luci-proto-amneziawg"

    if [ $ASK_FOR_TRANSLATION = 1 ]; then
        printf "\033[32;1mУстанавливаем пакет с русской локализацией? Install Russian language pack? (y/n) [n]: \033[0m\n"
        read INSTALL_RU_LANG
        INSTALL_RU_LANG=${INSTALL_RU_LANG:-n}

        if [ "$INSTALL_RU_LANG" = "y" ] || [ "$INSTALL_RU_LANG" = "Y" ]; then
            AWG_PACKAGES="$AWG_PACKAGES luci-i18n-amneziawg-ru"
        else
            printf "\033[32;1mSkipping Russian language pack installation.\033[0m\n"
        fi
    fi

    if ! apk add $AWG_PACKAGES; then
        printf "\033[32;1mError installing AmneziaWG packages\033[0m\n"
        exit 1
    fi
}

configure_amneziawg_interface() {
    INTERFACE_NAME="awg1"
    CONFIG_NAME="amneziawg_awg1"
    PROTO="amneziawg"
    ZONE_NAME="awg1"

    read -r -p "Enter the private key (from [Interface]):"$'\n' AWG_PRIVATE_KEY_INT

    while true; do
        read -r -p "Enter internal IP address with subnet, example 192.168.100.5/24 (from [Interface]):"$'\n' AWG_IP
        if echo "$AWG_IP" | egrep -oq '^([0-9]{1,3}\.){3}[0-9]{1,3}/[0-9]+$'; then
            break
        else
            echo "This IP is not valid. Please repeat"
        fi
    done

    read -r -p "Enter the public key (from [Peer]):"$'\n' AWG_PUBLIC_KEY_INT
    read -r -p "If use PresharedKey, Enter this (from [Peer]). If your don't use leave blank:"$'\n' AWG_PRESHARED_KEY_INT
    read -r -p "Enter Endpoint host without port (Domain or IP) (from [Peer]):"$'\n' AWG_ENDPOINT_INT

    read -r -p "Enter Endpoint host port (from [Peer]) [51820]:"$'\n' AWG_ENDPOINT_PORT_INT
    AWG_ENDPOINT_PORT_INT=${AWG_ENDPOINT_PORT_INT:-51820}
    if [ "$AWG_ENDPOINT_PORT_INT" = '51820' ]; then
        echo $AWG_ENDPOINT_PORT_INT
    fi

    read -r -p "Enter Jc value (from [Interface]):"$'\n' AWG_JC
    read -r -p "Enter Jmin value (from [Interface]):"$'\n' AWG_JMIN
    read -r -p "Enter Jmax value (from [Interface]):"$'\n' AWG_JMAX
    read -r -p "Enter S1 value (from [Interface]):"$'\n' AWG_S1
    read -r -p "Enter S2 value (from [Interface]):"$'\n' AWG_S2
    read -r -p "Enter H1 value (from [Interface]):"$'\n' AWG_H1
    read -r -p "Enter H2 value (from [Interface]):"$'\n' AWG_H2
    read -r -p "Enter H3 value (from [Interface]):"$'\n' AWG_H3
    read -r -p "Enter H4 value (from [Interface]):"$'\n' AWG_H4

    read -r -p "Enter S3 value (from [Interface]) [optional, leave blank to skip]:"$'\n' AWG_S3
    read -r -p "Enter S4 value (from [Interface]) [optional, leave blank to skip]:"$'\n' AWG_S4
    read -r -p "Enter I1 value (from [Interface]) [optional, leave blank to skip]:"$'\n' AWG_I1
    read -r -p "Enter I2 value (from [Interface]) [optional, leave blank to skip]:"$'\n' AWG_I2
    read -r -p "Enter I3 value (from [Interface]) [optional, leave blank to skip]:"$'\n' AWG_I3
    read -r -p "Enter I4 value (from [Interface]) [optional, leave blank to skip]:"$'\n' AWG_I4
    read -r -p "Enter I5 value (from [Interface]) [optional, leave blank to skip]:"$'\n' AWG_I5

    uci set network.${INTERFACE_NAME}=interface
    uci set network.${INTERFACE_NAME}.proto=$PROTO
    uci set network.${INTERFACE_NAME}.private_key=$AWG_PRIVATE_KEY_INT
    uci set network.${INTERFACE_NAME}.listen_port='51821'
    uci set network.${INTERFACE_NAME}.addresses=$AWG_IP

    uci set network.${INTERFACE_NAME}.awg_jc=$AWG_JC
    uci set network.${INTERFACE_NAME}.awg_jmin=$AWG_JMIN
    uci set network.${INTERFACE_NAME}.awg_jmax=$AWG_JMAX
    uci set network.${INTERFACE_NAME}.awg_s1=$AWG_S1
    uci set network.${INTERFACE_NAME}.awg_s2=$AWG_S2
    uci set network.${INTERFACE_NAME}.awg_h1=$AWG_H1
    uci set network.${INTERFACE_NAME}.awg_h2=$AWG_H2
    uci set network.${INTERFACE_NAME}.awg_h3=$AWG_H3
    uci set network.${INTERFACE_NAME}.awg_h4=$AWG_H4

    # Новые параметры записываем только если они заданы
    [ -n "$AWG_S3" ] && uci set network.${INTERFACE_NAME}.awg_s3=$AWG_S3
    [ -n "$AWG_S4" ] && uci set network.${INTERFACE_NAME}.awg_s4=$AWG_S4
    [ -n "$AWG_I1" ] && uci set network.${INTERFACE_NAME}.awg_i1=$AWG_I1
    [ -n "$AWG_I2" ] && uci set network.${INTERFACE_NAME}.awg_i2=$AWG_I2
    [ -n "$AWG_I3" ] && uci set network.${INTERFACE_NAME}.awg_i3=$AWG_I3
    [ -n "$AWG_I4" ] && uci set network.${INTERFACE_NAME}.awg_i4=$AWG_I4
    [ -n "$AWG_I5" ] && uci set network.${INTERFACE_NAME}.awg_i5=$AWG_I5

    if ! uci show network | grep -q ${CONFIG_NAME}; then
        uci add network ${CONFIG_NAME}
    fi

    uci set network.@${CONFIG_NAME}[0]=$CONFIG_NAME
    uci set network.@${CONFIG_NAME}[0].name="${INTERFACE_NAME}_client"
    uci set network.@${CONFIG_NAME}[0].public_key=$AWG_PUBLIC_KEY_INT
    uci set network.@${CONFIG_NAME}[0].preshared_key=$AWG_PRESHARED_KEY_INT
    uci set network.@${CONFIG_NAME}[0].route_allowed_ips='1'
    uci set network.@${CONFIG_NAME}[0].persistent_keepalive='25'
    uci set network.@${CONFIG_NAME}[0].endpoint_host=$AWG_ENDPOINT_INT
    uci set network.@${CONFIG_NAME}[0].allowed_ips='0.0.0.0/0'
    uci add_list network.@${CONFIG_NAME}[0].allowed_ips='::/0'
    uci set network.@${CONFIG_NAME}[0].endpoint_port=$AWG_ENDPOINT_PORT_INT
    uci commit network

    if ! uci show firewall | grep -q "@zone.*name='${ZONE_NAME}'"; then
        printf "\033[32;1mZone Create\033[0m\n"
        uci add firewall zone
        uci set firewall.@zone[-1].name=$ZONE_NAME
        uci set firewall.@zone[-1].network=$INTERFACE_NAME
        uci set firewall.@zone[-1].forward='REJECT'
        uci set firewall.@zone[-1].output='ACCEPT'
        uci set firewall.@zone[-1].input='REJECT'
        uci set firewall.@zone[-1].masq='1'
        uci set firewall.@zone[-1].mtu_fix='1'
        uci set firewall.@zone[-1].family='ipv4'
        uci commit firewall
    fi

    if ! uci show firewall | grep -q "@forwarding.*name='${ZONE_NAME}'"; then
        printf "\033[32;1mConfigured forwarding\033[0m\n"
        uci add firewall forwarding
        uci set firewall.@forwarding[-1]=forwarding
        uci set firewall.@forwarding[-1].name="${ZONE_NAME}-lan"
        uci set firewall.@forwarding[-1].dest=${ZONE_NAME}
        uci set firewall.@forwarding[-1].src='lan'
        uci set firewall.@forwarding[-1].family='ipv4'
        uci commit firewall
    fi

    service network restart
}

ASK_FOR_TRANSLATION=1
ASK_FOR_INTERFACE_CONFIG=1

while getopts ":ehn" opt; do
    case "$opt" in
        h) usage ;;
        e) ASK_FOR_TRANSLATION=0 ;;
        n) ASK_FOR_INTERFACE_CONFIG=0 ;;
        \?) echo "Unknown option -$OPTARG" >&2; usage ;;
    esac
done
shift "$((OPTIND-1))"

require_apk
check_repo

install_awg_packages

if [ "$ASK_FOR_INTERFACE_CONFIG" = 0 ]; then
    exit 0
fi

printf "\033[32;1mDo you want to configure the amneziawg interface? (y/n): \033[0m\n"
read IS_SHOULD_CONFIGURE_AWG_INTERFACE

if [ "$IS_SHOULD_CONFIGURE_AWG_INTERFACE" = "y" ] || [ "$IS_SHOULD_CONFIGURE_AWG_INTERFACE" = "Y" ]; then
    configure_amneziawg_interface
else
    printf "\033[32;1mSkipping amneziawg interface configuration.\033[0m\n"
fi

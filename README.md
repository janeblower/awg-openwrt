![Downloads](https://img.shields.io/github/downloads/janeblower/awg-openwrt/total.svg)

# Пакеты amneziawg для роутеров с прошивкой OpenWRT

## AWG 3.1

Пакеты собираются из AmneziaWG 3.1: модуль ядра `v3.1.20260812`, утилиты `v3.1.20260812`.

В дополнение к параметрам 2.0 доступны:

| Параметр                    | Опция UCI                         | Описание                                     |
| --------------------------- | --------------------------------- | -------------------------------------------- |
| `HeaderProtectionKey`       | `awg_header_protection_key`       | Base64-ключ для обфускации заголовков пакетов |
| `ContentPaddingAddition`    | `awg_content_padding_addition`    | Дополнительное дополнение транспортных пакетов |
| `RekeyAfterTime`            | `awg_rekey_after_time`            | Время до пересогласования сессии, сек        |
| `RekeyTimeout`              | `awg_rekey_timeout`               | Пауза между попытками рукопожатия, сек       |
| `RejectAfterTime`           | `awg_reject_after_time`           | Время жизни сессии, сек                      |
| `KeepaliveTimeout`          | `awg_keepalive_timeout`           | Простой до отправки keepalive, сек           |
| `MaxHandshakeAttempts`      | `awg_max_handshake_attempts`      | Количество попыток рукопожатия               |

Параметры `H1`—`H4`, `PersistentKeepalive` и все перечисленные выше принимают
как одно значение, так и диапазон вида `10-20` — конкретное значение выбирается
случайно в заданных пределах.

В 3.1 добавлены два переключателя:

| Параметр         | Опция UCI             | Описание                                                       |
| ---------------- | --------------------- | -------------------------------------------------------------- |
| `RandomTrailers` | `awg_random_trailers` | Дописывает в конец каждого пакета случайное число байт          |
| `DisableCookies` | `awg_disable_cookies` | Не отвечать cookie-сообщениями на рукопожатия под нагрузкой      |

`RandomTrailers` меняет размеры пакетов, поэтому должен быть включён на обеих
сторонах туннеля: сторона с выключенным параметром отбросит рукопожатие с
«лишними» байтами. Для транспортных пакетов он действует, только если не задан
`ContentPaddingAddition`. `DisableCookies` влияет лишь на исходящие ответы и
заодно отключает встроенную защиту от флуда рукопожатиями.

## Custom package feed (GitHub Pages)

Репозиторий также публикует полноценный [OpenWRT package feed](https://janeblower.github.io/awg-openwrt/)
для apk на OpenWrt 25.x и новее.

[Подробная документация](docs/custom-feed.md)

## Автоматическая настройка AmneziaWG для OpenWRT 25.x

1. Если ваш роутер обладает достаточным объмом доступной ROM, рекомендую воспользоваться скриптом, описанным ниже, только для установки нужных пакетов, а для точечной маршрутизации траффика в туннель использовать podkop от пользователя [@itdoginfo](https://github.com/itdoginfo) - тут в [документации](https://podkop.net/docs/tunnels/awg_settings/) описан процесс настройки

2. Если вам нужно только установить пакеты, я добавил скрипт amneziawg-install - он автоматически скачает пакеты из этого репозитория под ваше устройство (только для стабильной версии OpenWRT), а также предложит сразу настроить интерфейс с протоколом AmneziaWG. Если пользователь согласится, нужно будет ввести параметры конфига, которые запросит скрипт. При этом скрипт создаст интерфейс, настроит для него правила фаерволла, а также **включит перенаправление всего траффика через тунель AmneziaWG** (установит в настройках Peer галочку Route Allowed IPs).
   Для запуска скрипта подключитесь к роутеру по SSH, введите команду и следуйте инструкциям на экране:

```
sh <(wget -O - https://raw.githubusercontent.com/janeblower/awg-openwrt/refs/heads/master/amneziawg-install.sh)
```

3. Также предусмотрен неинтерактивный режим простой установки пакетов (без вопросов о настройке интерфейса с протоколом AmneziaWG и установке пакета `luci-i18n-amneziawg-ru`):

```
sh <(wget -O - https://raw.githubusercontent.com/janeblower/awg-openwrt/refs/heads/master/amneziawg-install.sh) -en
```

4. Кроме того для автоматической настройки также можно использовать [скрипт](https://github.com/itdoginfo/domain-routing-openwrt) от пользователя [@itdoginfo](https://github.com/itdoginfo). Этот скрипт позволяет автоматически скачать нужные пакеты из собранных здесь и настроить [точечный обход блокировок по доменам](https://habr.com/ru/articles/767464/). Подойдёт, если у вас слабый роутер с недостаточным объёмом ROM для установки podkop-a и зависимостей

## Сборка пакетов для всех устройств, поддерживающих OpenWRT

В репозиторий добавлен скрипт, который парсит данные о поддерживаемых платформах со страницы OpenWRT и автоматически запускает сборку пакетов AmneziaWG для всех устройств.
На данный момент собраны пакеты AWG 3.1 для всех устройств для версий OpenWRT:

1. [25.12.0](https://github.com/janeblower/awg-openwrt/releases/tag/v25.12.0)
2. [25.12.1](https://github.com/janeblower/awg-openwrt/releases/tag/v25.12.1)
3. [25.12.2](https://github.com/janeblower/awg-openwrt/releases/tag/v25.12.2)
4. [25.12.3](https://github.com/janeblower/awg-openwrt/releases/tag/v25.12.3)
5. [25.12.4](https://github.com/janeblower/awg-openwrt/releases/tag/v25.12.4)
6. [25.12.5](https://github.com/janeblower/awg-openwrt/releases/tag/v25.12.5)

## Выбор пакетов для своего устройства

В соответствии с пунктом [Указываем переменные для сборки](https://github.com/itdoginfo/domain-routing-openwrt/wiki/Amnezia-WG-Build#%D1%83%D0%BA%D0%B0%D0%B7%D1%8B%D0%B2%D0%B0%D0%B5%D0%BC-%D0%BF%D0%B5%D1%80%D0%B5%D0%BC%D0%B5%D0%BD%D0%BD%D1%8B%D0%B5-%D0%B4%D0%BB%D1%8F-%D1%81%D0%B1%D0%BE%D1%80%D0%BA%D0%B8)
определить `target` и `subtarget` вашего устройства. Далее перейти на страницу релиза, соответствующего вашей версии OpenWRT, затем поиском по странице (Ctrl+F) найти пакеты, название которых оканчивается на `target_subtarget.apk`: `kmod-amneziawg`, `amneziawg-tools`, `luci-proto-amneziawg` и русификацию `luci-i18n-amneziawg-ru`

## Как запустить сборку для всех поддерживаемых устройств

1. Создать форк этого репозитория
2. Переключиться на вкладку Actions и включить Github actions (по умолчанию для форков они выключены)
3. Затем перейти на вкладку Code => Releases (в правой части экрана) => Draft a new release
4. Нажать Choose a tag и создать новый тег формата vX.X.X, где вместо X.X.X нужно подставить требуемую версию OpenWRT, например, v25.12.5
5. Выбрать в качестве target ветку `master`
6. Ввести Release title
7. Нажать внизу зеленую кнопку Publish release

Для публичных репозиториев Github предоставляет неограниченное по времени использование раннеров, у меня запускалось до 20 параллельных джоб. Каждая джоба выполняется около 10-15 минут, общее время на сборку около 60 минут.

## Сборка пакетов под определенную платформу

AWG 3.1 собирается под конкретную платформу так:

1. Создать форк этого репозитория
2. Переключиться на вкладку Actions и включить Github actions (по умолчанию для форков они выключены)
3. Слева в списке экшенов выбрать экшен Create Release on Tag
4. Справа нажать кнопку Run workflow
5. В открывшемся списке указать версию OpenWRT (например, 25.12.5), список target, разделенных запятыми (например, mediatek,ramips), список subtarget, разделенных запятыми (например, filogic,mt7621). Сборка будет произведена только для существующих пар target/subtarget
6. Нажать зеленую кнопку Run workflow

Сборка под одно устройство займет около 10-15 минут, по её итогам создастся релиз с указанной версией OpenWRT.

Чтобы вместе с релизом обновился и apk-feed на GitHub Pages, тем же способом запустите экшен Build OpenWrt Feed — он публикует пакеты и метаданные в ветку `gh-pages`. Для подписи метаданных нужны секреты `AWG_FEED_APK_PRIVATE_KEY` и `AWG_FEED_APK_PUBLIC_KEY`, как их сгенерировать — в [документации по feed](docs/custom-feed.md).

## AWG 3.1

Packages are built from AmneziaWG 3.1: kernel module `v3.1.20260812`, tools `v3.1.20260812`.

In addition to the 2.0 parameters the following are available:

| Parameter                   | UCI option                        | Description                              |
| --------------------------- | --------------------------------- | ---------------------------------------- |
| `HeaderProtectionKey`       | `awg_header_protection_key`       | Base64 key used to obfuscate packet headers |
| `ContentPaddingAddition`    | `awg_content_padding_addition`    | Extra padding for transport packets      |
| `RekeyAfterTime`            | `awg_rekey_after_time`            | Seconds before a session is renegotiated |
| `RekeyTimeout`              | `awg_rekey_timeout`               | Seconds between handshake retries        |
| `RejectAfterTime`           | `awg_reject_after_time`           | Session lifetime in seconds              |
| `KeepaliveTimeout`          | `awg_keepalive_timeout`           | Idle seconds before a keepalive is sent  |
| `MaxHandshakeAttempts`      | `awg_max_handshake_attempts`      | Handshake attempts before giving up      |

`H1`—`H4`, `PersistentKeepalive` and all of the above accept either a single
value or a range such as `10-20`, in which case the effective value is picked
randomly within those bounds.

Two switches were added in 3.1:

| Parameter        | UCI option            | Description                                             |
| ---------------- | --------------------- | ------------------------------------------------------- |
| `RandomTrailers` | `awg_random_trailers` | Appends a random number of bytes to every packet        |
| `DisableCookies` | `awg_disable_cookies` | Do not answer handshakes with cookie messages under load |

`RandomTrailers` changes packet sizes, so it has to be enabled on both ends of
the tunnel: a peer with the option off drops handshakes carrying the extra
bytes. For transport packets it only applies when `ContentPaddingAddition` is
not set. `DisableCookies` affects outgoing replies only and also turns off the
built-in handshake flood protection.

## Automatic configuration of AmneziaWG for OpenWRT 25.x

1. If your router has enough available ROM, I recommend using the script described below only to install the necessary packages, and use podkop from user [@itdoginfo](https://github.com/itdoginfo) for selective traffic routing into the tunnel - the setup process is described in the [documentation](https://podkop.net/docs/tunnels/awg_settings/)

2. If you only need to install packages, I added the amneziawg-install script - it will automatically download packages from this repository for your device (only for the stable version of OpenWRT), and also offer to immediately configure the interface with the AmneziaWG protocol. If the user agrees, you will need to enter the config parameters that the script will request. The script will create an interface, configure firewall rules for it, and also **enable redirection of all traffic through the AmneziaWG tunnel** (check the Route Allowed IPs box in the Peer settings).
   To run the script, connect to the router via SSH, enter the command and follow the instructions on the screen:

```
sh <(wget -O - https://raw.githubusercontent.com/janeblower/awg-openwrt/refs/heads/master/amneziawg-install.sh)
```

3. There is also a non-interactive mode for simple package installation (without questions about configuring an interface with the AmneziaWG protocol and installing the `luci-i18n-amneziawg-ru` package):

```
sh <(wget -O - https://raw.githubusercontent.com/janeblower/awg-openwrt/refs/heads/master/amneziawg-install.sh) -en
```

4. In addition, for automatic configuration you can also use the [script](https://github.com/itdoginfo/domain-routing-openwrt) from user [@itdoginfo](https://github.com/itdoginfo). This script allows you to automatically download the necessary packages from those collected here and configure [point-by-point bypass of blocking by domains](https://habr.com/ru/articles/767464/) (instructions in Russian). Suitable if you have a weak router with insufficient ROM to install podkop and its dependencies

# Building packages for all devices that support OpenWRT

A script has been added to the repository that parses data on supported platforms from the OpenWRT page and automatically starts building AmneziaWG packages for all devices.
AWG 3.1 packages are currently built for all devices for these OpenWRT versions:

1. [25.12.0](https://github.com/janeblower/awg-openwrt/releases/tag/v25.12.0)
2. [25.12.1](https://github.com/janeblower/awg-openwrt/releases/tag/v25.12.1)
3. [25.12.2](https://github.com/janeblower/awg-openwrt/releases/tag/v25.12.2)
4. [25.12.3](https://github.com/janeblower/awg-openwrt/releases/tag/v25.12.3)
5. [25.12.4](https://github.com/janeblower/awg-openwrt/releases/tag/v25.12.4)
6. [25.12.5](https://github.com/janeblower/awg-openwrt/releases/tag/v25.12.5)

## Selecting packages for your device

In accordance with the paragraph [Specify variables for builds](https://github.com/itdoginfo/domain-routing-openwrt/wiki/Amnezia-WG-Build#%D1%83%D0%BA%D0%B0%D0%B7%D1%8B%D0%B2%D0%B0%D0%B5%D0%BC-%D0%BF%D0%B5%D1%80%D0%B5%D0%BC%D0%B5%D0%BD%D0%BD%D1%8B%D0%B5-%D0%B4%D0%BB%D1%8F-%D1%81%D0%B1%D0%BE%D1%80%D0%BA%D0%B8) (instructions in Russian) determine `target` and `subtarget` of your device. Then go to the release page corresponding to your OpenWRT version, then search the page (Ctrl+F) for the packages whose names end in `target_subtarget.apk`: `kmod-amneziawg`, `amneziawg-tools`, `luci-proto-amneziawg` and the `luci-i18n-amneziawg-ru` translation

## How to run a build for all supported devices

1. Create a fork of this repository
2. Switch to the Actions tab and enable Github actions (they are disabled for forks by default)
3. Then go to the Code tab => Releases (on the right side of the screen) => Draft a new release
4. Click Choose a tag and create a new tag in the vX.X.X format, where you need to substitute the required OpenWRT version for X.X.X, for example, v25.12.5
5. Select the `master` branch as the target
6. Enter Release title
7. Click the green Publish release button at the bottom

For public repositories, Github provides unlimited use of runners, I had up to 20 parallel jobs running. Each job takes about 10-15 minutes, the total build time is about 60 minutes.

## Building packages for a specific platform

AWG 3.1 is built for a specific platform as follows:

1. Create a fork of this repository
2. Switch to the Actions tab and enable Github actions (they are disabled for forks by default)
3. On the left in the list of actions, select the Create Release on Tag action
4. On the right, click the Run workflow button
5. In the opened list, specify the OpenWRT version (for example, 25.12.5), a list of targets separated by commas (for example, mediatek,ramips), a list of subtargets separated by commas (for example, filogic,mt7621). The build will be performed only for existing target/subtarget pairs
6. Click the green Run workflow button

Building for one device will take about 10-15 minutes and creates a release for the specified OpenWRT version.

To refresh the GitHub Pages apk feed along with the release, run the Build OpenWrt Feed action the same way — it publishes packages and metadata to the `gh-pages` branch. Signing the metadata requires the `AWG_FEED_APK_PRIVATE_KEY` and `AWG_FEED_APK_PUBLIC_KEY` secrets, see the [feed documentation](docs/custom-feed.md) for how to generate them.

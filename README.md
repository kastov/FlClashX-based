<div>

[**English**](README_EN.md)

</div>

## FlClashX

[![Downloads](https://img.shields.io/github/downloads/pluralplay/FlClashX/total?style=flat-square&logo=github)](https://github.com/pluralplay/FlClashX/releases/)[![Last Version](https://img.shields.io/github/release/pluralplay/FlClashX/all.svg?style=flat-square)](https://github.com/pluralplay/FlClashX/releases/)[![License](https://img.shields.io/github/license/pluralplay/FlClashX?style=flat-square)](LICENSE)

[![Channel](https://img.shields.io/badge/Telegram-Channel-blue?style=flat-square&logo=telegram)](https://t.me/FlClashX)

Форк многоплатформенного прокси-клиента FlClash на основе ClashMeta, простого и удобного в использовании, с открытым исходным кодом и без рекламы.

Десктопный вид:
<p style="text-align: center;">
    <img alt="desktop" src="snapshots/desktop.gif">
</p>

Мобильный вид:
<p style="text-align: center;">
    <img alt="mobile" src="snapshots/mobile.gif">
</p>

## Добавленный функционал

✈️ Передача HWID в панель (Работает только с <a href="https://github.com/remnawave/panel">Remnawave</a>)

💻 Добавлен новый виджет "Анонсы". Передаёт анонсы из панели в виджет. (Работает только с <a href="https://github.com/remnawave/panel">Remnawave</a>)



## Использование

### Linux

⚠️ Перед использованием убедитесь, что установлены следующие зависимости:

   ```bash
    sudo apt-get install libayatana-appindicator3-dev
    sudo apt-get install libkeybinder-3.0-dev
   ```

### Android

Поддерживаются следующие действия:

   ```bash
    com.follow.clashx.action.START
    
    com.follow.clashx.action.STOP
    
    com.follow.clashx.action.CHANGE
   ```

## Скачать

<a href="https://github.com/pluralplay/FlClashX/releases"><img alt="Get it on GitHub" src="snapshots/get-it-on-github.svg" width="200px"/></a>

## Обновите подмодули:

1. Update submodules
   ```bash
   git submodule update --init --recursive
   ```

2. Установите `Flutter` и `Golang`

3. Соберите приложение:

    - android

        1. Установите  `Android SDK` ,  `Android NDK`

        2. Установите переменную окружения `ANDROID_NDK`

        3. Запустите скрипт сборки:

           ```bash
           dart .\setup.dart android
           ```

    - windows

        1. Требуется компьютер с Windows

        2. Установите   `Gcc` и `Inno Setup`

        3. Запустите скрипт сборки:

           ```bash
           dart .\setup.dart windows --arch <arm64 | amd64>
           ```

    - linux

        1. Требуется компьютер с Linux.

        2. Запустите скрипт сборки:

           ```bash
           dart .\setup.dart linux --arch <arm64 | amd64>
           ```

    - macOS

        1. Требуется компьютер с macOS.

        2. Запустите скрипт сборки:

           ```bash
           dart .\setup.dart macos --arch <arm64 | amd64>
           ```

## Star

Самый простой способ поддержать разработчиков — нажать на звездочку (⭐) в верхней части страницы.

<p style="text-align: center;">
<a href="https://api.star-history.com/svg?repos=pluralplay/FlClashX&Date">
<img alt="start" width=50% src="https://api.star-history.com/svg?repos=pluralplay/FlClashX&Date"/>
</a>
</p>
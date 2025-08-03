<div>

[**English**](README_EN.md)

</div>

## FlClashX

[![Downloads](https://img.shields.io/github/downloads/pluralplay/FlClashX/total?style=flat-square&logo=github)](https://github.com/pluralplay/FlClashX/releases/)
[![Last Version](https://img.shields.io/github/release/pluralplay/FlClashX/all.svg?style=flat-square)](https://github.com/pluralplay/FlClashX/releases/)
[![License](https://img.shields.io/github/license/pluralplay/FlClashX?style=flat-square)](LICENSE)

[![Channel](https://img.shields.io/badge/Telegram-Chat-blue?style=flat-square&logo=telegram)](https://t.me/FlClashX)

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
🛠️ Исправлены стандартные настройки: режим поиска процессов вкл, режим tun вкл, режим системного прокси выкл, режим отображения списка прокси list

🇷🇺 Добавлен русский язык в установщик и переработана локаль в приложении

✈️ Передача HWID в панель (Работает только с <a href="https://github.com/remnawave/panel">Remnawave</a>)

💻 Добавлен новый виджет "Анонсы". Передаёт анонсы из панели в виджет. (Работает только с <a href="https://github.com/remnawave/panel">Remnawave</a>)

📺 Оптимизация управления на Android TV
   + добавлена кнопка "Вставить" для меню добавления подписки по ссылке
   + добавлена кнопка выбора профиля 
   + добавлена передача профиля с мобильного приложения через QR-код

🌐 Добавлен парсинг кастомных хедеров со страницы подписки:
   + flclashx-widgets: выстраивает виджеты в порядке, полученным с подписки

| Значение  | Виджет |
| :---: | ------------- |
| `announce`  | Анонсы  |
| `networkSpeed`  | Скорость сети  |
| `outboundModeV2`  | Режим работы прокси (новый вид)  |
| `outboundMode`  | Режим работы прокси (старый вид)  |
| `trafficUsage`  | Использование трафика  |
| `networkDetection`  | Определение локации и IP  |
| `tunButton`  | Кнопка TUN (только Desktop)  |
| `vpnButton`  | Кнопка VPN (только Android)  |
| `systemProxyButton`  | Кнопка системного прокси (только Desktop)  |
| `intranetIp`  | Локальный IP-адрес  |
| `memoryInfo`  | Использование памяти  |

Использование:
```bash
    flclashx-widgets: announce,networkSpeed,outboundModeV2,outboundMode,trafficUsage,networkDetection,tunButton,vpnButton,systemProxyButton,intranetIp,memoryInfo
```

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

## Star
<p style="text-align: center;">
Самый простой способ поддержать разработчиков — нажать на звездочку (⭐) в верхней части страницы.<br>
Если хотите поддержать копеечкой, то можно <a href="https://t.me/tribute/app?startapp=dtyh">сделать это тут.</a></p>

**TON USDT:** `UQDSfrJ_k1BdsknhdR_zj4T3Is3OdMylD8PnDJ9mxO35i-TE`


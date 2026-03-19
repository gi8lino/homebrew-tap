# gi8lino/homebrew-tap

Homebrew tap for EasyBar and WiFiSnitch.

## Install

Add the tap:

```bash
brew tap gi8lino/tap
```

Install EasyBar:

```bash
brew install gi8lino/tap/easybar
```

Install WiFiSnitch:

```bash
brew install gi8lino/tap/wifisnitch
```

This installs for EasyBar:

- `EasyBar.app` inside the Homebrew Cellar
- `easybar` to launch EasyBar
- `easybarctl` for CLI control and IPC commands

This installs for WiFiSnitch:

- `WiFiSnitch.app` inside the Homebrew Cellar
- `wifisnitch` to launch the background agent
- `wifisnitchctl` for CLI access to status and IPC commands

## Start at login with Homebrew

Start EasyBar as a Homebrew-managed user service:

```bash
brew services start easybar
```

Start WiFiSnitch as a Homebrew-managed user service:

```bash
brew services start wifisnitch
```

Stop them:

```bash
brew services stop easybar
brew services stop wifisnitch
```

Restart them:

```bash
brew services restart easybar
brew services restart wifisnitch
```

## Upgrade

```bash
brew upgrade gi8lino/tap/easybar
brew upgrade gi8lino/tap/wifisnitch
brew services restart easybar
brew services restart wifisnitch
```

## Uninstall

```bash
brew services stop easybar
brew services stop wifisnitch
brew uninstall gi8lino/tap/easybar
brew uninstall gi8lino/tap/wifisnitch
```

## Source

Main project repositories:

- `https://github.com/gi8lino/easybar`
- `https://github.com/gi8lino/wifisnitch`

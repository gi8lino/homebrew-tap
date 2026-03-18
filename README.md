# gi8lino/homebrew-tap

Homebrew tap for EasyBar.

## Install

Add the tap:

```bash
brew tap gi8lino/tap
```

Install EasyBar:

```bash
brew install easybar
```

This installs:

- `EasyBar.app` inside the Homebrew Cellar
- `easybar` to launch EasyBar
- `easybarctl` for CLI control and IPC commands

## Start at login with Homebrew

Start EasyBar as a Homebrew-managed user service:

```bash
brew services start easybar
```

Stop it:

```bash
brew services stop easybar
```

Restart it:

```bash
brew services restart easybar
```

## Upgrade

```bash
brew upgrade easybar
brew services restart easybar
```

## Uninstall

```bash
brew services stop easybar
brew uninstall easybar
```

## Source

Main project repository:

- `https://github.com/gi8lino/easybar`

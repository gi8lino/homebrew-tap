cask "easybar" do
  version "0.10.1"
  sha256 "4e4b595cb4923b06ebe3207a281dade544cfd61630d435669e1812cf01d79dfb"

  url "https://github.com/gi8lino/easybar/releases/download/v0.10.1/EasyBar-0.10.1.zip"
  name "EasyBar"
  desc "Scriptable macOS status bar with SwiftUI and Lua widgets"
  homepage "https://github.com/gi8lino/easybar"

  depends_on macos: ">= :sonoma"

  app "EasyBar.app"
  binary "easybar"

  zap trash: [
    "~/.config/easybar",
    "~/.local/state/easybar",
  ]
end

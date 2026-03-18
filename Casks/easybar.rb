cask "easybar" do
  version "0.0.4"
  sha256 "055e3675d751a7ac8d50867ca58a3b8eede17e1ad246575b4775f5adcf658ef2"

  url "https://github.com/gi8lino/easybar/releases/download/v#{version}/EasyBar-#{version}.zip"
  name "EasyBar"
  desc "Scriptable macOS status bar with SwiftUI and Lua widgets"
  homepage "https://github.com/gi8lino/easybar"

  depends_on macos: ">= :sonoma"

  app "EasyBar.app"
  binary "easybarctl", target: "easybar"

  zap trash: [
    "~/Library/Logs/EasyBar.log",
  ]
end

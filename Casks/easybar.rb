cask "easybar" do
  version "0.0.29"
  sha256 "5ec95de3823980f43a620b5b61d3c90e403eb994a067d6d93e4a3b1d8643dd12"

  url "https://github.com/gi8lino/easybar/releases/download/v0.0.29/EasyBar-0.0.29.zip"
  name "EasyBar"
  desc "Scriptable macOS status bar with SwiftUI and Lua widgets"
  homepage "https://github.com/gi8lino/easybar"

  depends_on macos: ">= :sonoma"

  app "EasyBar.app"

  # Install the bundled CLI next to the app.
  binary "easybarctl"
end
